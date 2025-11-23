#!/usr/bin/env bash

set -euo pipefail

fail() {
	printf 'asdf-homebrew-php: %s\n' "$*" >&2
	exit 1
}

ensure_homebrew_php_backend_available() {
	if ! command -v brew >/dev/null 2>&1; then
		fail "Homebrew is required"
	fi
	brew tap shivammathur/php >/dev/null 2>&1 || true
}

list_tap_php_minor_versions() {
	brew search shivammathur/php |
		grep -E '^shivammathur/php/php@' |
		sed -E 's#.*/php@([0-9]+\.[0-9]+).*#\1#' |
		sort -V |
		uniq
}

get_stable_php_minor_version() {
	local minor_version
	minor_version="$(
		brew info --json=v2 shivammathur/php/php 2>/dev/null |
			tr -d '\n' |
			sed -nE 's/.*"stable"[[:space:]]*:[[:space:]]*"([0-9]+\.[0-9]+)[^"]*".*/\1/p' ||
			true
	)"

	[ -n "$minor_version" ] && printf '%s\n' "$minor_version"
}

normalize_php_version() {
	local version="$1"

	if [ "$version" = "latest" ]; then
		local stable
		stable="$(get_stable_php_minor_version || true)"
		[ -n "$stable" ] || fail "Could not determine latest stable PHP version"
		printf '%s\n' "$stable"
	else
		printf '%s\n' "$version"
	fi
}

version_lte() {
	local left="$1"
	local right="$2"

	[ "$left" = "$right" ] && return 0

	local first
	first="$(printf '%s\n%s\n' "$left" "$right" | sort -V | head -n1)"
	[ "$first" = "$left" ]
}

list_supported_php_versions() {
	local stable_minor_version
	stable_minor_version="$(get_stable_php_minor_version)"

	local available_minor_versions
	available_minor_versions="$(list_tap_php_minor_versions)"

	{
		printf '%s\n' "$available_minor_versions"
		[ -n "${stable_minor_version:-}" ] && printf '%s\n' "$stable_minor_version"
	} |
		grep -E '^[0-9]+\.[0-9]+$' |
		sort -V |
		uniq |
		while IFS= read -r minor_version; do
			[ -z "$minor_version" ] && continue

			if [ -n "${stable_minor_version:-}" ] && ! version_lte "$minor_version" "$stable_minor_version"; then
				continue
			fi

			printf '%s\n' "$minor_version"
		done
}
