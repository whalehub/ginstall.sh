# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.7.1] - 2020-06-16
### Changed
- The output of the `--list` flag now has a column for displaying the linker type of supported applications.
- The documentation and the output of the `--help` flag have been updated to reflect the aforementioned change.

### Fixed
- A bug that could prevent the successful installation of `ffmpeg` and `go` when using the version argument "latest" under some circumstances.

## [2.7.0] - 2020-06-16
### Added
- A hidden `+debug` option to enable automated tests (only relevant for other developers).
- Support for [Act](https://github.com/nektos/act).
- Support for [Amass](https://github.com/OWASP/Amass).
- Support for [Borg](https://github.com/borgbackup/borg).
- Support for [Dgraph](https://github.com/dgraph-io/dgraph)'s components `dgraph`, `dgraph-ratel` and `badger`.
- Support for [Findomain](https://github.com/Edu4rdSHL/findomain).
- Support for [Gau](https://github.com/lc/gau).
- Support for [Handlr](github.com/chmln/handlr).
- Support for [Hub](https://github.com/github/hub).
- Support for [JQ](https://github.com/stedolan/jq).
- Support for [Pegasus Frontend](https://github.com/mmatyas/pegasus-frontend)'s component `pegasus-fe`.
- Support for [PhoneInfoga](https://github.com/sundowndev/PhoneInfoga).
- Support for [RQLite](https://github.com/rqlite/rqlite)'s components `rqlite`, `rqlited` and `rqbench`.
- Support for [Spotifyd](https://github.com/Spotifyd/spotifyd).
- Support for [Spotify TUI](https://github.com/Rigellute/spotify-tui)'s component `spt`.
- Support for [UNetbootin](https://github.com/unetbootin/unetbootin).
- Support for [Wrangler](https://github.com/cloudflare/wrangler).

## [2.6.1] - 2020-06-14
### Fixed
- A bug that was preventing the successful installation of `autocert`, `jailer` and `gh`.

## [2.6.0] - 2020-06-14
### Added
- Support for [Chisel](https://github.com/jpillora/chisel).
- Support for [Diskus](https://github.com/sharkdp/diskus).
- Support for [Hexyl](https://github.com/sharkdp/hexyl).
- Support for [Hugo Extended](https://github.com/gohugoio/hugo).
- Support for [Insect](https://github.com/sharkdp/insect).
- Support for [Lucid](https://github.com/sharkdp/lucid).
- Support for [Migrate](https://github.com/golang-migrate/migrate).
- Support for [Pastel](https://github.com/sharkdp/pastel).
- Support for [RipGrep-All](https://github.com/phiresky/ripgrep-all)'s components `rga` and `rga-preproc`.
- Support for [Vivid](https://github.com/sharkdp/vivid).

### Changed
- Cut the total size of `ginstall.sh` in half by rewriting the entire application installation section from scratch.
- The binary for `composer` is now installed as `composer.phar` to bring it in line with the language-specific binary extension standard used for `komga`.
- The different components of `age`, `etcd`, `nebula`, `rage`, `rootlesskit` and `vuls` can and must now be installed/uninstalled separately.

### Fixed
- The CLI tools `avif` and `fluxctl` and were erroneously called `go-avif` and `flux` respectively in `ginstall.sh`.

## [2.5.0] - 2020-06-11
### Added
- Support for [Bat](https://github.com/sharkdp/bat).
- Support for [FD](https://github.com/sharkdp/fd).
- Support for [RipGrep](https://github.com/BurntSushi/ripgrep).

## [2.4.0] - 2020-06-11
### Added
- Support for [DNS Proxy](https://github.com/AdguardTeam/dnsproxy).
- Support for [Drive](https://github.com/odeke-em/drive).
- Support for [Frece](https://github.com/YodaEmbedding/frece).
- Support for [Hyperfine](https://github.com/sharkdp/hyperfine).
- Support for [Naabu](https://github.com/projectdiscovery/naabu).
- Support for [Open Policy Agent](github.com/open-policy-agent/opa).
- Support for [Shadowsocks-Rust](https://github.com/shadowsocks/shadowsocks-rust)'s components `sslocal`, `ssmanager`, `ssserver` and `ssurl`.
- Support for [Swagger](https://github.com/go-swagger/go-swagger).
- Support for [Trivy](https://github.com/aquasecurity/trivy).
- Support for [unFTP](https://github.com/bolcom/unFTP).
- Support for [Vector](https://github.com/timberio/vector).
- Support for [Velero](https://github.com/vmware-tanzu/velero).
- Support for [XSV](https://github.com/BurntSushi/xsv).
- Support for [Ytop](https://github.com/cjbassi/ytop).
- Support for [Zenith](https://github.com/bvaisvil/zenith).

### Changed
- Start consolidating application code blocks to eliminate duplicated code throughout the script.

## [2.3.0] - 2020-06-11
### Added
- Support for [ACME-DNS](https://github.com/joohoi/acme-dns).
- Support for [Andesite](https://github.com/nektro/andesite).
- Support for [Apizza](https://github.com/harrybrwn/apizza).
- Support for [Autocert](https://github.com/smallstep/autocert).
- Support for [Bed](https://github.com/itchyny/bed).
- Support for [Bombardier](https://github.com/codesenberg/bombardier).
- Support for [Brig](https://github.com/sahib/brig).
- Support for [CCat](https://github.com/jingweno/ccat).
- Support for [CaptainHook](https://github.com/bketelsen/captainhook).
- Support for [Chroma](https://github.com/alecthomas/chroma).
- Support for [Comics Downloader](https://github.com/Girbons/comics-downloader).
- Support for [Compress](https://github.com/klauspost/compress)' components `s2c` and `s2d`.
- Support for [DDGR](https://github.com/jarun/ddgr).
- Support for [DDNS-Route53](https://github.com/crazy-max/ddns-route53).
- Support for [DNSControl](https://github.com/StackExchange/dnscontrol).
- Support for [Discord-Delete](https://github.com/adversarialtools/discord-delete).
- Support for [DiscordConsole](https://github.com/discordconsole-team/DiscordConsole).
- Support for [Diun](https://github.com/crazy-max/diun).
- Support for [Dobi](https://github.com/dnephin/dobi).
- Support for [Drone CLI](https://github.com/drone/drone-cli).
- Support for [Eureka](https://github.com/mimoo/eureka).
- Support for [FTPGrab](https://github.com/ftpgrab/ftpgrab).
- Support for [FX](https://github.com/metrue/fx).
- Support for [GeoIP-Updater](https://github.com/crazy-max/geoip-updater).
- Support for [Git-Hooks](https://github.com/git-hooks/git-hooks).
- Support for [Git-Rewrite-Author](https://github.com/crazy-max/git-rewrite-author).
- Support for [GitBatch](https://github.com/isacikgoz/gitbatch).
- Support for [Go-AVIF](https://github.com/Kagami/go-avif)'s component `avif`.
- Support for [GoAutoYT](https://github.com/XiovV/Golty).
- Support for [GoatCounter](https://github.com/zgoat/goatcounter).
- Support for [Gomplate](https://github.com/hairyhenderson/gomplate).
- Support for [Gomuks](https://github.com/tulir/gomuks).
- Support for [Googler](https://github.com/jarun/googler).
- Support for [Goploader](https://github.com/Depado/goploader)'s components `gpldr-server` and `gpldr-client`.
- Support for [Gossa](https://github.com/pldubouilh/gossa).
- Support for [Govmomi](https://github.com/vmware/govmomi)'s component `govc`.
- Support for [Intercert](https://github.com/evenh/intercert).
- Support for [IronFunctions](https://github.com/iron-io/functions)' component `fn`.
- Support for [JSON2CSV](https://github.com/jehiah/json2csv/).
- Support for [JSON5](https://github.com/yosuke-furukawa/json5).
- Support for [Jellycli](https://github.com/tryffel/jellycli).
- Support for [Jsteg](https://github.com/lukechampine/jsteg)'s components `jsteg` and `slink`.
- Support for [Linx Server](https://github.com/andreimarcu/linx-server)'s components `linx-server`, `linx-genkey` and `linx-cleanup`.
- Support for [Loki](https://github.com/grafana/loki)'s components `loki`, `logcli` and `promtail`.
- Support for [Louketo Proxy](https://github.com/louketo/louketo-proxy).
- Support for [Magnetico](https://github.com/boramalper/magnetico)'s components `magneticod` and `magneticow`.
- Support for [Matterbridge](https://github.com/42wim/matterbridge).
- Support for [Minify](https://github.com/tdewolff/minify).
- Support for [NNN](https://github.com/jarun/nnn).
- Support for [Navidrome](https://github.com/deluan/navidrome).
- Support for [Niltalk](https://github.com/knadh/niltalk).
- Support for [OAuth2 Proxy](https://github.com/oauth2-proxy/oauth2-proxy).
- Support for [Oragono](https://github.com/oragono/oragono).
- Support for [Parcello](https://github.com/phogolabs/parcello).
- Support for [Peach](https://github.com/peachdocs/peach).
- Support for [Pebble](https://github.com/letsencrypt/pebble)'s components `pebble` and `pebble-challtestsrv`.
- Support for [Pkger](https://github.com/markbates/pkger).
- Support for [Plexdrive](https://github.com/plexdrive/plexdrive).
- Support for [Plik](https://github.com/root-gg/plik)'s components `plik` and `plikd`.
- Support for [Pomerium](https://github.com/pomerium/pomerium)'s components `pomerium` and `pomerium-cli`.
- Support for [RattlesnakeOS-Stack](https://github.com/dan-v/rattlesnakeos-stack).
- Support for [Red](https://github.com/antonmedv/red).
- Support for [Reg](https://github.com/genuinetools/reg).
- Support for [Rio](https://github.com/rancher/rio).
- Support for [RootlessKit](https://github.com/rootless-containers/rootlesskit)'s components `rootlesskit` and `rootlessctl`.
- Support for [SDNS](https://github.com/semihalev/sdns).
- Support for [SSH Auditor](https://github.com/ncsa/ssh-auditor).
- Support for [S](https://github.com/zquestz/s).
- Support for [Simple-VPN](https://github.com/skx/simple-vpn).
- Support for [Stack Up](https://github.com/pressly/sup).
- Support for [Storj](https://github.com/storj/storj)'s components `identity` and `uplink`.
- Support for [Swarm-Cronjob](https://github.com/crazy-max/swarm-cronjob).
- Support for [TXEH](https://github.com/txn2/txeh).
- Support for [TableView](https://github.com/informationsea/tableview).
- Support for [Task](https://github.com/go-task/task).
- Support for [Tengo](https://github.com/d5/tengo).
- Support for [Travis-Wait-Enhanced](https://github.com/crazy-max/travis-wait-enhanced).
- Support for [Up](https://github.com/apex/up).
- Support for [vSphere-InfluxDB-Go](https://github.com/Oxalide/vsphere-influxdb-go).
- Support for [YQ](https://github.com/mikefarah/yq).

## Changed
- The `unzip` command is now executed silently with the `-q` flag.

## [2.2.0] - 2020-06-10
### Added
- Support for [AdGuard Home](https://github.com/AdguardTeam/AdGuardHome).
- Support for [Age](https://github.com/FiloSottile/age)'s components `age` and `age-keygen`.
- Support for [Archiver](https://github.com/mholt/archiver).
- Support for [Argo CD](https://github.com/argoproj/argo-cd).
- Support for [Cloud Torrent](https://github.com/jpillora/cloud-torrent).
- Support for [Cobalt](https://github.com/cobalt-org/cobalt.rs).
- Support for [Docker-Gen](https://github.com/jwilder/docker-gen).
- Support for [Docker Machine](https://github.com/docker/machine).
- Support for [Duplicacy](https://github.com/gilbertchen/duplicacy).
- Support for [EdgeDNS](https://github.com/jedisct1/edgedns).
- Support for [Etcd](https://github.com/etcd-io/etcd)'s components `etcd` and `etcdctl`.
- Support for [Ethr](https://github.com/microsoft/ethr).
- Support for [Firecracker](https://github.com/firecracker-microvm/firecracker)'s components `firecracker` and `jailer`.
- Support for [Flux](https://github.com/fluxcd/flux).
- Support for [Gobuster](https://github.com/OJ/gobuster).
- Support for [GolangCI-Lint](https://github.com/golangci/golangci-lint).
- Support for [GoPass](https://github.com/gopasspw/gopass).
- Support for [IPFS](https://github.com/ipfs/go-ipfs).
- Support for [LinuxKit](https://github.com/linuxkit/linuxkit).
- Support for [mdBook](https://github.com/rust-lang/mdBook).
- Support for [Monitoror](https://github.com/monitoror/monitoror).
- Support for [Rage](https://github.com/str4d/rage)'s components `rage` and `rage-keygen`.
- Support for [Starship](https://github.com/starship/starship).
- Support for [Vuls](https://github.com/future-architect/vuls)'s components `vuls`, `future-vuls` and `trivy-to-vuls`.
- Support for [Zola](https://github.com/getzola/zola).

## [2.1.0] - 2020-06-09
### Added
- A sanity check to prevent the accidental uninstallation of an unsupported application with the `--remove` flag.

## [2.0.3] - 2020-06-09
### Fixed
- A bug which made `ginstall.sh` print more information than needed when a user tries to install an unsupported application with the version argument "latest".

## [2.0.2] - 2020-06-09
### Fixed
- A bug that was preventing `gget` from parsing release version tags that are not prefixed with a "v".
- Implemented a workaround for installing the latest version of `ffmpeg` if the latest version number is used as an argument instead of "latest".

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
- Support for [Statping](https://github.com/statping/statping).

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
- Support for [FRP](https://github.com/fatedier/frp)'s components `frpc` and `frps`.
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
- Support for [Transfer.sh](https://github.com/dutchcoders/transfer.sh).
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
