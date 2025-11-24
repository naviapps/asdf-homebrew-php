# asdf-homebrew-php

## About this plugin

This plugin provides version switching for the official Homebrew PHP builds on macOS. It is designed for environments where Homebrew PHP is already the standard and a source-build backend would add unnecessary complexity or instability, and acts as a Homebrew-based PHP plugin for **asdf** and **mise**.

This plugin installs PHP using the official `shivammathur/homebrew-php` tap, and exposes the `php` and `composer` binaries via asdf/mise.

> **macOS only** — This plugin depends on Homebrew and does not support Linux.

---

## Requirements

* macOS (Apple Silicon or Intel)
* Homebrew (the `shivammathur/php` tap will be added automatically when needed)
* asdf **or** mise

---

## Installation (asdf)

```bash
asdf plugin add homebrew-php https://github.com/naviapps/asdf-homebrew-php.git
```

Install PHP via this plugin (backed by Homebrew):

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
* Specific versions correspond to Homebrew formulae (e.g. use `8.3`, `8.4`, … for `php@8.3`, `php@8.4`, …)
* Run:

```bash
asdf list-all homebrew-php
# or
mise list-remote homebrew-php
```

---

## Composer

Composer is installed automatically **per PHP installation**.
This avoids relying on the Homebrew `composer` formula and ensures each PHP installation has its own isolated Composer environment.

It becomes available as:

```bash
composer -V
```

Global composer vendor binaries also work automatically because `.composer/vendor/bin` is added to `PATH`.

---

## Limitations

* macOS only
* Depends entirely on the `shivammathur/homebrew-php` tap
* Only versions available in that tap can be installed
* PHP extensions (intl, gd, imagick etc.) must be installed separately, for example via Homebrew or pecl

---

## Relation to other PHP plugins

Source‑build PHP plugins for asdf may behave less predictably on macOS because they rely on system libraries that Homebrew updates frequently. This can occasionally cause build failures, especially on newer macOS versions or Apple Silicon.

This plugin uses Homebrew to install PHP, which offers a more consistent and lower-maintenance experience on macOS.

If you encounter issues related to Homebrew PHP versions or installation behavior, please open an issue in this repository.
