# asdf-homebrew-php

Homebrew‑based PHP plugin for **asdf** and **mise**.

This plugin installs PHP using the official `shivammathur/homebrew-php` tap, and exposes the correct `php` and `composer` binaries via asdf/mise.

> **macOS only** — This plugin depends on Homebrew and does not support Linux.

---

## Requirements

* macOS (Apple Silicon or Intel)
* [Homebrew](https://brew.sh/)
* asdf **or** mise

Homebrew tap is added automatically when needed.

---

## Installation (asdf)

```bash
asdf plugin add homebrew-php https://github.com/naviapps/asdf-homebrew-php.git
```

Install PHP via Homebrew:

```bash
asdf install homebrew-php latest
# or
asdf install homebrew-php 8.4
```

Activate:

```bash
asdf global homebrew-php latest
php -v
composer -V
```

---

## Installation (mise)

```bash
mise plugins install homebrew-php https://github.com/naviapps/asdf-homebrew-php.git
```

Use:

```bash
mise use --global homebrew-php@latest
php -v
```

> Note: Even though the tool name is `homebrew-php`, the command is always `php`.

---

## How versions work

* `latest` → resolves to Homebrew’s current `php` alias (e.g. `8.4`)
* Specific versions must match Homebrew formulae (`php@8.3`, `php@8.4`, …)
* Run:

```bash
asdf list-all homebrew-php
# or
mise list-remote homebrew-php
```

---

## Composer

Composer is installed automatically **per PHP installation**.

It becomes available as:

```bash
composer -V
```

Global composer vendor binaries also work automatically.

---

## Limitations

* macOS only
* Depends entirely on the `shivammathur/homebrew-php` tap
* Only versions available in that tap can be installed
* PHP extensions (intl, gd, imagick etc.) must be installed separately via Homebrew or pecl if needed
