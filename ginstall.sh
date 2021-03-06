#!/bin/bash
#
# Author: Aaron (https://github.com/whalehub)
#
# shellcheck disable=SC2086,SC2089,SC2090

GINSTALL_SH_VERSION="3.5.0"

INSTALL_DIR="/usr/local/bin"
GGET_LOCATION="$(command -v "gget")"
VERSION_PREFIX="@v"
DIR_FLAG="false"
TMP_FILE="/tmp/ginstall.tmp"

MISSING_DEPENDENCY="Error: To use this flag, you must first install ginstall.sh's dependency gget."
MISSING_DEPENDENCY_INSTALL="Error: To install an application with ginstall.sh, you must first install its dependency gget."
PERMISSION_DENIED="Error: To install an application to /usr/local/bin, this script needs to be running as root or with sudo."
UNSUPPORTED_APP="Error: The application you specified is not supported by ginstall.sh."
USAGE_INFORMATION='Please run "ginstall.sh --help" for usage information.'

REPO_ACME_DNS="github.com/joohoi/acme-dns"
REPO_ACT="github.com/nektos/act"
REPO_ADGUARDHOME="github.com/AdguardTeam/AdGuardHome"
REPO_AGE="github.com/FiloSottile/age"
REPO_AGE_KEYGEN="github.com/FiloSottile/age"
REPO_AMASS="github.com/OWASP/Amass"
REPO_ANDESITE="github.com/nektro/andesite"
REPO_ANNIE="github.com/iawia002/annie"
REPO_APIZZA="github.com/harrybrwn/apizza"
REPO_ARC="github.com/mholt/archiver"
REPO_ARGOCD="github.com/argoproj/argo-cd"
REPO_AUTHELIA="github.com/authelia/authelia"
REPO_AUTOCERT="github.com/smallstep/autocert"
REPO_AVIF="github.com/Kagami/go-avif"

REPO_BADGER="github.com/dgraph-io/dgraph"
REPO_BAT="github.com/sharkdp/bat"
REPO_BED="github.com/itchyny/bed"
REPO_BIN="github.com/w4/bin"
REPO_BLOCKY="github.com/0xERR0R/blocky"
REPO_BOMBARDIER="github.com/codesenberg/bombardier"
REPO_BORG="github.com/borgbackup/borg"
REPO_BRIG="github.com/sahib/brig"
REPO_BW="github.com/bitwarden/cli"

REPO_CADDY="github.com/caddyserver/caddy"
REPO_CAIRE="github.com/esimov/caire"
REPO_CAPTAINHOOK="github.com/bketelsen/captainhook"
REPO_CCAT="github.com/jingweno/ccat"
REPO_CHISEL="github.com/jpillora/chisel"
REPO_CHROMA="github.com/alecthomas/chroma"
REPO_CLOUD_TORRENT="github.com/jpillora/cloud-torrent"
REPO_COBALT="github.com/cobalt-org/cobalt.rs"
REPO_COMICS_DOWNLOADER="github.com/Girbons/comics-downloader"
REPO_COMPOSER="github.com/composer/composer"
REPO_COREDNS="github.com/coredns/coredns"
REPO_CROC="github.com/schollz/croc"
REPO_CTOP="github.com/bcicen/ctop"

REPO_DDGR="github.com/jarun/ddgr"
REPO_DDNS_ROUTE53="github.com/crazy-max/ddns-route53"
REPO_DELTA="github.com/dandavison/delta"
REPO_DENO_LINT="github.com/denoland/deno_lint"
REPO_DGRAPH="github.com/dgraph-io/dgraph"
REPO_DGRAPH_RATEL="github.com/dgraph-io/dgraph"
REPO_DISCORD_CONSOLE="github.com/discordconsole-team/DiscordConsole"
REPO_DISCORD_DELETE="github.com/adversarialtools/discord-delete"
REPO_DISKONAUT="github.com/imsnif/diskonaut"
REPO_DISKUS="github.com/sharkdp/diskus"
REPO_DIUN="github.com/crazy-max/diun"
REPO_DIVE="github.com/wagoodman/dive"
REPO_DNSCONTROL="github.com/StackExchange/dnscontrol"
REPO_DNSCRYPT_PROXY="github.com/DNSCrypt/dnscrypt-proxy"
REPO_DNSPROXY="github.com/AdguardTeam/dnsproxy"
REPO_DOBI="github.com/dnephin/dobi"
REPO_DOCKER_COMPOSE="github.com/docker/compose"
REPO_DOCKER_CREDENTIAL_PASS="github.com/docker/docker-credential-helpers"
REPO_DOCKER_GEN="github.com/jwilder/docker-gen"
REPO_DOCKER_MACHINE="github.com/docker/machine"
REPO_DRIVE="github.com/odeke-em/drive"
REPO_DRONE="github.com/drone/drone-cli"
REPO_DSTASK="github.com/naggie/dstask"
REPO_DUPLICACY="github.com/gilbertchen/duplicacy"

REPO_EDGEDNS="github.com/jedisct1/edgedns"
REPO_EKSCTL="github.com/weaveworks/eksctl"
REPO_ESPANSO="github.com/federico-terzi/espanso"
REPO_ETCD="github.com/etcd-io/etcd"
REPO_ETCDCTL="github.com/etcd-io/etcd"
REPO_ETHR="github.com/microsoft/ethr"
REPO_EUREKA="github.com/mimoo/eureka"
REPO_EXA="github.com/ogham/exa"

REPO_FD="github.com/sharkdp/fd"
REPO_FFMPEG="github.com/FFmpeg/FFmpeg"
REPO_FFSEND="github.com/timvisee/ffsend"
REPO_FILEBROWSER="github.com/filebrowser/filebrowser"
REPO_FINDOMAIN="github.com/Edu4rdSHL/findomain"
REPO_FIRECRACKER="github.com/firecracker-microvm/firecracker"
REPO_FLUXCTL="github.com/fluxcd/flux"
REPO_FN="github.com/iron-io/functions"
REPO_FRECE="github.com/YodaEmbedding/frece"
REPO_FRPC="github.com/fatedier/frp"
REPO_FRPS="github.com/fatedier/frp"
REPO_FTPGRAB="github.com/ftpgrab/ftpgrab"
REPO_FUTURE_VULS="github.com/future-architect/vuls"
REPO_FX="github.com/metrue/fx"
REPO_FZF="github.com/junegunn/fzf-bin"

REPO_GAU="github.com/lc/gau"
REPO_GDRIVE="github.com/gdrive-org/gdrive"
REPO_GEOIP_UPDATER="github.com/crazy-max/geoip-updater"
REPO_GGET="github.com/dpb587/gget"
REPO_GH="github.com/cli/cli"
REPO_GINSTALL_SH="github.com/whalehub/ginstall.sh"
REPO_GIT_HOOKS="github.com/git-hooks/git-hooks"
REPO_GIT_REWRITE_AUTHOR="github.com/crazy-max/git-rewrite-author"
REPO_GITBATCH="github.com/isacikgoz/gitbatch"
REPO_GITEA="github.com/go-gitea/gitea"
REPO_GITUI="github.com/extrawurst/gitui"
REPO_GO="github.com/golang/go"
REPO_GO_AUTO_YT="github.com/XiovV/Golty"
REPO_GOATCOUNTER="github.com/zgoat/goatcounter"
REPO_GOBUSTER="github.com/OJ/gobuster"
REPO_GOGS="github.com/gogs/gogs"
REPO_GOLANGCI_LINT="github.com/golangci/golangci-lint"
REPO_GOMPLATE="github.com/hairyhenderson/gomplate"
REPO_GOMUKS="github.com/tulir/gomuks"
REPO_GOOGLER="github.com/jarun/googler"
REPO_GOPASS="github.com/gopasspw/gopass"
REPO_GORELEASER="github.com/goreleaser/goreleaser"
REPO_GORUSH="github.com/appleboy/gorush"
REPO_GOSSA="github.com/pldubouilh/gossa"
REPO_GOSU="github.com/tianon/gosu"
REPO_GOTOP="github.com/xxxserxxx/gotop"
REPO_GOTTY="github.com/yudai/gotty"
REPO_GOVC="github.com/vmware/govmomi"
REPO_GPLDR_CLIENT="github.com/Depado/goploader"
REPO_GPLDR_SERVER="github.com/Depado/goploader"
REPO_GRPCURL="github.com/fullstorydev/grpcurl"

REPO_HANDLR="github.com/chmln/handlr"
REPO_HEXYL="github.com/sharkdp/hexyl"
REPO_HELM="github.com/helm/helm"
REPO_HEY="github.com/rakyll/hey"
REPO_HTTPROBE="github.com/tomnomnom/httprobe"
REPO_HTTPSTAT="github.com/davecheney/httpstat"
REPO_HUB="github.com/github/hub"
REPO_HUGO="github.com/gohugoio/hugo"
REPO_HUGO_EXTENDED="github.com/gohugoio/hugo"
REPO_HYDRA="github.com/ory/hydra"
REPO_HYPERFINE="github.com/sharkdp/hyperfine"

REPO_IDENTITY="github.com/storj/storj"
REPO_IMDL="github.com/casey/intermodal"
REPO_IMMUADMIN="github.com/codenotary/immudb"
REPO_IMMUCLI="github.com/codenotary/immudb"
REPO_IMMUDB="github.com/codenotary/immudb"
REPO_IMMUGW="github.com/codenotary/immudb"
REPO_INLETS="github.com/inlets/inlets"
REPO_INSECT="github.com/sharkdp/insect"
REPO_INTERCERT="github.com/evenh/intercert"
REPO_IPFS="github.com/ipfs/go-ipfs"

REPO_JAILER="github.com/firecracker-microvm/firecracker"
REPO_JELLYCLI="github.com/tryffel/jellycli"
REPO_JQ="github.com/stedolan/jq"
REPO_JSON2CSV="github.com/jehiah/json2csv"
REPO_JSON5="github.com/yosuke-furukawa/json5"
REPO_JSTEG="github.com/lukechampine/jsteg"

REPO_K3S="github.com/rancher/k3s"
REPO_K6="github.com/loadimpact/k6"
REPO_K9S="github.com/derailed/k9s"
REPO_KIND="github.com/kubernetes-sigs/kind"
REPO_KOMGA="github.com/gotson/komga"
REPO_KOMPOSE="github.com/kubernetes/kompose"

REPO_LAZYDOCKER="github.com/jesseduffield/lazydocker"
REPO_LEGO="github.com/go-acme/lego"
REPO_LINUXKIT="github.com/linuxkit/linuxkit"
REPO_LINX_CLEANUP="github.com/andreimarcu/linx-server"
REPO_LINX_GENKEY="github.com/andreimarcu/linx-server"
REPO_LINX_SERVER="github.com/andreimarcu/linx-server"
REPO_LOGCLI="github.com/grafana/loki"
REPO_LOKI="github.com/grafana/loki"
REPO_LOUKETO_PROXY="github.com/louketo/louketo-proxy"
REPO_LSD="github.com/Peltoche/lsd"
REPO_LUCID="github.com/sharkdp/lucid"

REPO_MAGNETICOD="github.com/boramalper/magnetico"
REPO_MAGNETICOW="github.com/boramalper/magnetico"
REPO_MANGO="github.com/hkalexling/Mango"
REPO_MATTERBRIDGE="github.com/42wim/matterbridge"
REPO_MDBOOK="github.com/rust-lang/mdBook"
REPO_MICRO="github.com/zyedidia/micro"
REPO_MIGRATE="github.com/golang-migrate/migrate"
REPO_MINIFY="github.com/tdewolff/minify"
REPO_MKCERT="github.com/FiloSottile/mkcert"
REPO_MMARK="github.com/mmarkdown/mmark"
REPO_MONITOROR="github.com/monitoror/monitoror"
REPO_MONOLITH="github.com/Y2Z/monolith"

REPO_NAABU="github.com/projectdiscovery/naabu"
REPO_NAKAMA="github.com/heroiclabs/nakama"
REPO_NAVIDROME="github.com/deluan/navidrome"
REPO_NEBULA="github.com/slackhq/nebula"
REPO_NEBULA_CERT="github.com/slackhq/nebula"
REPO_NILTALK="github.com/knadh/niltalk"
REPO_NNN="github.com/jarun/nnn"

REPO_OAUTH2_PROXY="github.com/oauth2-proxy/oauth2-proxy"
REPO_OPA="github.com/open-policy-agent/opa"
REPO_ORAGONO="github.com/oragono/oragono"

REPO_PARCELLO="github.com/phogolabs/parcello"
REPO_PASTEL="github.com/sharkdp/pastel"
REPO_PEACH="github.com/peachdocs/peach"
REPO_PEBBLE="github.com/letsencrypt/pebble"
REPO_PEBBLE_CHALLTESTSRV="github.com/letsencrypt/pebble"
REPO_PEGASUS_FE="github.com/mmatyas/pegasus-frontend"
REPO_PGWEB="github.com/sosedoff/pgweb"
REPO_PHONEINFOGA="github.com/sundowndev/PhoneInfoga"
REPO_PKGER="github.com/markbates/pkger"
REPO_PLEXDRIVE="github.com/plexdrive/plexdrive"
REPO_PLIK="github.com/root-gg/plik"
REPO_PLIKD="github.com/root-gg/plik"
REPO_PODMAN_REMOTE="github.com/containers/podman"
REPO_POMERIUM="github.com/pomerium/pomerium"
REPO_POMERIUM_CLI="github.com/pomerium/pomerium"
REPO_PORTAINER="github.com/portainer/portainer"
REPO_PROMTAIL="github.com/grafana/loki"

REPO_QALC="github.com/Qalculate/libqalculate"
REPO_QRCP="github.com/claudiodangelis/qrcp"

REPO_RAGE="github.com/str4d/rage"
REPO_RAGE_KEYGEN="github.com/str4d/rage"
REPO_RATTLESNAKEOS_STACK="github.com/dan-v/rattlesnakeos-stack"
REPO_RCLONE="github.com/rclone/rclone"
REPO_RED="github.com/antonmedv/red"
REPO_REG="github.com/genuinetools/reg"
REPO_RESTIC="github.com/restic/restic"
REPO_RG="github.com/BurntSushi/ripgrep"
REPO_RGA="github.com/phiresky/ripgrep-all"
REPO_RGA_PREPROC="github.com/phiresky/ripgrep-all"
REPO_RIO="github.com/rancher/rio"
REPO_RKE="github.com/rancher/rke"
REPO_ROOTLESSCTL="github.com/rootless-containers/rootlesskit"
REPO_ROOTLESSKIT="github.com/rootless-containers/rootlesskit"
REPO_RQBENCH="github.com/rqlite/rqlite"
REPO_RQLITE="github.com/rqlite/rqlite"
REPO_RQLITED="github.com/rqlite/rqlite"
REPO_RUST_ANALYZER="github.com/rust-analyzer/rust-analyzer"

REPO_S="github.com/zquestz/s"
REPO_S2C="github.com/klauspost/compress"
REPO_S2D="github.com/klauspost/compress"
REPO_SCCACHE="github.com/mozilla/sccache"
REPO_SDNS="github.com/semihalev/sdns"
REPO_SERVERSTATUS="github.com/mgerb/ServerStatus"
REPO_SFTPGO="github.com/drakkan/sftpgo"
REPO_SHELLCHECK="github.com/koalaman/shellcheck"
REPO_SIMPLE_VPN="github.com/skx/simple-vpn"
REPO_SLACK_TERM="github.com/erroneousboat/slack-term"
REPO_SLINK="github.com/lukechampine/jsteg"
REPO_SPOTIFYD="github.com/Spotifyd/spotifyd"
REPO_SPT="github.com/Rigellute/spotify-tui"
REPO_SSH_AUDITOR="github.com/ncsa/ssh-auditor"
REPO_SSHCODE="github.com/cdr/sshcode"
REPO_SSLOCAL="github.com/shadowsocks/shadowsocks-rust"
REPO_SSMANAGER="github.com/shadowsocks/shadowsocks-rust"
REPO_SSSERVER="github.com/shadowsocks/shadowsocks-rust"
REPO_SSURL="github.com/shadowsocks/shadowsocks-rust"
REPO_STARSHIP="github.com/starship/starship"
REPO_STATPING="github.com/statping/statping"
REPO_STDISCOSRV="github.com/syncthing/discosrv"
REPO_STEGIFY="github.com/DimitarPetrov/stegify"
REPO_STEP="github.com/smallstep/cli"
REPO_STRELAYSRV="github.com/syncthing/relaysrv"
REPO_SUP="github.com/pressly/sup"
REPO_SWAGGER="github.com/go-swagger/go-swagger"
REPO_SWARM_CRONJOB="github.com/crazy-max/swarm-cronjob"
REPO_SYNCTHING="github.com/syncthing/syncthing"

REPO_TABLEVIEW="github.com/informationsea/tableview"
REPO_TASK="github.com/go-task/task"
REPO_TASKLITE="github.com/ad-si/TaskLite"
REPO_TENGO="github.com/d5/tengo"
REPO_TFLINT="github.com/terraform-linters/tflint"
REPO_TFSEC="github.com/liamg/tfsec"
REPO_TLDR_PLUS_PLUS="github.com/isacikgoz/tldr"
REPO_TRAEFIK="github.com/containous/traefik"
REPO_TRANSFERSH="github.com/dutchcoders/transfer.sh"
REPO_TRAVIS_WAIT_ENHANCED="github.com/crazy-max/travis-wait-enhanced"
REPO_TRIVY="github.com/aquasecurity/trivy"
REPO_TRIVY_TO_VULS="github.com/future-architect/vuls"
REPO_TXEH="github.com/txn2/txeh"

REPO_UNETBOOTIN="github.com/unetbootin/unetbootin"
REPO_UNFTP="github.com/bolcom/unFTP"
REPO_UP="github.com/apex/up"
REPO_UPLINK="github.com/storj/storj"
REPO_UPX="github.com/upx/upx"

REPO_VECTOR="github.com/timberio/vector"
REPO_VEGETA="github.com/tsenart/vegeta"
REPO_VELERO="github.com/vmware-tanzu/velero"
REPO_VIGIL="github.com/valeriansaliou/vigil"
REPO_VIVID="github.com/sharkdp/vivid"
REPO_VSPHERE_INFLUXDB_GO="github.com/Oxalide/vsphere-influxdb-go"
REPO_VULS="github.com/future-architect/vuls"

REPO_WAL_G="github.com/wal-g/wal-g"
REPO_WATCHTOWER="github.com/containrrr/watchtower"
REPO_WRANGLER="github.com/cloudflare/wrangler"
REPO_WUZZ="github.com/asciimoo/wuzz"

REPO_XSV="github.com/BurntSushi/xsv"

REPO_YOUTUBE_DL="github.com/ytdl-org/youtube-dl"
REPO_YQ="github.com/mikefarah/yq"
REPO_YTOP="github.com/cjbassi/ytop"

REPO_ZENITH="github.com/bvaisvil/zenith"
REPO_ZOLA="github.com/getzola/zola"
REPO_ZOXIDE="github.com/ajeetdsouza/zoxide"

SUPPORTED_APPS_HEADER="Application:                Linker Type:        Repository:
------------                ------------        -----------"

SUPPORTED_APPS_LIST="
A
acme-dns                    dynamic             ${REPO_ACME_DNS}
act                         static              ${REPO_ACT}
adguardhome                 static              ${REPO_ADGUARDHOME}
age                         static              ${REPO_AGE}
age-keygen                  static              ${REPO_AGE_KEYGEN}
amass                       static              ${REPO_AMASS}
andesite                    dynamic             ${REPO_ANDESITE}
annie                       static              ${REPO_ANNIE}
apizza                      static              ${REPO_APIZZA}
arc                         static              ${REPO_ARC}
argocd                      static              ${REPO_ARGOCD}
authelia                    static              ${REPO_AUTHELIA}
autocert                    static              ${REPO_AUTOCERT}
avif                        static              ${REPO_AVIF}

B
badger                      dynamic             ${REPO_BADGER}
bat                         dynamic             ${REPO_BAT}
bed                         static              ${REPO_BED}
bin                         dynamic             ${REPO_BIN}
blocky                      dynamic             ${REPO_BLOCKY}
bombardier                  static              ${REPO_BOMBARDIER}
borg                        dynamic             ${REPO_BORG}
brig                        dynamic             ${REPO_BRIG}
bw                          dynamic             ${REPO_BW}

C
caddy                       static              ${REPO_CADDY}
caire                       dynamic             ${REPO_CAIRE}
captainhook                 static              ${REPO_CAPTAINHOOK}
ccat                        static              ${REPO_CCAT}
chisel                      static              ${REPO_CHISEL}
chroma                      dynamic             ${REPO_CHROMA}
cloud-torrent               static              ${REPO_CLOUD_TORRENT}
cobalt                      dynamic             ${REPO_COBALT}
comics-downloader           static              ${REPO_COMICS_DOWNLOADER}
composer                    dynamic             ${REPO_COMPOSER}
coredns                     static              ${REPO_COREDNS}
croc                        static              ${REPO_CROC}
ctop                        dynamic             ${REPO_CTOP}

D
ddgr                        dynamic             ${REPO_DDGR}
ddns-route53                static              ${REPO_DDNS_ROUTE53}
delta                       dynamic             ${REPO_DELTA}
deno_lint                   dynamic             ${REPO_DENO_LINT}
dgraph                      dynamic             ${REPO_DGRAPH}
dgraph-ratel                dynamic             ${REPO_DGRAPH_RATEL}
discord-console             static              ${REPO_DISCORD_CONSOLE}
discord-delete              dynamic             ${REPO_DISCORD_DELETE}
diskonaut                   static              ${REPO_DISKONAUT}
diskus                      dynamic             ${REPO_DISKUS}
diun                        static              ${REPO_DIUN}
dive                        static              ${REPO_DIVE}
dnscontrol                  static              ${REPO_DNSCONTROL}
dnscrypt-proxy              static              ${REPO_DNSCRYPT_PROXY}
dnsproxy                    dynamic             ${REPO_DNSPROXY}
dobi                        static              ${REPO_DOBI}
docker-compose              dynamic             ${REPO_DOCKER_COMPOSE}
docker-credential-pass      static              ${REPO_DOCKER_CREDENTIAL_PASS}
docker-gen                  static              ${REPO_DOCKER_GEN}
docker-machine              static              ${REPO_DOCKER_MACHINE}
drive                       static              ${REPO_DRIVE}
drone                       static              ${REPO_DRONE}
dstask                      static              ${REPO_DSTASK}
duplicacy                   static              ${REPO_DUPLICACY}

E
edgedns                     dynamic             ${REPO_EDGEDNS}
eksctl                      static              ${REPO_EKSCTL}
espanso                     dynamic             ${REPO_ESPANSO}
etcd                        static              ${REPO_ETCD}
etcdctl                     static              ${REPO_ETCDCTL}
ethr                        dynamic             ${REPO_ETHR}
eureka                      static              ${REPO_EUREKA}
exa                         dynamic             ${REPO_EXA}

F
fd                          dynamic             ${REPO_FD}
ffmpeg                      static              ${REPO_FFMPEG}
ffsend                      static              ${REPO_FFSEND}
filebrowser                 static              ${REPO_FILEBROWSER}
findomain                   dynamic             ${REPO_FINDOMAIN}
firecracker                 static              ${REPO_FIRECRACKER}
fluxctl                     static              ${REPO_FLUXCTL}
fn                          dynamic             ${REPO_FN}
frece                       dynamic             ${REPO_FRECE}
frpc                        static              ${REPO_FRPC}
frps                        static              ${REPO_FRPS}
ftpgrab                     static              ${REPO_FTPGRAB}
future-vuls                 dynamic             ${REPO_FUTURE_VULS}
fx                          dynamic             ${REPO_FX}
fzf                         static              ${REPO_FZF}

G
gau                         static              ${REPO_GAU}
gdrive                      dynamic             ${REPO_GDRIVE}
geoip-updater               static              ${REPO_GEOIP_UPDATER}
gget                        static              ${REPO_GGET}
gh                          dynamic             ${REPO_GH}
ginstall.sh                 dynamic             ${REPO_GINSTALL_SH}
git-hooks                   static              ${REPO_GIT_HOOKS}
git-rewrite-author          static              ${REPO_GIT_REWRITE_AUTHOR}
gitbatch                    static              ${REPO_GITBATCH}
gitea                       static              ${REPO_GITEA}
gitui                       static              ${REPO_GITUI}
go                          dynamic             ${REPO_GO}
go-auto-yt                  dynamic             ${REPO_GO_AUTO_YT}
goatcounter                 static              ${REPO_GOATCOUNTER}
gobuster                    dynamic             ${REPO_GOBUSTER}
gogs                        dynamic             ${REPO_GOGS}
golangci-lint               static              ${REPO_GOLANGCI_LINT}
gomplate                    static              ${REPO_GOMPLATE}
gomuks                      static              ${REPO_GOMUKS}
googler                     dynamic             ${REPO_GOOGLER}
gopass                      static              ${REPO_GOPASS}
goreleaser                  static              ${REPO_GORELEASER}
gorush                      dynamic             ${REPO_GORUSH}
gossa                       static              ${REPO_GOSSA}
gosu                        static              ${REPO_GOSU}
gotop                       dynamic             ${REPO_GOTOP}
gotty                       dynamic             ${REPO_GOTTY}
govc                        static              ${REPO_GOVC}
gpldr-client                dynamic             ${REPO_GPLDR_CLIENT}
gpldr-server                dynamic             ${REPO_GPLDR_SERVER}
grpcurl                     static              ${REPO_GRPCURL}

H
handlr                      dynamic             ${REPO_HANDLR}
helm                        static              ${REPO_HELM}
hexyl                       dynamic             ${REPO_HEXYL}
hey                         static              ${REPO_HEY}
httprobe                    dynamic             ${REPO_HTTPROBE}
httpstat                    static              ${REPO_HTTPSTAT}
hub                         dynamic             ${REPO_HUB}
hugo                        static              ${REPO_HUGO}
hugo-extended               dynamic             ${REPO_HUGO_EXTENDED}
hydra                       static              ${REPO_HYDRA}
hyperfine                   dynamic             ${REPO_HYPERFINE}

I
identity                    static              ${REPO_IDENTITY}
imdl                        static              ${REPO_IMDL}
immuadmin                   static              ${REPO_IMMUADMIN}
immucli                     static              ${REPO_IMMUCLI}
immudb                      static              ${REPO_IMMUDB}
immugw                      static              ${REPO_IMMUGW}
inlets                      static              ${REPO_INLETS}
insect                      dynamic             ${REPO_INSECT}
intercert                   static              ${REPO_INTERCERT}
ipfs                        dynamic             ${REPO_IPFS}

J
jailer                      static              ${REPO_JAILER}
jellycli                    dynamic             ${REPO_JELLYCLI}
jq                          static              ${REPO_JQ}
json2csv                    static              ${REPO_JSON2CSV}
json5                       static              ${REPO_JSON5}
jsteg                       static              ${REPO_JSTEG}

K
k3s                         static              ${REPO_K3S}
k6                          static              ${REPO_K6}
k9s                         static              ${REPO_K9S}
kind                        static              ${REPO_KIND}
komga                       dynamic             ${REPO_KOMGA}
kompose                     static              ${REPO_KOMPOSE}

L
lazydocker                  static              ${REPO_LAZYDOCKER}
lego                        static              ${REPO_LEGO}
linuxkit                    static              ${REPO_LINUXKIT}
linx-cleanup                static              ${REPO_LINX_CLEANUP}
linx-genkey                 static              ${REPO_LINX_GENKEY}
linx-server                 static              ${REPO_LINX_SERVER}
logcli                      static              ${REPO_LOGCLI}
loki                        static              ${REPO_LOKI}
louketo-proxy               dynamic             ${REPO_LOUKETO_PROXY}
lsd                         dynamic             ${REPO_LSD}
lucid                       dynamic             ${REPO_LUCID}

M
magneticod                  dynamic             ${REPO_MAGNETICOD}
magneticow                  dynamic             ${REPO_MAGNETICOW}
mango                       dynamic             ${REPO_MANGO}
matterbridge                static              ${REPO_MATTERBRIDGE}
mdbook                      dynamic             ${REPO_MDBOOK}
micro                       static              ${REPO_MICRO}
migrate                     static              ${REPO_MIGRATE}
minify                      static              ${REPO_MINIFY}
mkcert                      static              ${REPO_MKCERT}
mmark                       static              ${REPO_MMARK}
monitoror                   static              ${REPO_MONITOROR}
monolith                    dynamic             ${REPO_MONOLITH}

N
naabu                       dynamic             ${REPO_NAABU}
nakama                      dynamic             ${REPO_NAKAMA}
navidrome                   static              ${REPO_NAVIDROME}
nebula                      dynamic             ${REPO_NEBULA}
nebula-cert                 dynamic             ${REPO_NEBULA_CERT}
niltalk                     static              ${REPO_NILTALK}
nnn                         static              ${REPO_NNN}

O
oauth2-proxy                static              ${REPO_OAUTH2_PROXY}
opa                         static              ${REPO_OPA}
oragono                     dynamic             ${REPO_ORAGONO}

P
parcello                    static              ${REPO_PARCELLO}
pastel                      dynamic             ${REPO_PASTEL}
peach                       static              ${REPO_PEACH}
pebble                      dynamic             ${REPO_PEBBLE}
pebble-challtestsrv         dynamic             ${REPO_PEBBLE_CHALLTESTSRV}
pegasus-fe                  dynamic             ${REPO_PEGASUS_FE}
pgweb                       static              ${REPO_PGWEB}
phoneinfoga                 static              ${REPO_PHONEINFOGA}
pkger                       static              ${REPO_PKGER}
plexdrive                   dynamic             ${REPO_PLEXDRIVE}
plik                        dynamic             ${REPO_PLIK}
plikd                       dynamic             ${REPO_PLIKD}
podman-remote               dynamic             ${REPO_PODMAN_REMOTE}
pomerium                    static              ${REPO_POMERIUM}
pomerium-cli                static              ${REPO_POMERIUM_CLI}
portainer                   static              ${REPO_PORTAINER}
promtail                    dynamic             ${REPO_PROMTAIL}

Q
qalc                        dynamic             ${REPO_QALC}
qrcp                        static              ${REPO_QRCP}

R
rage                        dynamic             ${REPO_RAGE}
rage-keygen                 dynamic             ${REPO_RAGE_KEYGEN}
rattlesnakeos-stack         dynamic             ${REPO_RATTLESNAKEOS_STACK}
rclone                      static              ${REPO_RCLONE}
red                         static              ${REPO_RED}
reg                         static              ${REPO_REG}
restic                      static              ${REPO_RESTIC}
rg                          static              ${REPO_RG}
rga                         static              ${REPO_RGA}
rga-preproc                 static              ${REPO_RGA_PREPROC}
rio                         static              ${REPO_RIO}
rke                         static              ${REPO_RKE}
rootlessctl                 static              ${REPO_ROOTLESSCTL}
rootlesskit                 static              ${REPO_ROOTLESSKIT}
rqbench                     dynamic             ${REPO_RQBENCH}
rqlite                      dynamic             ${REPO_RQLITE}
rqlited                     dynamic             ${REPO_RQLITED}
rust-analyzer               dynamic             ${REPO_RUST_ANALYZER}

S
s                           dynamic             ${REPO_S}
s2c                         static              ${REPO_S2C}
s2d                         static              ${REPO_S2D}
sccache                     static              ${REPO_SCCACHE}
sdns                        static              ${REPO_SDNS}
serverstatus                dynamic             ${REPO_SERVERSTATUS}
sftpgo                      dynamic             ${REPO_SFTPGO}
shellcheck                  static              ${REPO_SHELLCHECK}
simple-vpn                  dynamic             ${REPO_SIMPLE_VPN}
slack-term                  static              ${REPO_SLACK_TERM}
slink                       static              ${REPO_SLINK}
spotifyd                    static              ${REPO_SPOTIFYD}
spt                         dynamic             ${REPO_SPT}
ssh-auditor                 static              ${REPO_SSH_AUDITOR}
sshcode                     dynamic             ${REPO_SSHCODE}
sslocal                     dynamic             ${REPO_SSLOCAL}
ssmanager                   dynamic             ${REPO_SSMANAGER}
ssserver                    dynamic             ${REPO_SSSERVER}
ssurl                       dynamic             ${REPO_SSURL}
starship                    dynamic             ${REPO_STARSHIP}
statping                    static              ${REPO_STATPING}
stdiscosrv                  static              ${REPO_STDISCOSRV}
stegify                     static              ${REPO_STEGIFY}
step                        static              ${REPO_STEP}
strelaysrv                  static              ${REPO_STRELAYSRV}
sup                         static              ${REPO_SUP}
swagger                     static              ${REPO_SWAGGER}
swarm-cronjob               static              ${REPO_SWARM_CRONJOB}
syncthing                   static              ${REPO_SYNCTHING}

T
tableview                   static              ${REPO_TABLEVIEW}
task                        static              ${REPO_TASK}
tasklite                    dynamic             ${REPO_TASKLITE}
tengo                       static              ${REPO_TENGO}
tflint                      static              ${REPO_TFLINT}
tfsec                       static              ${REPO_TFSEC}
tldr++                      static              ${REPO_TLDR_PLUS_PLUS}
traefik                     static              ${REPO_TRAEFIK}
transfersh                  static              ${REPO_TRANSFERSH}
travis-wait-enhanced        static              ${REPO_TRAVIS_WAIT_ENHANCED}
trivy                       static              ${REPO_TRIVY}
trivy-to-vuls               dynamic             ${REPO_TRIVY_TO_VULS}
txeh                        static              ${REPO_TXEH}

U
unetbootin                  static              ${REPO_UNETBOOTIN}
unftp                       static              ${REPO_UNFTP}
up                          static              ${REPO_UP}
uplink                      static              ${REPO_UPLINK}
upx                         static              ${REPO_UPX}

V
vector                      static              ${REPO_VECTOR}
vegeta                      static              ${REPO_VEGETA}
velero                      static              ${REPO_VELERO}
vigil                       static              ${REPO_VIGIL}
vivid                       dynamic             ${REPO_VIVID}
vsphere-influxdb-go         dynamic             ${REPO_VSPHERE_INFLUXDB_GO}
vuls                        dynamic             ${REPO_VULS}

W
wal-g                       dynamic             ${REPO_WAL_G}
watchtower                  static              ${REPO_WATCHTOWER}
wrangler                    static              ${REPO_WRANGLER}
wuzz                        static              ${REPO_WUZZ}

X
xsv                         static              ${REPO_XSV}

Y
youtube-dl                  dynamic             ${REPO_YOUTUBE_DL}
yq                          static              ${REPO_YQ}
ytop                        dynamic             ${REPO_YTOP}

Z
zenith                      static              ${REPO_ZENITH}
zola                        dynamic             ${REPO_ZOLA}
zoxide                      dynamic             ${REPO_ZOXIDE}"

HELP="About:
  ginstall.sh is a script for installing/updating the compiled binaries of statically and dynamically linked applications.

Usage:
  ginstall.sh [flags] <app> <version>

Examples:
  ginstall.sh hugo 0.72.0
  ginstall.sh -d /opt/apps hugo latest
  ginstall.sh -d /opt/apps --first-run
  ginstall.sh -c hugo
  ginstall.sh -r hugo
  ginstall.sh -s hugo

Flags:
  --check, -c           Print the latest available version of an application
  --directory, -d       Specify a custom directory to use instead of /usr/local/bin
  --first-run           Install ginstall.sh's dependency gget via curl 
  --remove, -r          Uninstall an application
  --search, -s          Perform a search on the list of supported applications
  --self-update         Update ginstall.sh to the latest available version

Info:
  --help, -h            Show this page
  --list, -l            Print a list of supported applications
  --version, -v         Print the ginstall.sh version information"

ARGS="$(getopt -l check:,directory:,first-run,help,list,remove:,search:,self-update,version -o c:d:hlr:s:v -n ginstall.sh -- "$@")"

if [[ $? -ne 0 ]]; then
  exit 1
fi

eval set -- "${ARGS}"
unset ARGS

case "$1" in
  --check | -c)
    if [[ -z ${GGET_LOCATION} ]]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}" && exit 1
    fi

    if ! gget --version='>=0.5.2' &> /dev/null; then
      echo -e "Error: The installed version of gget is older than the minimum version required by this script." &&
        echo -e "Tip: You can update gget to the required version by running this script with the --first-run flag." &&
        exit 1
    fi

    case "$2" in
      ffmpeg)
        APP_VERSION="$(curl -sSL https://johnvansickle.com/ffmpeg/ | grep release: | sed 's|.* ||g;s|</th>||g')"
        echo -e "The latest version of $2 is v${APP_VERSION}." && exit 0
        ;;

      go)
        APP_VERSION="$(curl -sSL https://golang.org/dl/ | grep "downloadBox.*linux-amd64" | sed 's|.*go||g;s|.linux.*||g')"
        echo -e "The latest version of $2 is v${APP_VERSION}." && exit 0
        ;;

      *)
        REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g;s/+/_PLUS/g')"
        if [[ -z ${!REPO} ]]; then
          echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}" && exit 1
        fi

        VERSION_CHECK="$(gget --ignore-missing=* --verify-checksum=none --no-download --export jsonpath='{.origin.ref}' "${!REPO}" 2> /dev/null | sed 's|^v||g')"
        if [[ -z ${VERSION_CHECK} ]]; then
          APP_VERSION="$(gget --ref-stability=pre-release --ignore-missing=* --verify-checksum=none --no-download --export jsonpath='{.origin.ref}' "${!REPO}" 2> /dev/null | sed 's|^v||g')"
        else
          APP_VERSION="${VERSION_CHECK}"
        fi

        echo -e "The latest version of $2 is v${APP_VERSION}." && exit 0
        ;;
    esac
    ;;
  --directory | -d)
    INSTALL_DIR="$2"
    DIR_FLAG="true"

    case "$3" in
      --check | -c | --help | -h | --list | -l | --remove | -r | \
        --search | -s | --self-update | --version | -version)
        echo -e "The $1 flag can only be used as a prefix for the --first-run flag or the app argument.\n${USAGE_INFORMATION}" &&
          exit 1
        ;;
      --first-run)
        curl -Lf -o "${INSTALL_DIR:?}"/gget https://"${REPO_GGET}"/releases/download/v0.5.2/gget-0.5.2-linux-amd64 &&
          chmod 0755 "${INSTALL_DIR:?}"/gget &&
          echo -e "\nThe dependency gget has been successfully installed and ginstall.sh is now ready for use." &&
          exit 0
        ;;
      *)
        shift 2
        ;;
    esac
    ;;
  --first-run)
    if [[ "$(id -u)" != "0" ]]; then
      echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}" && exit 1
    else
      curl -Lf -o "${INSTALL_DIR:?}"/gget https://"${REPO_GGET}"/releases/download/v0.5.2/gget-0.5.2-linux-amd64 &&
        chmod 0755 "${INSTALL_DIR:?}"/gget &&
        echo -e "\nThe dependency gget has been successfully installed and ginstall.sh is now ready for use." &&
        exit 0
    fi
    ;;
  --help | -h)
    echo -e "${HELP}" && exit 0
    ;;
  --list | -l)
    echo -e "${SUPPORTED_APPS_HEADER}""${SUPPORTED_APPS_LIST}" && exit 0
    ;;
  --remove | -r)
    UNINSTALL_SUCCESS="$2 was uninstalled successfully."

    REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g;s/+/_PLUS/g')"
    if [[ -z ${!REPO} ]]; then
      echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}" && exit 1
    else
      case "$2" in
        gget)
          echo -e "Are you sure that you want to uninstall the dependency gget?\n" &&
            echo -e "Please type the number next to your desired answer." &&
            select yn in "yes" "no"; do
              case $yn in
                yes)
                  echo -e "" &&
                    rm -v "${GGET_LOCATION:?}" &&
                    echo -e "The dependency gget for ginstall.sh has been successfully uninstalled." &&
                    exit 0
                  ;;
                no)
                  echo -e "Exiting..." && exit 0
                  ;;
              esac
            done
          ;;

        go)
          APP_LOCATION="$(command -v "$2" | sed 's|/bin/go||g')"
          rm -vr "${APP_LOCATION:?}" && echo -e "${UNINSTALL_SUCCESS}" && exit 0
          ;;

        *)
          APP_LOCATION="$(command -v "$2")"
          if [[ $2 == "composer" ]]; then APP_LOCATION="$(command -v "$2".phar)"; fi
          if [[ $2 == "hugo-extended" ]]; then APP_LOCATION="$(command -v "hugo")"; fi
          if [[ $2 == "komga" ]]; then APP_LOCATION="$(command -v "$2".jar)"; fi
          rm -v "${APP_LOCATION:?}" && echo -e "${UNINSTALL_SUCCESS}" && exit 0
          ;;
      esac
    fi
    ;;
  --search | -s)
    echo -e "${SUPPORTED_APPS_HEADER}""\n""$(echo -e "$SUPPORTED_APPS_LIST" | grep "$2")" && exit 0
    ;;
  --self-update)
    if [[ -z ${GGET_LOCATION} ]]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}" && exit 1
    fi

    if gget --version='>=0.5.2' &> /dev/null; then
      echo -e "Error: The installed version of gget is older than the minimum version required by this script." &&
        echo -e "Tip: You can update gget to the required version by running this script with the --first-run flag." &&
        exit 1
    fi

    APP_VERSION="$(gget --ignore-missing=* --verify-checksum=none --no-download --export jsonpath='{.origin.ref}' "${REPO_GINSTALL_SH}" 2> /dev/null | sed 's|^v||g')"
    gget --stdout "${REPO_GINSTALL_SH}""${VERSION_PREFIX}""${APP_VERSION}" 'ginstall.sh' > "$0" &&
      chmod 0755 "$0" &&
      echo -e "ginstall.sh successfully updated itself to the latest version (v${APP_VERSION})." &&
      exit 0
    ;;
  --version | -v)
    echo -e "ginstall.sh version ${GINSTALL_SH_VERSION} linux/amd64" && exit 0
    ;;
esac

if [[ -z ${GGET_LOCATION} ]]; then
  echo -e "${MISSING_DEPENDENCY_INSTALL}\n${USAGE_INFORMATION}" && exit 1
fi

if ! gget --version='>=0.5.2' &> /dev/null; then
  echo -e "Error: The installed version of gget is older than the minimum version required by this script." &&
    echo -e "Tip: You can update gget to the required version by running this script with the --first-run flag." &&
    exit 1
fi

if [[ -z $2 ]]; then
  echo -e "Error: You forgot to supply an application name.\n${USAGE_INFORMATION}" && exit 1
elif [[ -z $3 ]]; then
  echo -e "Error: You forgot to supply a version number.\n${USAGE_INFORMATION}" && exit 1
fi

APP_NAME="$2"
APP_RESOURCE="$2"
APP_VERSION="$3"
REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g;s/+/_PLUS/g')"
INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR}."

if [[ $3 == "latest" ]]; then
  if [[ "$(id -u)" == "0" ]] || [[ ${DIR_FLAG} == "true" ]]; then
    case "$2" in
      ffmpeg | go) ;;
      *)
        if [[ -z ${!REPO} ]]; then
          echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
          exit 1
        fi

        VERSION_CHECK="$(gget --ignore-missing=* --verify-checksum=none --no-download --export jsonpath='{.origin.ref}' "${!REPO}" 2> /dev/null | sed 's|^v||g')"
        if [[ -z ${VERSION_CHECK} ]]; then
          APP_VERSION="$(gget --ref-stability=pre-release --ignore-missing=* --verify-checksum=none --no-download --export jsonpath='{.origin.ref}' "${!REPO}" 2> /dev/null | sed 's|^v||g')"
        else
          APP_VERSION="${VERSION_CHECK}"
        fi
        INSTALL_SUCCESS="The latest version of ${APP_NAME} (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
        ;;
    esac
  else
    echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}" && exit 1
  fi
fi

post-install_cleanup() {
  chmod 0755 "${INSTALL_DIR:?}"/"${APP_NAME}" &&
    chown "$(id -u)":"$(id -g)" "${INSTALL_DIR:?}"/"${APP_NAME}" &&
    rm -f "${TMP_FILE:?}" &&
    echo -e "${INSTALL_SUCCESS}" &&
    exit 0
}

EXCL_EXTRAS='--exclude="*-arm*"       --exclude="*-canary-*"    --exclude="*-gui"
             --exclude="*-slim"       --exclude="*-source*"     --exclude="*.asc"
             --exclude="*.cid"        --exclude="*.deb"         --exclude="*.exe"
             --exclude="*.json"       --exclude="*.log"         --exclude="*.md5"
             --exclude="*.md"         --exclude="*.minisig"     --exclude="*.msi"
             --exclude="*.nupkg*"     --exclude="*.rpm"         --exclude="*.sha*5*"
             --exclude="*.sig"        --exclude="*.txt"         --exclude="*_arm*"
             --exclude="*_musl_*"     --exclude="*386*"         --exclude="*686*"
             --exclude="*32*bit*"     --exclude="*aarch*"       --exclude="*acOS*"
             --exclude="*acos*"       --exclude="*ARM*"         --exclude="*arwin*"
             --exclude="*DragonFly*"  --exclude="*dragonfly*"   --exclude="*FreeBSD*"
             --exclude="*freebsd*"    --exclude="*lan9*"        --exclude="*llumos*"
             --exclude="*lpine*"      --exclude="*indows*"      --exclude="*mips*"
             --exclude="*NetBSD*"     --exclude="*netbsd*"      --exclude="*olaris*"
             --exclude="*OpenBSD*"    --exclude="*openbsd*"     --exclude="*OSX*"
             --exclude="*osx*"        --exclude="*powerpc*"     --exclude="*ppc64*"
             --exclude="*riscv*"      --exclude="*rpi*"         --exclude="*s390x*"
             --exclude="LICENSE-*"    --exclude="MD5SUMS"       --exclude="SHA*SUMS"
             --exclude="sha*sums"'

EXCL_ARCHIVES='--exclude="*.7z"        --exclude="*.bz2"         --exclude="*.gz"
               --exclude="*.tar"       --exclude="*.xz"          --exclude="*.zip"'

if [[ "$(id -u)" == "0" ]] || [[ ${DIR_FLAG} == "true" ]]; then
  case "$2" in
    annie | borg | captainhook | cloud-torrent | composer | delta | discord-console | \
      discord-delete | diskonaut | dnscrypt-proxy | docker-compose | docker-gen | edgedns | \
      eksctl | eureka | findomain | fluxctl | fn | frece | ftpgrab | fx | fzf | \
      gdrive | git-rewrite-author | go-auto-yt | gosu | inlets | jq | louketo-proxy | \
      lsd | monitoror | naabu | pegasus-fe | plexdrive | plik | plikd | portainer | \
      qrcp | rg | rust-analyzer | sccache | simple-vpn | unetbootin | xsv | youtube-dl | \
      yq | ytop | zenith)
      VERSION_PREFIX="@"
      ;;
  esac

  case "$4" in
    +debug)
      gget --no-download --list ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" && exit 0
      ;;
  esac

  case "$2" in
    acme-dns | act | annie | apizza | badger | caddy | captainhook | chroma | coredns | \
      croc | ddns-route53 | dgraph | dgraph-ratel | diun | dive | docker-gen | drone | eksctl | \
      filebrowser | ftpgrab | fzf | gau | geoip-updater | git-rewrite-author | gitbatch | gopass | \
      goreleaser | gotop | grpcurl | httprobe | hydra | intercert | k9s | lazydocker | lego | \
      minify | mmark | naabu | nakama | navidrome | nebula | nebula-cert | niltalk | parcello | \
      peach | phoneinfoga | pkger | pomerium | pomerium-cli | qrcp | red | s2c | s2d | sshcode | \
      statping | swarm-cronjob | task | tengo | traefik | travis-wait-enhanced | trivy | txeh | up | \
      vegeta | vsphere-influxdb-go | wal-g | watchtower)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${APP_NAME}" &&
        post-install_cleanup
      ;;
    adguardhome | git-hooks | gotty | gpldr-server | k6 | micro | migrate | oauth2-proxy | wrangler)
      APP_RESOURCE_PREFIX="inux"
      if [[ $2 == "adguardhome" ]]; then FOLDER_PREFIX="AdGuardHome" APP_NAME_ARCHIVED="AdGuardHome"; fi
      if [[ $2 == "git-hooks" ]]; then FOLDER_PREFIX="build" APP_NAME_ARCHIVED="${APP_NAME}_linux_amd64"; fi
      if [[ $2 == "gotty" ]]; then FOLDER_PREFIX="." APP_NAME_ARCHIVED="${APP_NAME}"; fi
      if [[ $2 == "gpldr-server" ]]; then APP_RESOURCE_PREFIX="standalone" FOLDER_PREFIX="goploader-server" APP_NAME_ARCHIVED="server-standalone"; fi
      if [[ $2 == "k6" ]] || [[ $2 == "oauth2-proxy" ]]; then FOLDER_PREFIX="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* 2> /dev/null | sed 's|.tar.gz||g')"; fi
      if [[ $2 == "micro" ]]; then APP_RESOURCE_SUFFIX="static.tar.gz" FOLDER_PREFIX="${APP_NAME}-${APP_VERSION}" APP_NAME_ARCHIVED="${APP_NAME}"; fi
      if [[ $2 == "migrate" ]]; then FOLDER_PREFIX="." APP_NAME_ARCHIVED="${APP_NAME}.linux-amd64"; fi
      if [[ $2 == "wrangler" ]]; then APP_RESOURCE_PREFIX="" FOLDER_PREFIX="dist" APP_NAME_ARCHIVED="${APP_NAME}"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\*64\*"${APP_RESOURCE_SUFFIX}" |
        tar -xzf - -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME_ARCHIVED}" --strip-components=1 &&
        mv "${INSTALL_DIR:?}"/"${APP_NAME_ARCHIVED}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2> /dev/null
      post-install_cleanup
      ;;
    age | age-keygen | autocert | frpc | frps | gh | gitui | hub | ipfs | plik | plikd | rage | rage-keygen | step | vector | vigil)
      COMPONENT_COUNT="1"
      APP_RESOURCE_PREFIX="inux"
      if [[ $2 == "age" ]] || [[ $2 == "age-keygen" ]]; then FOLDER_PREFIX="age"; fi
      if [[ $2 == "autocert" ]]; then FOLDER_PREFIX="${APP_NAME}_${APP_VERSION}/bin" COMPONENT_COUNT="2"; fi
      if [[ $2 == "frpc" ]] || [[ $2 == "frps" ]]; then FOLDER_PREFIX="frp_${APP_VERSION}_linux_amd64"; fi
      if [[ $2 == "gh" ]] || [[ $2 == "hub" ]]; then FOLDER_PREFIX="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* 2> /dev/null | sed 's|.t.*gz|/bin|g')" COMPONENT_COUNT="2"; fi
      if [[ $2 == "gitui" ]]; then FOLDER_PREFIX="." COMPONENT_COUNT="1" APP_RESOURCE_PREFIX="musl"; fi
      if [[ $2 == "ipfs" ]]; then FOLDER_PREFIX="go-ipfs"; fi
      if [[ $2 == "plik" ]]; then FOLDER_PREFIX="plik-${APP_VERSION}/clients/linux-amd64" COMPONENT_COUNT="3"; fi
      if [[ $2 == "plikd" ]]; then FOLDER_PREFIX="plik-${APP_VERSION}/server" COMPONENT_COUNT="2"; fi
      if [[ $2 == "rage" ]] || [[ $2 == "rage-keygen" ]]; then FOLDER_PREFIX="rage"; fi
      if [[ $2 == "step" ]]; then FOLDER_PREFIX="${APP_NAME}_${APP_VERSION}/bin" COMPONENT_COUNT="2"; fi
      if [[ $2 == "vector" ]]; then FOLDER_PREFIX="./${APP_NAME}-x86_64-unknown-linux-musl/bin" COMPONENT_COUNT="3"; fi
      if [[ $2 == "vigil" ]]; then FOLDER_PREFIX="./${APP_NAME}" COMPONENT_COUNT="2" APP_RESOURCE_PREFIX="64"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME}" --strip-components="${COMPONENT_COUNT}" &&
        post-install_cleanup
      ;;
    andesite | arc | argocd | avif | blocky | bombardier | borg | ctop | docker-compose | \
      docker-machine | dstask | duplicacy | eureka | ffsend | fluxctl | gdrive | gget | gitea | \
      go-auto-yt | gomplate | gomuks | gossa | gpldr-client | httpstat | insect | jq | kind | \
      kompose | linuxkit | matterbridge | mkcert | monitoror | monolith | opa | plexdrive | reg | \
      rio | rke | simple-vpn | slack-term | stegify | sup | swagger | tableview | unetbootin | \
      tfsec | transfersh | wuzz | yq)
      if [[ $2 == "ffsend" ]]; then APP_RESOURCE_SUFFIX="static"; fi

      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*inux\*64\*"${APP_RESOURCE_SUFFIX}" &&
        post-install_cleanup
      ;;
    authelia | brig | diskonaut | jellycli | nnn | podman-remote | sdns | spotifyd | spt | tldr++ | zenith)
      APP_RESOURCE_PREFIX="inux"
      APP_RESOURCE_SUFFIX="64"
      if [[ $2 == "authelia" ]] || [[ $2 == "brig" ]]; then RESOURCE_NAME="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* 2> /dev/null | sed 's|.tar.gz||g')"; fi
      if [[ $2 == "jellycli" ]]; then RESOURCE_NAME="Jellycli"; fi
      if [[ $2 == "nnn" ]]; then APP_RESOURCE_PREFIX="static" RESOURCE_NAME="${APP_NAME}-static"; fi
      if [[ $2 == "podman-remote" ]]; then APP_RESOURCE_PREFIX="static" APP_RESOURCE_SUFFIX=".tar.gz" RESOURCE_NAME="${APP_NAME}-static"; fi
      if [[ $2 == "sdns" ]]; then RESOURCE_NAME="${APP_NAME}_linux_amd64"; fi
      if [[ $2 == "spotifyd" ]]; then APP_RESOURCE_SUFFIX="-full" RESOURCE_NAME="${APP_NAME}"; fi
      if [[ $2 == "diskonaut" ]] || [[ $2 == "spt" ]]; then APP_RESOURCE_SUFFIX="" RESOURCE_NAME="${APP_NAME}"; fi
      if [[ $2 == "tldr++" ]]; then RESOURCE_NAME="tldr"; fi
      if [[ $2 == "zenith" ]]; then APP_RESOURCE_SUFFIX=".tgz" RESOURCE_NAME="${APP_NAME}"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\*"${APP_RESOURCE_SUFFIX}"\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}" &&
        mv "${INSTALL_DIR:?}"/"${RESOURCE_NAME:?}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2> /dev/null &&
        post-install_cleanup
      ;;
    bat | delta | diskus | fd | frece | hexyl | hyperfine | lsd | lucid | pastel | rg | rga | rga-preproc | sccache | vivid)
      APP_ARCH="gnu"
      if [[ $2 == "rg" ]] || [[ $2 == "rga" ]] || [[ $2 == "rga-preproc" ]] || [[ $2 == "sccache" ]]; then APP_ARCH="musl"; fi

      RESOURCE_NAME="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* 2> /dev/null | sed 's|.tar.gz||g')"
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}"/"${APP_NAME}" --strip-components=1 &&
        post-install_cleanup
      ;;
    bed | caire | ccat | dnscrypt-proxy | dnsproxy | etcd | etcdctl | gogs | golangci-lint | \
      json2csv | louketo-proxy | oragono | portainer | rqbench | rqlite | rqlited | ssh-auditor | \
      stdiscosrv | strelaysrv | syncthing | velero)
      RESOURCE_NAME="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* 2> /dev/null | sed 's|.tar.gz||g')"
      if [[ $2 == "dnscrypt-proxy" ]]; then RESOURCE_NAME="linux-x86_64"; fi
      if [[ $2 == "dnsproxy" ]]; then RESOURCE_NAME="linux-amd64"; fi
      if [[ $2 == "gogs" ]]; then RESOURCE_NAME="gogs" APP_RESOURCE_SUFFIX=".tar.gz"; fi
      if [[ $2 == "portainer" ]]; then RESOURCE_NAME="portainer"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\*"${APP_RESOURCE_SUFFIX}" |
        tar -xzf - -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}"/"${APP_NAME}" --strip-components=1 &&
        post-install_cleanup
      ;;
    bin | cobalt | edgedns | imdl | mdbook | starship | xsv | ytop | zola)
      APP_ARCH="gnu"
      if [[ $2 == "imdl" ]] || [[ $2 == "xsv" ]]; then APP_ARCH="musl"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${APP_NAME}" &&
        post-install_cleanup
      ;;
    bw | ethr | json5 | pegasus-fe | rattlesnakeos-stack | tasklite | tflint)
      APP_RESOURCE_PREFIX="inux"
      if [[ $2 == "pegasus-fe" ]]; then APP_RESOURCE_PREFIX="x11-static"; fi

      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_FILE}"=\*"${APP_RESOURCE_PREFIX}"\*"${APP_RESOURCE_SUFFIX}"\* &&
        unzip -qjo "${TMP_FILE}" "${APP_NAME}" -d "${INSTALL_DIR:?}" &&
        post-install_cleanup
      ;;
    chisel | cloud-torrent | goatcounter | govc)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* |
        gunzip > "${INSTALL_DIR:?}"/"${APP_NAME}" &&
        post-install_cleanup
      ;;
    comics-downloader | composer | findomain | firecracker | jailer | magneticod | magneticow | \
      ginstall.sh | gorush | gosu | handlr | immuadmin | immucli | immudb | immugw | inlets | \
      k3s | komga | mango | rust-analyzer | serverstatus | youtube-dl)
      APP_RESOURCE_SUFFIX="*"
      case "$2" in
        "comics-downloader" | "ginstall.sh" | "handlr" | "inlets" | "k3s" | "magneticod" | "magneticow" | \
          "mango" | "youtube-dl")
          APP_RESOURCE_SUFFIX=""
          ;;

        "immuadmin" | "immucli" | "immudb" | "immugw")
          APP_RESOURCE_SUFFIX="-static"
          ;;

        "rust-analyzer")
          APP_RESOURCE_SUFFIX="inux"
          ;;

        "serverstatus")
          APP_RESOURCE="ServerStatus"
          APP_RESOURCE_SUFFIX="inux"
          ;;
      esac

      if [[ $2 == "composer" ]]; then APP_EXTENSION=".phar"; fi
      if [[ $2 == "komga" ]]; then APP_EXTENSION=".jar"; fi

      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}""${APP_EXTENSION}"=\*"${APP_RESOURCE}"\*"${APP_RESOURCE_SUFFIX}"\* &&
        post-install_cleanup
      ;;
    ddgr | googler | qalc | shellcheck | upx)
      if [[ $2 == "ddgr" ]] || [[ $2 == "googler" ]]; then FOLDER_PREFIX="usr/bin" COMPONENT_COUNT="2"; fi
      if [[ $2 == "qalc" ]]; then FOLDER_PREFIX="qalculate-${APP_VERSION}" COMPONENT_COUNT="1"; fi
      if [[ $2 == "shellcheck" ]]; then FOLDER_PREFIX="shellcheck-v${APP_VERSION}" COMPONENT_COUNT="1"; fi
      if [[ $2 == "upx" ]]; then FOLDER_PREFIX="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*tar.xz 2> /dev/null | sed 's|.tar.xz||g')" COMPONENT_COUNT="1"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*tar.xz |
        tar -xJf - -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME}" --strip-components="${COMPONENT_COUNT}" &&
        post-install_cleanup
      ;;
    amass | discord-console | rclone | s)
      RESOURCE_NAME="$(gget --no-download --list ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\* 2> /dev/null | sed 's|.zip||g')"
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_FILE}"=\*inux\*

      if [[ $2 == "discord-console" ]]; then
        APP_NAME_ARCHIVED="DiscordConsole"
        unzip -qjo "${TMP_FILE}" "${RESOURCE_NAME:?}"/64-bit/"${APP_NAME_ARCHIVED}" -d "${INSTALL_DIR:?}"
      else
        APP_NAME_ARCHIVED="$2"
        unzip -qjo "${TMP_FILE}" "${RESOURCE_NAME:?}"/"${APP_NAME_ARCHIVED}" -d "${INSTALL_DIR:?}"
      fi

      mv "${INSTALL_DIR:?}"/"${APP_NAME_ARCHIVED}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2> /dev/null &&
        post-install_cleanup
      ;;
    discord-delete | dnscontrol | dobi | drive | fn)
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*inux\* &&
        post-install_cleanup
      ;;
    docker-credential-pass | future-vuls | fx | hugo | hugo-extended | rootlessctl | rootlesskit | trivy-to-vuls | vuls)
      if [[ $2 == "rootlesskit" ]] || [[ $2 == "rootlessctl" ]]; then APP_RESOURCE=""; fi
      if [[ $2 == "hugo" ]]; then APP_RESOURCE="hugo_${APP_VERSION}"; fi
      if [[ $2 == "hugo-extended" ]]; then APP_RESOURCE="hugo_extended" APP_NAME="hugo"; fi

      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${APP_RESOURCE}"\*64\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${APP_NAME}" &&
        post-install_cleanup
      ;;
    exa | pgweb)
      if [[ $2 == "exa" ]]; then APP_NAME_SUFFIX="-linux-x86_64"; fi
      if [[ $2 == "pgweb" ]]; then APP_NAME_SUFFIX="_linux_amd64"; fi

      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_FILE}"=\*inux\*64\* &&
        unzip -qjo "${TMP_FILE}" "${APP_NAME}""${APP_NAME_SUFFIX}" -d "${INSTALL_DIR:?}" &&
        mv "${INSTALL_DIR:?}"/"${APP_NAME}""${APP_NAME_SUFFIX}" "${INSTALL_DIR:?}"/"${APP_NAME}" &&
        post-install_cleanup
      ;;
    deno_lint | identity | uplink)
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_FILE}"="${APP_RESOURCE}"\*inux\* &&
        unzip -qjo "${TMP_FILE}" "${APP_NAME}" -d "${INSTALL_DIR:?}" &&
        post-install_cleanup
      ;;
    jsteg | linx-cleanup | linx-genkey | linx-server | pebble | pebble-challtestsrv | slink)
      if [[ $2 == "pebble" ]]; then APP_RESOURCE="pebble_"; fi

      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"="${APP_RESOURCE}"\*inux\*64\* &&
        post-install_cleanup
      ;;
    logcli | loki | promtail)
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_FILE}"="${APP_RESOURCE}"\*inux\*64\* &&
        unzip -qjo "${TMP_FILE}" "${APP_NAME}"-linux-amd64 -d "${INSTALL_DIR:?}" &&
        mv "${INSTALL_DIR:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR:?}"/"${APP_NAME}" &&
        post-install_cleanup
      ;;
    sslocal | ssmanager | ssserver | ssurl)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*gnu\* |
        tar -xJf - -C "${INSTALL_DIR:?}" "${APP_NAME}" &&
        post-install_cleanup
      ;;
    espanso)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\* |
        tar -xzf - -C "${INSTALL_DIR:?}" "${APP_NAME}" &&
        post-install_cleanup
      ;;
    ffmpeg)
      APP_VERSION="$(curl -sSL https://johnvansickle.com/ffmpeg/ | grep release: | sed 's|.* ||g;s|</th>||g')"
      if [[ $3 == "latest" ]]; then
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
        FFMPEG_URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
      elif [[ $3 == "${APP_VERSION}" ]]; then
        FFMPEG_URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
      else
        APP_VERSION="$3"
        FFMPEG_URL="https://www.johnvansickle.com/ffmpeg/old-releases/ffmpeg-${APP_VERSION}-amd64-static.tar.xz"
      fi

      curl -Lf "${FFMPEG_URL}" |
        tar -xJf - -C "${INSTALL_DIR:?}" "${APP_NAME}"-"${APP_VERSION}"-amd64-static/"${APP_NAME}" --strip-components=1 &&
        post-install_cleanup
      ;;
    go)
      if [[ ${DIR_FLAG} == "false" ]]; then INSTALL_DIR="/usr/local"; fi
      if [[ $3 == "latest" ]]; then
        APP_VERSION="$(curl -sSL https://golang.org/dl/ | grep "downloadBox.*linux-amd64" | sed 's|.*go||g;s|.linux.*||g')"
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
      fi

      rm -rf "${INSTALL_DIR:?}"/"${APP_NAME}" &&
        curl -Lf https://dl.google.com/go/go"${APP_VERSION}".linux-amd64.tar.gz |
        tar -xzf - -C "${INSTALL_DIR:?}" &&
        post-install_cleanup
      ;;
    gobuster)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* > "${TMP_FILE}" &&
        7z e -so "${TMP_FILE}" > "${INSTALL_DIR:?}"/"${APP_NAME}" &&
        rm "${TMP_FILE:?}" &&
        post-install_cleanup
      ;;
    helm)
      curl -Lf https://get.helm.sh/helm-v"${APP_VERSION}"-linux-amd64.tar.gz |
        tar -xzf - -C "${INSTALL_DIR:?}" linux-amd64/"${APP_NAME}" --strip-components=1 &&
        post-install_cleanup
      ;;
    hey)
      curl -Lf -o "${INSTALL_DIR:?}"/"${APP_NAME}" https://storage.googleapis.com/hey-release/hey_linux_amd64 &&
        post-install_cleanup
      ;;
    restic)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* |
        bunzip2 > "${INSTALL_DIR:?}"/"${APP_NAME}" &&
        post-install_cleanup
      ;;
    sftpgo)
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* |
        tar -xJf - -C "${INSTALL_DIR:?}" "${APP_NAME}" &&
        post-install_cleanup
      ;;
    unftp)
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*64\*inux\*-musl &&
        post-install_cleanup
      ;;
    zoxide)
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*64\*inux\*-gnu &&
        post-install_cleanup
      ;;
    *)
      echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}" && exit 1
      ;;
  esac
else
  echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}" && exit 1
fi
