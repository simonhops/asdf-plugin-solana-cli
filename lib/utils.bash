#!/usr/bin/env bash

set -euo pipefail

GH_OWNER="anza-xyz"
GH_PROJECT="agave"
GH_REPO="https://github.com/${GH_OWNER}/${GH_PROJECT}"

TOOL_NAME="solana"
TOOL_TEST="solana --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_releases() {
	curl "${curl_opts[@]}" "https://api.github.com/repos/${GH_OWNER}/${GH_PROJECT}/releases" |
		jq -r '.[].tag_name'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# list_github_releases | sed 's/^v//'
	list_github_tags
}

get_latest_version() {
	local redirect_url

	redirect_curl_opts=(-sI)

	if [ -n "${GITHUB_API_TOKEN:-}" ]; then
		redirect_curl_opts=("${redirect_curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
	fi

	redirect_url=$(curl "${redirect_curl_opts[@]}" "$GH_REPO/releases/latest" | sed -n -e "s|^location: *||p" | sed -n -e "s|\r||p")
	version=
	if [[ "$redirect_url" == "$GH_REPO/releases" ]]; then
		version="$(list_all_versions | sort_versions | tail -n1 | xargs echo)"
	else
		version="$(printf "%s\n" "$redirect_url" | sed 's|.*/tag/v\{0,1\}||')"
	fi

	printf "%s\n" "$version"
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="$GH_REPO/archive/refs/tags/v${version}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		# Install Rust toolchain
		curl https://sh.rustup.rs -sSf | sh -s -- -y
		source "$HOME/.cargo/env"

		# Add rustfmt and ensure toolchain up to date
		rustup component add rustfmt
		rustup update

		cd "$ASDF_DOWNLOAD_PATH"

		# Build all Solana CLI binaries
		./scripts/cargo-install-all.sh .

		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/bin/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
