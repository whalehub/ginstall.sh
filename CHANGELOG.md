# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0] - 2020-06-02
### Added
- Support for [FZF](https://github.com/junegunn/fzf).

### Changed
- A standardized message is now printed when an app is successfully installed/uninstalled.

### Fixed
- Remove duplicate instance of the uninstallation definition for Go.

## [1.4.0] - 2020-05-30
### Added
- Support for [Bitwarden CLI](https://github.com/bitwarden/cli).

## [1.3.0] - 2020-05-30
### Added
- Support for [Blocky](https://github.com/0xERR0R/blocky).
- The `--first-run` flag to install `ginstall.sh`'s dependency `gget` via curl.

### Changed
- A confirmation prompt is now displayed when the `--remove` flag is used with the argument `gget`.

## [1.2.0] - 2020-05-30
### Added
- Support for [Traefik](https://github.com/containous/traefik) and [Hey](https://github.com/rakyll/hey).
- The flag `--remove` which allows a user to uninstall a supported application.

### Fixed
- Revert changes to the internal logic of the `--check` flag for more robust error handling.

## [1.1.0] - 2020-05-30
### Added
- Support for [Caddy](https://github.com/caddyserver/caddy).

### Changed
- Rename `tldr` to `tldr++` to avoid confusion with the [reference tldr client](https://github.com/tldr-pages/tldr).
- Massively simplify the internal logic for the `--check` flag.

## [1.0.0] - 2020-05-30
- Initial release
