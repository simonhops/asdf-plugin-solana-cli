<div align="center">

# asdf-plugin-solana [![Build](https://github.com/simonhops/asdf-plugin-solana/actions/workflows/build.yml/badge.svg)](https://github.com/simonhops/asdf-plugin-solana/actions/workflows/build.yml) [![Lint](https://github.com/simonhops/asdf-plugin-solana/actions/workflows/lint.yml/badge.svg)](https://github.com/simonhops/asdf-plugin-solana/actions/workflows/lint.yml)

[solana](https://docs.anza.xyz/cli/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [System Dependencies](#system-dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# System Dependencies

- `bash`, `curl`, `tar`, `jq`, `bzip2` and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

```shell
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
  bash curl tar bzip2 \
  libssl-dev libudev-dev pkg-config zlib1g-dev \
  llvm clang cmake make \
  libprotobuf-dev protobuf-compiler libclang-dev \
  build-essential
```

# Install

Plugin:

```shell
asdf plugin add solana https://github.com/simonhops/asdf-plugin-solana.git
```

solana:

```shell
# Show all installable versions
asdf list all solana

# Install latest version
asdf install solana latest

# Install specific version
asdf install solana $version

# Set a version globally (on your ~/.tool-versions file)
asdf set --home solana latest

# Set a version locally (on your ~/.tool-versions file)
asdf set solana latest

# List all installed versions
asdf list solana

# Uninstall specific version
asdf uninstall solana $version

# Now solana commands are available
solana --help

# Remove plugin again
asdf plugin remove solana
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to install & manage versions.

Or even better: Use [mise](https://mise.jdx.dev/getting-started.html)

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/simonhops/asdf-plugin-solana/graphs/contributors)!

# License

See [LICENSE](LICENSE)
