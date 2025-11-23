<div align="center">

# asdf-homebrew-php [![Build](https://github.com/naviapps/asdf-homebrew-php/actions/workflows/build.yml/badge.svg)](https://github.com/naviapps/asdf-homebrew-php/actions/workflows/build.yml) [![Lint](https://github.com/naviapps/asdf-homebrew-php/actions/workflows/lint.yml/badge.svg)](https://github.com/naviapps/asdf-homebrew-php/actions/workflows/lint.yml)

[homebrew-php](https://github.com/naviapps/asdf-homebrew-php) plugin for the [asdf version manager](https://asdf-vm.com).

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
asdf plugin add homebrew-php
# or
asdf plugin add homebrew-php https://github.com/naviapps/asdf-homebrew-php.git
```

homebrew-php:

```shell
# Show all installable versions
asdf list-all homebrew-php

# Install specific version
asdf install homebrew-php latest

# Set a version globally (on your ~/.tool-versions file)
asdf global homebrew-php latest

# Now homebrew-php commands are available
homebrew-php --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/naviapps/asdf-homebrew-php/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Haruki Fukui](https://github.com/naviapps/)
