# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.3] - 2020-06-09
### Fixed
- A bug which made `ginstall.sh` print more information than needed when a user tries to install an unsupported application with the version argument "latest".

## [2.0.2] - 2020-06-09
### Fixed
- A bug that was preventing `gget` from parsing release version tags that are not prefixed with a "v".
- Added a workaround for installing the latest version of ffmpeg if the latest version number is used as an argument instead of "latest".

## [2.0.1] - 2020-06-09
### Fixed
- A bug that was preventing the `--remove` flag from working on `komga` due to its file extension `.jar`.

## [2.0.0] - 2020-06-08
### Added
- A sanity check to verify that `ginstall.sh`'s dependency `gget` is installed in the user's `PATH` when using a flag that requires it.
- A sanity check that makes `ginstall.sh` exit safely if the `INSTALL_DIR_APP` or `INSTALL_DIR_GO` variable is empty (this can never happen during regular use, it's just a matter of good practice).
- A sanity check to make sure that the `--directory` flag is used with a valid argument or secondary flag.

### Changed
- The `--check` flag now only outputs an application's latest version number instead of the tag and commit hash.
- The installation directory that an application was installed in is now printed along with the version number if the installation is successful.
- The output of the `--help` flag was rewritten from scratch to be more user-friendly.
- The `--remove` flag can now remove applications that were installed to a custom directory as long as the directory is in the user's `PATH`.
- The `--check` flag and the version argument `latest` now work for all of the applications that are supported by `ginstall.sh`.
- The `--first-run` flag, just like the app argument, can now be prefixed with the `--directory` flag to specify a custom installation directory.

### Removed
- The `--first-run-dir` and `--rm-from-dir` flags as they are now obsolete.

## [1.8.0] - 2020-06-08
### Added
- Support for [Delta](https://github.com/dandavison/delta).
- Support for [Exa](https://github.com/ogham/exa).
- Support for [K9S](https://github.com/derailed/k9s).
- Support for [Statping](github.com/statping/statping).

### Changed
- The supported applications are now grouped by their first letter for better readability.

### Fixed
- Installing `filebrowser` and `qrcp` no longer extracts `README` and `LICENSE` files.

## [1.7.0] - 2020-06-03
### Added
- Support for [Annie](https://github.com/iawia002/annie).
- Support for [Caire](https://github.com/esimov/caire).
- Support for [CoreDNS](https://github.com/coredns/coredns).
- Support for [Dive](https://github.com/wagoodman/dive).
- Support for [DNSCrypt Proxy](https://github.com/DNSCrypt/dnscrypt-proxy).
- Support for [FileBrowser](https://github.com/filebrowser/filebrowser).
- Support for [FRP](https://github.com/fatedier/frp)'s two components `frpc` and `frps`.
- Support for [Google Drive CLI](https://github.com/gdrive-org/gdrive).
- Support for [GitHub CLI](https://github.com/cli/cli).
- Support for [Gogs](https://github.com/gogs/gogs).
- Support for [GoReleaser](https://github.com/goreleaser/goreleaser).
- Support for [GoTTY](https://github.com/yudai/gotty).
- Support for [HTTPStat](https://github.com/davecheney/httpstat).
- Support for [Inlets](https://github.com/inlets/inlets).
- Support for [K3S](https://github.com/rancher/k3s).
- Support for [Kompose](https://github.com/kubernetes/kompose).
- Support for [Micro](https://github.com/zyedidia/micro).
- Support for [Pgweb](https://github.com/sosedoff/pgweb).
- Support for [Podman](https://github.com/containers/libpod).
- Support for [QRCP](https://github.com/claudiodangelis/qrcp).
- Support for [Restic](https://github.com/restic/restic).
- Support for [Slack-Term](https://github.com/erroneousboat/slack-term).
- Support for [TransferSH](https://github.com/dutchcoders/transfer.sh).
- Support for [Watchtower](https://github.com/containrrr/watchtower).
- Support for [Wuzz](https://github.com/asciimoo/wuzz).

## [1.6.0] - 2020-06-02
### Added
- Support for [ShellCheck](https://github.com/koalaman/shellcheck).
- The flag `--directory` which allows a user to specify a custom installation directory.
- The flag `--first-run-dir` which allows a user to specify a custom installation directory when installing `ginstall.sh`'s dependency `gget` via curl.
- The flag `--rm-from-dir` which allows a user to specify a custom uninstallation directory.

### Changed
- The script's internal logic underwent a major rewrite to significantly improve its error handling and argument parsing capabilities.
- The `rm` command is now verbose when uninstalling an application via `--remove`.
- The `--self-update` flag now allows `ginstall.sh` to update itself without prompting for root/sudo whenever possible.
- The `--help` page now features examples for every valid flag.
- Bump required `gget` version to 0.3.0.

### Fixed
- A bug that was preventing `gget` from being updated via `ginstall.sh gget <version>`.

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
