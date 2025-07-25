# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

asdf plugin test solana https://github.com/simonhops/asdf-plugin-solana.git --asdf-plugin-gitref feature-branch --asdf-tool-version latest -- solana --help
```

Tests are automatically run in GitHub Actions on push and PR.
