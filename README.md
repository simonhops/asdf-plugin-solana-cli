<div align="center">

# asdf-solana-cli [![Build](https://github.com/simonhops/asdf-solana-cli/actions/workflows/build.yml/badge.svg)](https://github.com/simonhops/asdf-solana-cli/actions/workflows/build.yml) [![Lint](https://github.com/simonhops/asdf-solana-cli/actions/workflows/lint.yml/badge.svg)](https://github.com/simonhops/asdf-solana-cli/actions/workflows/lint.yml)

[solana-cli](https://github.com/simonhops/solana-cli) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add solana-cli
# or
asdf plugin add solana-cli https://github.com/simonhops/asdf-solana-cli.git
```

solana-cli:

```shell
# Show all installable versions
asdf list-all solana-cli

# Install specific version
asdf install solana-cli latest

# Set a version globally (on your ~/.tool-versions file)
asdf global solana-cli latest

# Now solana-cli commands are available
solana-cli --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/simonhops/asdf-solana-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Simon Hofmannn](https://github.com/simonhops/)
