#!/bin/bash

# Set the default values for a list of environment variables
# that are reused throughout the script.
GINSTALL_SH_VERSION="2.7.1"

INSTALL_DIR="/usr/local/bin"
GGET_LOCATION="$(command -v "gget")"
VERSION_PREFIX="@v"
DIR_FLAG="false"

TMP_DIR_7Z="/tmp/ginstall.7z"
TMP_DIR_ZIP="/tmp/ginstall.zip"
TAR_ARGS="--no-same-owner --no-same-permissions"

MISSING_DEPENDENCY="Error: To use this flag, you must first install ginstall.sh's dependency gget."
MISSING_DEPENDENCY_INSTALL="Error: To install an application with ginstall.sh, you must first install its dependency gget."
PERMISSION_DENIED="Error: To install an application to /usr/local/bin, this script needs to be running as root or with sudo."
UNSUPPORTED_APP="Error: The application you specified is not supported by ginstall.sh."
USAGE_INFORMATION="Please run \"ginstall.sh --help\" for usage information."

# Set a list of environment variables that define the GitHub
# repositories of all support applications.
# 
# Note: The application FZF uses a separate repository to
# distribute its compiled binaries, that's why there are
# two environment variables for it in this list.
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
REPO_DUPLICACY="github.com/gilbertchen/duplicacy"

REPO_EDGEDNS="github.com/jedisct1/edgedns"
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
REPO_FZF_SOURCE="github.com/junegunn/fzf"

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
REPO_GOTTY="github.com/yudai/gotty"
REPO_GOVC="github.com/vmware/govmomi"
REPO_GPLDR_CLIENT="github.com/Depado/goploader"
REPO_GPLDR_SERVER="github.com/Depado/goploader"
REPO_GRPCURL="github.com/fullstorydev/grpcurl"

REPO_HANDLR="github.com/chmln/handlr"
REPO_HEXYL="github.com/sharkdp/hexyl"
REPO_HELM="github.com/helm/helm"
REPO_HEY="github.com/rakyll/hey"
REPO_HTTPSTAT="github.com/davecheney/httpstat"
REPO_HUB="github.com/github/hub"
REPO_HUGO="github.com/gohugoio/hugo"
REPO_HUGO_EXTENDED="github.com/gohugoio/hugo"
REPO_HYDRA="github.com/ory/hydra"
REPO_HYPERFINE="github.com/sharkdp/hyperfine"

REPO_IDENTITY="github.com/storj/storj"
REPO_IMDL="github.com/casey/intermodal"
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
REPO_K9S="github.com/derailed/k9s"
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
REPO_LUCID="github.com/sharkdp/lucid"

REPO_MAGNETICOD="github.com/boramalper/magnetico"
REPO_MAGNETICOW="github.com/boramalper/magnetico"
REPO_MATTERBRIDGE="github.com/42wim/matterbridge"
REPO_MDBOOK="github.com/rust-lang/mdBook"
REPO_MICRO="github.com/zyedidia/micro"
REPO_MIGRATE="github.com/golang-migrate/migrate"
REPO_MINIFY="github.com/tdewolff/minify"
REPO_MKCERT="github.com/FiloSottile/mkcert"
REPO_MONITOROR="github.com/monitoror/monitoror"

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
REPO_PODMAN_REMOTE="github.com/containers/libpod"
REPO_POMERIUM="github.com/pomerium/pomerium"
REPO_POMERIUM_CLI="github.com/pomerium/pomerium"
REPO_PORTAINER="github.com/portainer/portainer"
REPO_PROMTAIL="github.com/grafana/loki"

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
REPO_TENGO="github.com/d5/tengo"
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

# Note: This environment variable is separate from the one that
# follows it purely for formatting reasons.
SUPPORTED_APPS_HEADER="Application:                Linker Type:        Repository:
------------                ------------        -----------"

# Make use of variable substitution to set an environment variable
# that can be used to display a nicely formatted and alphabetically-
# sorted list of supported applications when invoking this script
# with the --list or --search flag.
SUPPORTED_APPS_LIST="
A
acme-dns                    dynamic             $REPO_ACME_DNS
act                         static              $REPO_ACT
adguardhome                 static              $REPO_ADGUARDHOME
age                         static              $REPO_AGE
age-keygen                  static              $REPO_AGE_KEYGEN
amass                       static              $REPO_AMASS
andesite                    dynamic             $REPO_ANDESITE
annie                       static              $REPO_ANNIE
apizza                      static              $REPO_APIZZA
arc                         static              $REPO_ARC
argocd                      static              $REPO_ARGOCD
authelia                    static              $REPO_AUTHELIA
autocert                    static              $REPO_AUTOCERT
avif                        static              $REPO_AVIF

B
badger                      dynamic             $REPO_BADGER
bat                         dynamic             $REPO_BAT
bed                         static              $REPO_BED
bin                         dynamic             $REPO_BIN
blocky                      dynamic             $REPO_BLOCKY
bombardier                  static              $REPO_BOMBARDIER
borg                        dynamic             $REPO_BORG
brig                        dynamic             $REPO_BRIG
bw                          dynamic             $REPO_BW

C
caddy                       static              $REPO_CADDY
caire                       dynamic             $REPO_CAIRE
captainhook                 static              $REPO_CAPTAINHOOK
ccat                        static              $REPO_CCAT
chisel                      static              $REPO_CHISEL
chroma                      dynamic             $REPO_CHROMA
cloud-torrent               static              $REPO_CLOUD_TORRENT
cobalt                      dynamic             $REPO_COBALT
comics-downloader           static              $REPO_COMICS_DOWNLOADER
composer                    dynamic             $REPO_COMPOSER
coredns                     static              $REPO_COREDNS
croc                        static              $REPO_CROC
ctop                        dynamic             $REPO_CTOP

D
ddgr                        dynamic             $REPO_DDGR
ddns-route53                static              $REPO_DDNS_ROUTE53
delta                       dynamic             $REPO_DELTA
deno_lint                   dynamic             $REPO_DENO_LINT
dgraph                      dynamic             $REPO_DGRAPH
dgraph-ratel                dynamic             $REPO_DGRAPH_RATEL
discord-console             static              $REPO_DISCORD_CONSOLE
discord-delete              dynamic             $REPO_DISCORD_DELETE
diskus                      dynamic             $REPO_DISKUS
diun                        static              $REPO_DIUN
dive                        static              $REPO_DIVE
dnscontrol                  static              $REPO_DNSCONTROL
dnscrypt-proxy              static              $REPO_DNSCRYPT_PROXY
dnsproxy                    dynamic             $REPO_DNSPROXY
dobi                        static              $REPO_DOBI
docker-compose              dynamic             $REPO_DOCKER_COMPOSE
docker-credential-pass      static              $REPO_DOCKER_CREDENTIAL_PASS
docker-gen                  static              $REPO_DOCKER_GEN
docker-machine              static              $REPO_DOCKER_MACHINE
drive                       static              $REPO_DRIVE
drone                       static              $REPO_DRONE
duplicacy                   static              $REPO_DUPLICACY

E
edgedns                     dynamic             $REPO_EDGEDNS
etcd                        static              $REPO_ETCD
etcdctl                     static              $REPO_ETCDCTL
ethr                        dynamic             $REPO_ETHR
eureka                      static              $REPO_EUREKA
exa                         dynamic             $REPO_EXA

F
fd                          dynamic             $REPO_FD
ffmpeg                      static              $REPO_FFMPEG
ffsend                      static              $REPO_FFSEND
filebrowser                 static              $REPO_FILEBROWSER
findomain                   dynamic             $REPO_FINDOMAIN
firecracker                 static              $REPO_FIRECRACKER
fluxctl                     static              $REPO_FLUXCTL
fn                          dynamic             $REPO_FN
frece                       dynamic             $REPO_FRECE
frpc                        static              $REPO_FRPC
frps                        static              $REPO_FRPS
ftpgrab                     static              $REPO_FTPGRAB
future-vuls                 dynamic             $REPO_FUTURE_VULS
fx                          dynamic             $REPO_FX
fzf                         static              $REPO_FZF_SOURCE

G
gau                         static              $REPO_GAU
gdrive                      dynamic             $REPO_GDRIVE
geoip-updater               static              $REPO_GEOIP_UPDATER
gget                        static              $REPO_GGET
gh                          dynamic             $REPO_GH
ginstall.sh                 dynamic             $REPO_GINSTALL_SH
git-hooks                   static              $REPO_GIT_HOOKS
git-rewrite-author          static              $REPO_GIT_REWRITE_AUTHOR
gitbatch                    static              $REPO_GITBATCH
gitea                       static              $REPO_GITEA
gitui                       static              $REPO_GITUI
go                          dynamic             $REPO_GO
go-auto-yt                  dynamic             $REPO_GO_AUTO_YT
goatcounter                 static              $REPO_GOATCOUNTER
gobuster                    dynamic             $REPO_GOBUSTER
gogs                        dynamic             $REPO_GOGS
golangci-lint               static              $REPO_GOLANGCI_LINT
gomplate                    static              $REPO_GOMPLATE
gomuks                      static              $REPO_GOMUKS
googler                     dynamic             $REPO_GOOGLER
gopass                      static              $REPO_GOPASS
goreleaser                  static              $REPO_GORELEASER
gorush                      dynamic             $REPO_GORUSH
gossa                       static              $REPO_GOSSA
gosu                        static              $REPO_GOSU
gotty                       dynamic             $REPO_GOTTY
govc                        static              $REPO_GOVC
gpldr-client                dynamic             $REPO_GPLDR_CLIENT
gpldr-server                dynamic             $REPO_GPLDR_SERVER
grpcurl                     static              $REPO_GRPCURL

H
handlr                      dynamic             $REPO_HANDLR
helm                        static              $REPO_HELM
hexyl                       dynamic             $REPO_HEXYL
hey                         static              $REPO_HEY
httpstat                    static              $REPO_HTTPSTAT
hub                         dynamic             $REPO_HUB
hugo                        static              $REPO_HUGO
hugo-extended               dynamic             $REPO_HUGO_EXTENDED
hydra                       static              $REPO_HYDRA
hyperfine                   dynamic             $REPO_HYPERFINE

I
identity                    static              $REPO_IDENTITY
imdl                        static              $REPO_IMDL
inlets                      static              $REPO_INLETS
insect                      dynamic             $REPO_INSECT
intercert                   static              $REPO_INTERCERT
ipfs                        dynamic             $REPO_IPFS

J
jailer                      static              $REPO_JAILER
jellycli                    dynamic             $REPO_JELLYCLI
jq                          static              $REPO_JQ
json2csv                    static              $REPO_JSON2CSV
json5                       static              $REPO_JSON5
jsteg                       static              $REPO_JSTEG

K
k3s                         static              $REPO_K3S
k9s                         static              $REPO_K9S
komga                       dynamic             $REPO_KOMGA
kompose                     static              $REPO_KOMPOSE

L
lazydocker                  static              $REPO_LAZYDOCKER
lego                        static              $REPO_LEGO
linuxkit                    static              $REPO_LINUXKIT
linx-cleanup                static              $REPO_LINX_CLEANUP
linx-genkey                 static              $REPO_LINX_GENKEY
linx-server                 static              $REPO_LINX_SERVER
logcli                      static              $REPO_LOGCLI
loki                        static              $REPO_LOKI
louketo-proxy               dynamic             $REPO_LOUKETO_PROXY
lucid                       dynamic             $REPO_LUCID

M
magneticod                  dynamic             $REPO_MAGNETICOD
magneticow                  dynamic             $REPO_MAGNETICOW
matterbridge                static              $REPO_MATTERBRIDGE
mdbook                      dynamic             $REPO_MDBOOK
micro                       static              $REPO_MICRO
migrate                     static              $REPO_MIGRATE
minify                      static              $REPO_MINIFY
mkcert                      static              $REPO_MKCERT
monitoror                   static              $REPO_MONITOROR

N
naabu                       dynamic             $REPO_NAABU
nakama                      dynamic             $REPO_NAKAMA
navidrome                   static              $REPO_NAVIDROME
nebula                      dynamic             $REPO_NEBULA
nebula-cert                 dynamic             $REPO_NEBULA_CERT
niltalk                     static              $REPO_NILTALK
nnn                         static              $REPO_NNN

O
oauth2-proxy                static              $REPO_OAUTH2_PROXY
opa                         static              $REPO_OPA
oragono                     dynamic             $REPO_ORAGONO

P
parcello                    static              $REPO_PARCELLO
pastel                      dynamic             $REPO_PASTEL
peach                       static              $REPO_PEACH
pebble                      dynamic             $REPO_PEBBLE
pebble-challtestsrv         dynamic             $REPO_PEBBLE_CHALLTESTSRV
pegasus-fe                  dynamic             $REPO_PEGASUS_FE
pgweb                       static              $REPO_PGWEB
phoneinfoga                 static              $REPO_PHONEINFOGA
pkger                       static              $REPO_PKGER
plexdrive                   dynamic             $REPO_PLEXDRIVE
plik                        dynamic             $REPO_PLIK
plikd                       dynamic             $REPO_PLIKD
podman-remote               dynamic             $REPO_PODMAN_REMOTE
pomerium                    static              $REPO_POMERIUM
pomerium-cli                static              $REPO_POMERIUM_CLI
portainer                   static              $REPO_PORTAINER
promtail                    dynamic             $REPO_PROMTAIL

Q
qrcp                        static              $REPO_QRCP

R
rage                        dynamic             $REPO_RAGE
rage-keygen                 dynamic             $REPO_RAGE_KEYGEN
rattlesnakeos-stack         dynamic             $REPO_RATTLESNAKEOS_STACK
rclone                      static              $REPO_RCLONE
red                         static              $REPO_RED
reg                         static              $REPO_REG
restic                      static              $REPO_RESTIC
rg                          static              $REPO_RG
rga                         static              $REPO_RGA
rga-preproc                 static              $REPO_RGA_PREPROC
rio                         static              $REPO_RIO
rke                         static              $REPO_RKE
rootlessctl                 static              $REPO_ROOTLESSCTL
rootlesskit                 static              $REPO_ROOTLESSKIT
rqbench                     dynamic             $REPO_RQBENCH
rqlite                      dynamic             $REPO_RQLITE
rqlited                     dynamic             $REPO_RQLITED
rust-analyzer               dynamic             $REPO_RUST_ANALYZER

S
s                           dynamic             $REPO_S
s2c                         static              $REPO_S2C
s2d                         static              $REPO_S2D
sccache                     static              $REPO_SCCACHE
sdns                        static              $REPO_SDNS
shellcheck                  static              $REPO_SHELLCHECK
simple-vpn                  dynamic             $REPO_SIMPLE_VPN
slack-term                  static              $REPO_SLACK_TERM
slink                       static              $REPO_SLINK
spotifyd                    static              $REPO_SPOTIFYD
spt                         dynamic             $REPO_SPT
ssh-auditor                 static              $REPO_SSH_AUDITOR
sshcode                     dynamic             $REPO_SSHCODE
sslocal                     dynamic             $REPO_SSLOCAL
ssmanager                   dynamic             $REPO_SSMANAGER
ssserver                    dynamic             $REPO_SSSERVER
ssurl                       dynamic             $REPO_SSURL
starship                    dynamic             $REPO_STARSHIP
statping                    static              $REPO_STATPING
stdiscosrv                  static              $REPO_STDISCOSRV
stegify                     static              $REPO_STEGIFY
step                        static              $REPO_STEP
strelaysrv                  static              $REPO_STRELAYSRV
sup                         static              $REPO_SUP
swagger                     static              $REPO_SWAGGER
swarm-cronjob               static              $REPO_SWARM_CRONJOB
syncthing                   static              $REPO_SYNCTHING

T
tableview                   static              $REPO_TABLEVIEW
task                        static              $REPO_TASK
tengo                       static              $REPO_TENGO
tldr++                      static              $REPO_TLDR_PLUS_PLUS
traefik                     static              $REPO_TRAEFIK
transfersh                  static              $REPO_TRANSFERSH
travis-wait-enhanced        static              $REPO_TRAVIS_WAIT_ENHANCED
trivy                       static              $REPO_TRIVY
trivy-to-vuls               dynamic             $REPO_TRIVY_TO_VULS
txeh                        static              $REPO_TXEH

U
unetbootin                  static              $REPO_UNETBOOTIN
unftp                       static              $REPO_UNFTP
up                          static              $REPO_UP
uplink                      static              $REPO_UPLINK
upx                         static              $REPO_UPX

V
vector                      static              $REPO_VECTOR
velero                      static              $REPO_VELERO
vigil                       static              $REPO_VIGIL
vivid                       dynamic             $REPO_VIVID
vsphere-influxdb-go         dynamic             $REPO_VSPHERE_INFLUXDB_GO
vuls                        dynamic             $REPO_VULS

W
wal-g                       dynamic             $REPO_WAL_G
watchtower                  static              $REPO_WATCHTOWER
wrangler                    static              $REPO_WRANGLER
wuzz                        static              $REPO_WUZZ

X
xsv                         static              $REPO_XSV

Y
youtube-dl                  dynamic             $REPO_YOUTUBE_DL
yq                          static              $REPO_YQ
ytop                        dynamic             $REPO_YTOP

Z
zenith                      static              $REPO_ZENITH
zola                        dynamic             $REPO_ZOLA"

# This environment variable is used to define a help page that is
# displayed when the user invokes this script with the --help flag.
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

# Use the getopt() function to define a list of flags that can be
# used when invoking this script.
ARGS="$(getopt -l check:,directory:,first-run,help,list,remove:,search:,self-update,version -o c:d:hlr:s:v -n ginstall.sh -- "$@")"

# Terminate the script prior to parsing any arguments if it has
# been invoked with an undefined flag. 
if [ $? -ne 0 ]; then
  exit 1
fi

# Ensure that arguments passed to the getopt() function are parsed 
# correctly.
# 
# Reference: /usr/share/doc/util-linux/examples/getopt-parse.bash
eval set -- "$ARGS"
unset ARGS

case "$1" in
  # The --check flag is used to find out what the latest version
  # of a supported application is. It only takes one argument: the
  # name of the application to be checked.
  "--check" | "-c")
    # Verify that the dependency gget can be found in the user's
    # $PATH prior to executing commands which require it. If it
    # can't be found, print a message with usage information.
    if [ -z "${GGET_LOCATION}" ]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}"
      exit 1
    else
      case "$2" in
        # The dependency gget can only check the latest release tag
        # of software that is hosted on GitHub or GitLab. Since the
        # compiled binaries for ffmpeg are hosted on the website of
        # a third party, we use use curl to fetch the download page,
        # pipe the output through grep and sed to filter it down to
        # the latest version number and then print it.
        "ffmpeg")
          APP_VERSION="$(curl -sSL https://johnvansickle.com/ffmpeg/ | grep release: | sed 's|.* ||g;s|</th>||g')"
          echo -e "The latest version of $2 is v${APP_VERSION}."
          exit 0
        ;;

        # We do the same thing for Go since the compiled binaries
        # for it are distributed on golang.org instead of GitHub.
        "go")
          APP_VERSION="$(curl -sSL https://golang.org/dl/ | grep "downloadBox.*linux-amd64" | sed 's|.*go||g;s|.linux.*||g')"
          echo -e "The latest version of $2 is v${APP_VERSION}."
          exit 0
        ;;

        # We use gget to dynamically fetch the latest version of
        # all other supported applications.
        *)
          # First, we take the lower-case application name
          # that was supplied by the user and convert it to
          # upper-case. Next, we replace any dots or dashes
          # in the name with underscores and any plus signs
          # with "_PLUS". Finally, we prefix the resulting
          # string with "REPO_", echo it and use the output
          # as the value of the $REPO variable.
          #
          # The final variable name for the input "tldr++",
          # for example, would be "REPO_TLDR_PLUS_PLUS",
          # which corresponds to the environment variable
          # that we defined for this application earlier in
          # the script.
          REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g;s/+/_PLUS/g')"

          # Utilizing shell expansion, perform a check to see
          # if value of the $REPO variable is empty (this
          # happens when the result of the expanded variable
          # has not been defined anywhere in the script).
          #
          # If the value is empty, print usage information.
          if [ -z "${!REPO}" ]; then
            echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
            exit 1
          fi

          # The dependency gget recently added a new flag
          # which allows one to specify whether to query
          # the most recent "latest" or the most recent
          # "pre-release" tag. This allows us to implement
          # support for applications which only have "pre-
          # release" tags without having to hard-code the
          # latest version in ginstall.sh (more on that
          # below).
          #
          # Almost all of the applications that this script
          # supports have a "latest" release tag and since
          # gget queries the "latest" tag by default, there
          # is no need to specify the new flag for the
          # default version check.
          #
          # The raw output of the gget command contains
          # more than just the version number, so we pipe
          # it through sed to filter it down to just the
          # version number.
          #
          # Raw:
          #   tag     v2.7.1
          #   commit  2d54843e4c53d5bce9b7c2b5965a4d6c35f19202
          #
          # Filtered:
          #   2.7.1
          #
          # The filtered output is then used as the value
          # of the $VERSION_CHECK variable.
          VERSION_CHECK="$(gget --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
          
          # The gget command above pipes its error output to
          # /dev/null, which allows us to determine whether
          # or not an application has a "latest" release tag
          # by checking if the value of the $VERSION_CHECK
          # variable is empty.
          # 
          # If it is empty (i.e. if the application only has
          # "pre-release" tags), we repeat the same command,
          # only this time, we add the new --ref-stability flag
          # with the value "pre-release" and use the filtered
          # output as the value of the $APP_VERSION variable.
          # 
          # If it is not empty (i.e. if the application does
          # have a "latest" release tag), we reuse the value
          # of the $VERSION_CHECK variable as the value of
          # the $APP_VERSION variable.
          # 
          # The $APP_VERSION variable is then used to print
          # the latest available version of the application.
          if [ -z "${VERSION_CHECK}" ]; then
            APP_VERSION="$(gget --ref-stability=pre-release --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
          else
            APP_VERSION="${VERSION_CHECK}"
          fi
          echo -e "The latest version of $2 is v${APP_VERSION}."
          exit 0
        ;;
      esac
    fi
  ;;

  # The --directory flag is used to specify a custom installation
  # directory to use instead of the default /usr/local/bin. It
  # only takes one argument: the path of the custom directory.
  "--directory" | "-d")
    # The custom installation directory is preserved throughout
    # the script as the value of the $INSTALL_DIR variable.
    INSTALL_DIR="$2"

    # When the --directory flag is used, we set the variable
    # $DIR_FLAG to "true" so we can still determine that the
    # flag was used after using "shift" to reposition the
    # arguments that were passed to ginstall.sh (more on that
    # below).
    DIR_FLAG="true"

    # If the --directory flag is used with an argument other than
    # the name of an application or the --first-run flag, print a
    # message with usage information.
    case "$3" in
      "--check" | "-c" | "--help" | "-h" | "--list" | "-l" | "--remove" | "-r" | \
      "--search" | "-s" | "--self-update" | "--version" | "-version")
        echo -e "The $1 flag can only be used as a prefix for the --first-run flag or the app argument.\n${USAGE_INFORMATION}"
        exit 1
      ;;

      # If the --directory flag is used with the --first-run flag as
      # as an argument, install ginstall.sh's dependency gget in the
      # custom installation directory via curl and make it executable
      # with chmod.
      "--first-run")
        curl -Lf -o "${INSTALL_DIR:?}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
        chmod 0755 "${INSTALL_DIR:?}"/gget && \
        echo -e "\nThe dependency gget has been successfully installed and ginstall.sh is now ready for use."
        exit 0
      ;;

      # If the argument that is used after the --directory flag is
      # the name of an application, shift the arguments that were
      # passed to ginstall.sh to the left by two.
      # 
      # For example the command,
      # 
      #  ginstall.sh -d /opt/apps hugo 0.72.0
      # 
      # would turn into
      # 
      #  ginstall.sh hugo 0.72.0
      # 
      # This is done so that we can write all installation-
      # related code without worrying about he positions of
      # the arguments changing when the --directory flag is
      # invoked by the user.
      *)
        shift 2
      ;;
  esac
  ;;

  # The --first-run flag is used to install ginstall.sh's
  # dependency gget via curl since we can't use gget to
  # fetch the latest version of itself prior to installing
  # it first. It takes no arguments.
  "--first-run")
    # To install an application to /usr/local/bin (which we
    # defined as our default installation directory at the
    # beginning of this script), ginstall.sh needs to be
    # running as root or with sudo.
    # 
    # If the user doesn't have the required permissions to
    # run it, print a message with usage information.
    # 
    # If they do, install gget to /usr/local/bin using curl
    # and make it executable with chmod.
    if [ ! "$(id -u)" = "0" ]; then
      echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}"
      exit 1
    else
      curl -Lf -o "${INSTALL_DIR:?}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
      chmod 0755 "${INSTALL_DIR:?}"/gget && \
      echo -e "\nThe dependency gget has been successfully installed and ginstall.sh is now ready for use."
      exit 0
    fi
  ;;

  # The --help flag is used to display a menu with usage
  # information for ginstall.sh. It takes no arguments.
  "--help" | "-h")
    echo -e "${HELP}"
    exit 0
  ;;

  # The --list flag is used to display a list of supported
  # applications. It takes no arguments.
  "--list" | "-l")
    echo -e "${SUPPORTED_APPS_HEADER}""${SUPPORTED_APPS_LIST}"
    exit 0
  ;;

  # The --remove flag is used to uninstall a supported
  # application. It takes one argument: the name of the
  # application to be uninstalled.
  "--remove" | "-r")
    UNINSTALL_SUCCESS="$2 was uninstalled successfully."
    
    # We reuse the same logic that we used for the --check flag
    # earlier to verify if the application that was specified
    # by the user is supported by this script.
    # 
    # It is used purely as a safety measure here since we find
    # out the location of an installed application by querying
    # the user's $PATH with "command -v".
    #
    # Without this safety measure, running ginstall.sh with
    # the --remove flag and the argument "sed", for example,
    # would result in the uninstallation of /usr/bin/sed.
    # 
    # This flag also has a sanity check to verify that all
    # variables which are passed to the rm command are not
    # empty and always uses the -v flag so that the user
    # can see what exactly is being removed. 
    REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g;s/+/_PLUS/g')"
    if [ -z "${!REPO}" ]; then
      echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
      exit 1
    else
      case "$2" in

        # We use a sanity check to prompt the user to confirm
        # that they want to uninstall the dependency gget if
        # it is used as an argument for the --remove flag.
        "gget")
          echo -e "Are you sure that you want to uninstall ginstall.sh's dependency gget?\n" && \
          echo -e "Please type the number next to your desired answer." && \
          select yn in "yes" "no"; do
          case $yn in
            "yes")
                echo -e "" && \
                rm -v "${GGET_LOCATION:?}" && \
                echo -e "The dependency gget for ginstall.sh has been successfully uninstalled."
                exit 0
              ;;
              "no")
                echo -e "Exiting..."
                exit 0
              ;;
          esac
          done
        ;;

        # The application Go is the only one supported by ginstall.sh
        # which is installed to its own folder because it encompasses
        # more than just a single compiled binary. To uninstall it,
        # we need to first pipe the raw output of "command -v" through
        # sed to find out which directory it has been installed in.
        # 
        # Raw:
        #   /usr/local/go/bin/go
        # 
        # Filtered:
        #   /usr/local/go
        #
        # We then use rm with the -r flag to uninstall Go completely.
        "go")
          APP_LOCATION="$(command -v "$2" | sed 's|/bin/go||g')"
          rm -vr "${APP_LOCATION:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        # For all other supported applications, we simply use the raw
        # output of "command -v" as the value for the environment
        # variable $APP_LOCATION and provide it as an argument to rm.
        *)
          APP_LOCATION="$(command -v "$2")"
          # For composer and komga, we need to suffix the command with
          # their binary's extension to find out where they have been
          # installed.
          #
          # For hugo-extended, we need to query the user's $PATH for
          # the location of hugo since the former is merely a variant
          # of the latter and doesn't have a differently named binary.
          if [ "$2" = "composer" ]; then APP_LOCATION="$(command -v "$2".phar)"; fi
          if [ "$2" = "hugo-extended" ]; then APP_LOCATION="$(command -v "hugo")"; fi
          if [ "$2" = "komga" ]; then APP_LOCATION="$(command -v "$2".jar)"; fi
          rm -v "${APP_LOCATION:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;
      esac
    fi
  ;;

  # The --search flag is used to perform a search on
  # the list of applications that are supported by
  # ginstall.sh. It takes one argument: the search
  # term to use when performing the search query.
  "--search" | "-s")
    echo -e "${SUPPORTED_APPS_HEADER}""\n""$(echo -e "$SUPPORTED_APPS_LIST" | grep "$2")"
    exit 0
  ;;

  # The --self-update flag is used to update this
  # script to the latest available version. It 
  # takes no arguments.
  "--self-update")
    echo $0
    exit 0
    # We use the same logic that we used for the --check
    # flag to verify that gget is installed prior to
    # running any commands which require it.
    if [ -z "${GGET_LOCATION}" ]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}"
      exit 1
    else
    # We make use of the $0 argument which is always equal
    # to the full path that ginstall.sh is being executed
    # from so that we can update it even if it is saved
    # outside of /usr/local/bin or even outside of the
    # user's $PATH.
      APP_VERSION="$(gget --show-ref "${REPO_GINSTALL_SH}" | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
      gget --stdout "${REPO_GINSTALL_SH}""${VERSION_PREFIX}""${APP_VERSION}" 'ginstall.sh' > "$0" && \
      chmod 0755 "$0" && \
      echo -e "ginstall.sh successfully updated itself to the latest version (v${APP_VERSION})."
      exit 0
    fi
  ;;

  # The --version flag can be used to print the
  # currently running version of ginstall.sh. It
  # takes no arguments.
  "--version" | "-v")
    echo -e "ginstall.sh version ${GINSTALL_SH_VERSION} linux/amd64"
    exit 0
  ;;
esac

# We once again verify that gget is installed prior
# to running any commands which require it.
if [ -z "${GGET_LOCATION}" ]; then
  echo -e "${MISSING_DEPENDENCY_INSTALL}\n${USAGE_INFORMATION}"
  exit 1
# We check that the user has supplied an application
# name and print usage information if they have not.
elif [ -z "$2" ]; then
  echo -e "Error: You forgot to supply an application name.\n${USAGE_INFORMATION}"
  exit 1
# We check that the user has supplied an application
# version and print usage information if they have not.
elif [ -z "$3" ]; then
  echo -e "Error: You forgot to supply a version number.\n${USAGE_INFORMATION}"
  exit 1
fi

# Set the variables that are required for installing an
# application by reusing the name and version that were
# supplied by the user.
APP_NAME="$2"
APP_RESOURCE="$2"
APP_VERSION="$3"
REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g;s/+/_PLUS/g')"
INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR}."

# This code block is invoked if the user supplies the version
# argument "latest" instead of a specific version.
if [ "$3" = "latest" ]; then
  # Check that the script is either running with the
  # permissions that are required to install an
  # application to /usr/local/bin or that the user
  # has specified a custom installation directory
  # with the --directory flag.
  #
  # If neither condition is true, print usage
  # information.
  if [ "$(id -u)" = "0" ] || [ "${DIR_FLAG}" = "true" ]; then
    case "$2" in
      # We don't perform a version check for ffmpeg and go
      # with gget for the same reasons we don't do it with
      # the --check flag. Their version checks are specified
      # in their respective installation code blocks.
      "ffmpeg" | "go")
      ;;

      # For all other supported applications, we use gget to
      # fetch the latest version number.
      *)
      # We reuse the logic from the --check flag to verify
      # that the specified application is supported by this
      # script.
        if [ -z "${!REPO}" ]; then
          echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
          exit 1
        fi

      # We reuse the logic from the --check flag to get
      # the latest available version of an application
      # regardless of whether or not it has a "latest"
      # release tag.
        VERSION_CHECK="$(gget --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
        if [ -z "${VERSION_CHECK}" ]; then
          APP_VERSION="$(gget --ref-stability=pre-release --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
        else
          APP_VERSION="${VERSION_CHECK}"
        fi
        INSTALL_SUCCESS="The latest version of ${APP_NAME} (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
      ;;
    esac
  else
    echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}"
    exit 1
  fi
fi

# Define several Bash functions to reuse common
# post-installation command sequences.
rm_tmp_file-chmod_binary-echo_success-exit_0() {
  rm "${TMP_DIR_ZIP:?}" && \
  chmod 0755 "${INSTALL_DIR:?}"/"${APP_NAME}" && \
  echo -e "${INSTALL_SUCCESS}"
  exit 0
}

chmod_binary-echo_success-exit_0() {
  chmod 0755 "${INSTALL_DIR:?}"/"${APP_NAME}" && \
  echo -e "${INSTALL_SUCCESS}"
  exit 0
}

echo_success-exit_0() {
  echo -e "${INSTALL_SUCCESS}"
  exit 0
}

# Set environment variables with common exclusion
# patterns so that gget will only fetch the files
# that we need to install an application.
# 
# Note: If the checksum file of a release tag is
# in a supported format, gget will save it to a
# temporary location and verify the checksums
# even if matches an exclusion pattern.
EXCL_EXTRAS="--exclude=\"*-arm*\"       --exclude=\"*-canary-*\"    --exclude=\"*-gui\"
             --exclude=\"*-slim\"       --exclude=\"*-source*\"     --exclude=\"*.asc\"
             --exclude=\"*.cid\"        --exclude=\"*.deb\"         --exclude=\"*.exe\"
             --exclude=\"*.log\"        --exclude=\"*.md5\"         --exclude=\"*.minisig\"
             --exclude=\"*.msi\"        --exclude=\"*.nupkg*\"      --exclude=\"*.rpm\"
             --exclude=\"*.sha*5*\"     --exclude=\"*.txt\"         --exclude=\"*_arm*\"
             --exclude=\"*_musl_*\"     --exclude=\"*386*\"         --exclude=\"*686*\"
             --exclude=\"*32*bit*\"     --exclude=\"*aarch*\"       --exclude=\"*acOS*\"
             --exclude=\"*acos*\"       --exclude=\"*ARM*\"         --exclude=\"*arwin*\"
             --exclude=\"*DragonFly*\"  --exclude=\"*dragonfly*\"   --exclude=\"*FreeBSD*\"
             --exclude=\"*freebsd*\"    --exclude=\"*lan9*\"        --exclude=\"*llumos*\"
             --exclude=\"*lpine*\"      --exclude=\"*indows*\"      --exclude=\"*mips*\"
             --exclude=\"*NetBSD*\"     --exclude=\"*netbsd*\"      --exclude=\"*olaris*\"
             --exclude=\"*OpenBSD*\"    --exclude=\"*openbsd*\"     --exclude=\"*OSX*\"
             --exclude=\"*osx*\"        --exclude=\"*powerpc*\"     --exclude=\"*ppc64*\"
             --exclude=\"*riscv*\"      --exclude=\"*rpi*\"         --exclude=\"*s390x*\"
             --exclude=\"MD5SUMS\"      --exclude=\"SHA*SUMS\"      --exclude=\"sha*sums\""

EXCL_ARCHIVES="--exclude=\"*.7z\"        --exclude=\"*.bz2\"         --exclude=\"*.gz\"
               --exclude=\"*.tar\"       --exclude=\"*.xz\"          --exclude=\"*.zip\""

# Check that the script is either running with the
# permissions that are required to install an
# application to /usr/local/bin or that the user
# has specified a custom installation directory
# with the --directory flag.
#
# If neither condition is true, print usage
# information.
if [ "$(id -u)" = "0" ] || [ "${DIR_FLAG}" = "true" ]; then
  case "$2" in
    # For applications whose release tags are not prefixed
    # by a "v", change the default $VERSION_PREFIX variable
    # to one without a "v".
    "annie" | "borg" | "captainhook" | "cloud-torrent" | "composer" | "delta" | "discord-console" | \
    "discord-delete" | "dnscrypt-proxy" | "docker-compose" | "docker-gen" | "edgedns" | "eureka" | \
    "findomain" | "fluxctl" | "fn" | "frece" | "ftpgrab" | "fx" |"fzf" | "gdrive" | "git-rewrite-author" | \
    "go-auto-yt" | "gosu" | "inlets" | "jq" | "louketo-proxy" | "monitoror" | "naabu" | "pegasus-fe" | \
    "plexdrive" | "plik" | "plikd" | "portainer" | "qrcp" | "rg" | "rust-analyzer" | "sccache" | \
    "simple-vpn" | "unetbootin" | "xsv" | "youtube-dl" | "yq" | "ytop" | "zenith")
      VERSION_PREFIX="@"
    ;;
  esac

  case "$4" in
    # This argument is used for debugging purposes and to
    # verify that all supported applications can actually
    # be installed prior to a new release of ginstall.sh.
    "+debug")
      gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}"
      exit 0
    ;;
  esac

  # Everything from here to the end of the script will be
  # rewritten almost from scratch soon, so it is left
  # uncommented for now.
  # 
  # Note: This section was recently shortened from around
  # 1600 lines of code to a mere 350 LOC by transitioning
  # from using one installation code block for each
  # application to consolidating applications with similar
  # or identical installation steps and resource names
  # into multiple large code blocks.
  #
  # Based on the same idea, it will be shortened even
  # further by supporting almost every application
  # with just two or three code blocks through the
  # extensive use of variables and glob patterns.
  case "$2" in
    "acme-dns" | "act" | "annie" | "apizza" | "badger" | "caddy" | "captainhook" | "chroma" | "coredns" | \
    "croc" | "ddns-route53" | "dgraph" | "dgraph-ratel" | "diun" | "dive" | "docker-gen" | "drone" | \
    "filebrowser" | "ftpgrab" | "fzf" | "gau" | "geoip-updater" | "git-rewrite-author" | "gitbatch" | \
    "gopass" | "goreleaser" | "grpcurl" | "hydra" | "intercert" | "k9s" | "lazydocker" | "lego" | "minify" | \
    "naabu" | "nakama" | "navidrome" | "nebula" | "nebula-cert" | "niltalk" | "parcello" | "peach" | "phoneinfoga" | \
    "pkger" | "pomerium" | "pomerium-cli" | "qrcp" | "red" | "s2c" | "s2d" | "sshcode" | "statping" | \
    "swarm-cronjob" | "task" | "tengo" | "traefik" | "travis-wait-enhanced" | "trivy" | "txeh" | "up" | \
    "vsphere-influxdb-go" | "wal-g" | "watchtower")
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "adguardhome" | "git-hooks" | "gotty" | "gpldr-server" | "micro" | "migrate" | "oauth2-proxy" | "wrangler")
      APP_RESOURCE_PREFIX="inux"
      if [ "$2" = "adguardhome" ]; then FOLDER_PREFIX="AdGuardHome" APP_NAME_ARCHIVED="AdGuardHome"; fi
      if [ "$2" = "git-hooks" ]; then FOLDER_PREFIX="build" APP_NAME_ARCHIVED="${APP_NAME}_linux_amd64"; fi
      if [ "$2" = "gotty" ]; then FOLDER_PREFIX="." APP_NAME_ARCHIVED="${APP_NAME}"; fi
      if [ "$2" = "gpldr-server" ]; then APP_RESOURCE_PREFIX="standalone" FOLDER_PREFIX="goploader-server" APP_NAME_ARCHIVED="server-standalone"; fi
      if [ "$2" = "micro" ]; then APP_RESOURCE_SUFFIX="static.tar.gz" FOLDER_PREFIX="${APP_NAME}-${APP_VERSION}" APP_NAME_ARCHIVED="${APP_NAME}"; fi
      if [ "$2" = "migrate" ]; then FOLDER_PREFIX="." APP_NAME_ARCHIVED="${APP_NAME}.linux-amd64"; fi
      if [ "$2" = "oauth2-proxy" ]; then FOLDER_PREFIX="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.tar.gz||g')" APP_NAME_ARCHIVED="oauth2_proxy"; fi
      if [ "$2" = "wrangler" ]; then APP_RESOURCE_PREFIX="" FOLDER_PREFIX="dist" APP_NAME_ARCHIVED="${APP_NAME}"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\*64\*"${APP_RESOURCE_SUFFIX}" | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME_ARCHIVED}" ${TAR_ARGS} --strip-components=1 && \
      mv "${INSTALL_DIR:?}"/"${APP_NAME_ARCHIVED}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2>/dev/null ; \
      chmod_binary-echo_success-exit_0
    ;;

    "age" | "age-keygen" | "autocert" | "frpc" | "frps" | "gh" | "gitui" | "hub" | "ipfs" | "plik" | "plikd" | \
    "rage" | "rage-keygen" | "step" | "vector" | "vigil")
      COMPONENT_COUNT="1"
      APP_RESOURCE_PREFIX="inux"
      if [ "$2" = "age" ] || [ "$2" = "age-keygen" ]; then FOLDER_PREFIX="age"; fi
      if [ "$2" = "autocert" ]; then FOLDER_PREFIX="${APP_NAME}_${APP_VERSION}/bin" COMPONENT_COUNT="2"; fi
      if [ "$2" = "frpc" ] || [ "$2" = "frps" ]; then FOLDER_PREFIX="frp_${APP_VERSION}_linux_amd64"; fi
      if [ "$2" = "gh" ] || [ "$2" = "hub" ]; then FOLDER_PREFIX="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.t.*gz|/bin|g')" COMPONENT_COUNT="2"; fi
      if [ "$2" = "gitui" ]; then FOLDER_PREFIX="." COMPONENT_COUNT="1" APP_RESOURCE_PREFIX="musl"; fi
      if [ "$2" = "ipfs" ]; then FOLDER_PREFIX="go-ipfs"; fi
      if [ "$2" = "plik" ]; then FOLDER_PREFIX="plik-${APP_VERSION}/clients/linux-amd64" COMPONENT_COUNT="3"; fi
      if [ "$2" = "plikd" ]; then FOLDER_PREFIX="plik-${APP_VERSION}/server" COMPONENT_COUNT="2"; fi
      if [ "$2" = "rage" ] || [ "$2" = "rage-keygen" ]; then FOLDER_PREFIX="rage"; fi
      if [ "$2" = "step" ]; then FOLDER_PREFIX="${APP_NAME}_${APP_VERSION}/bin" COMPONENT_COUNT="2"; fi
      if [ "$2" = "vector" ]; then FOLDER_PREFIX="./${APP_NAME}-x86_64-unknown-linux-musl/bin" COMPONENT_COUNT="3"; fi
      if [ "$2" = "vigil" ]; then FOLDER_PREFIX="./${APP_NAME}" COMPONENT_COUNT="2" APP_RESOURCE_PREFIX="64"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME}" ${TAR_ARGS} --strip-components="${COMPONENT_COUNT}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "andesite" | "arc" | "argocd" | "avif" | "blocky" | "bombardier" | "borg" | "ctop" | "docker-compose" | \
    "docker-machine" | "duplicacy" | "eureka" | "ffsend" | "fluxctl" | "gdrive" | "gget" | "gitea" | "go-auto-yt" | \
    "gomplate" | "gomuks" | "gossa" | "gpldr-client" | "httpstat" | "insect" | "jq" | "kompose" | "linuxkit" | \
    "matterbridge" | "mkcert" | "monitoror" | "opa" | "plexdrive" | "reg" | "rio" | "rke" | "simple-vpn" | \
    "slack-term" | "stegify" | "sup" | "swagger" | "tableview" | "unetbootin" | "transfersh" | "wuzz" | "yq")
      if [ "$2" = "ffsend" ]; then APP_RESOURCE_SUFFIX="static"; fi
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*inux\*64\*"${APP_RESOURCE_SUFFIX}" && \
      echo_success-exit_0
    ;;

    "authelia" | "brig" | "jellycli" | "nnn" | "podman-remote" | "sdns" | "spotifyd" | "spt" | "tldr++" | "zenith")
      APP_RESOURCE_PREFIX="inux"
      APP_RESOURCE_SUFFIX="64"
      if [ "$2" = "authelia" ] || [ "$2" = "brig" ]; then RESOURCE_NAME="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.tar.gz||g')"; fi
      if [ "$2" = "jellycli" ]; then RESOURCE_NAME="Jellycli"; fi
      if [ "$2" = "nnn" ]; then APP_RESOURCE_PREFIX="static" RESOURCE_NAME="${APP_NAME}-static"; fi
      if [ "$2" = "podman-remote" ]; then APP_RESOURCE_PREFIX="static" APP_RESOURCE_SUFFIX=".tar.gz" RESOURCE_NAME="${APP_NAME}"; fi
      if [ "$2" = "sdns" ]; then RESOURCE_NAME="${APP_NAME}_linux_amd64"; fi
      if [ "$2" = "spotifyd" ]; then APP_RESOURCE_SUFFIX="-full" RESOURCE_NAME="${APP_NAME}"; fi
      if [ "$2" = "spt" ]; then APP_RESOURCE_SUFFIX="" RESOURCE_NAME="${APP_NAME}"; fi
      if [ "$2" = "tldr++" ]; then RESOURCE_NAME="tldr"; fi
      if [ "$2" = "zenith" ]; then APP_RESOURCE_SUFFIX=".tgz" RESOURCE_NAME="${APP_NAME}"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\*"${APP_RESOURCE_SUFFIX}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}" ${TAR_ARGS} && \
      mv "${INSTALL_DIR:?}"/"${RESOURCE_NAME:?}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2>/dev/null ; \
      chmod_binary-echo_success-exit_0
    ;;

    "bat" | "delta" | "diskus" | "fd" | "frece" | "hexyl" | "hyperfine" | "lucid" | "pastel" | "rg" | "rga" | \
    "rga-preproc" | "sccache" | "vivid")
      APP_ARCH="gnu"
      if [ "$2" = "rg" ] || [ "$2" = "rga" ] || [ "$2" = "rga-preproc" ] || [ "$2" = "sccache" ]; then APP_ARCH="musl"; fi
      RESOURCE_NAME="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* | sed 's|.tar.gz||g')"
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod_binary-echo_success-exit_0
    ;;

    "bed" | "caire" | "ccat" | "dnscrypt-proxy" | "dnsproxy" | "etcd" | "etcdctl" | "gogs" | "golangci-lint" | \
    "json2csv" | "louketo-proxy" | "oragono" | "portainer" | "rqbench" |"rqlite" |"rqlited" | "ssh-auditor" | \
    "stdiscosrv" | "strelaysrv" | "syncthing" | "velero")
      RESOURCE_NAME="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.tar.gz||g')"
      if [ "$2" = "dnscrypt-proxy" ]; then RESOURCE_NAME="linux-x86_64"; fi
      if [ "$2" = "dnsproxy" ]; then RESOURCE_NAME="linux-amd64"; fi
      if [ "$2" = "gogs" ]; then RESOURCE_NAME="gogs" APP_RESOURCE_SUFFIX=".tar.gz"; fi
      if [ "$2" = "portainer" ]; then RESOURCE_NAME="portainer"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\*"${APP_RESOURCE_SUFFIX}" | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod_binary-echo_success-exit_0
    ;;

    "bin" | "cobalt" | "edgedns" | "imdl" | "mdbook" | "starship" | "xsv" | "ytop" | "zola")
      APP_ARCH="gnu"
      if [ "$2" = "imdl" ] || [ "$2" = "xsv" ]; then APP_ARCH="musl"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "bw" | "ethr" | "json5" | "pegasus-fe" | "rattlesnakeos-stack")
      APP_RESOURCE_PREFIX="inux"
      if [ "$2" = "pegasus-fe" ]; then APP_RESOURCE_PREFIX="x11-static"; fi
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"=\*"${APP_RESOURCE_PREFIX}"\*"${APP_RESOURCE_SUFFIX}"\*&& \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR:?}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "chisel" | "cloud-torrent" | "goatcounter" | "govc")
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | \
      gunzip > "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "comics-downloader" | "composer" | "findomain" | "firecracker" | "jailer" | "magneticod" | "magneticow" | \
    "ginstall.sh" | "gorush" | "gosu" | "handlr" | "inlets" | "k3s" | "komga" | "rust-analyzer" | "youtube-dl")
      APP_RESOURCE_SUFFIX="*"
      case "$2" in
        "comics-downloader" | "ginstall.sh" | "handlr" | "inlets" | "k3s" | "magneticod" | "magneticow" | \
        "youtube-dl")
           APP_RESOURCE_SUFFIX=""
        ;;

        "rust-analyzer")
          APP_RESOURCE_SUFFIX="inux"
        ;;
      esac
      if [ "$2" = "composer" ]; then APP_EXTENSION=".phar"; fi
      if [ "$2" = "komga" ]; then APP_EXTENSION=".jar"; fi
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}""${APP_EXTENSION}"=\*"${APP_RESOURCE}"\*"${APP_RESOURCE_SUFFIX}"\* && \
      echo_success-exit_0
    ;;

    "ddgr" | "googler" | "shellcheck" | "upx")
      if [ "$2" = "ddgr" ] || [ "$2" = "googler" ]; then FOLDER_PREFIX="usr/bin" COMPONENT_COUNT="2"; fi
      if [ "$2" = "shellcheck" ]; then FOLDER_PREFIX="shellcheck-v${APP_VERSION}" COMPONENT_COUNT="1"; fi
      if [ "$2" = "upx" ]; then FOLDER_PREFIX="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*tar.xz | sed 's|.tar.xz||g')" COMPONENT_COUNT="1"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*tar.xz | \
      tar -xJf- -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME}" ${TAR_ARGS} --strip-components="${COMPONENT_COUNT}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "amass" | "discord-console" | "rclone" | "s")
      RESOURCE_NAME="$(gget --show-resources ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\* | sed 's|.zip||g')"
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"=\*inux\* && \
      if [ "$2" = "discord-console" ]; then
        APP_NAME_ARCHIVED="DiscordConsole"
        unzip -qjo "${TMP_DIR_ZIP}" "${RESOURCE_NAME:?}"/64-bit/"${APP_NAME_ARCHIVED}" -d "${INSTALL_DIR:?}"
      else
        APP_NAME_ARCHIVED="$2"
        unzip -qjo "${TMP_DIR_ZIP}" "${RESOURCE_NAME:?}"/"${APP_NAME_ARCHIVED}" -d "${INSTALL_DIR:?}"
      fi
      mv "${INSTALL_DIR:?}"/"${APP_NAME_ARCHIVED}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2>/dev/null ; \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "discord-delete" | "dnscontrol" | "dobi" | "drive" | "fn")
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*inux\* && \
      echo_success-exit_0
    ;;

    "docker-credential-pass" | "future-vuls" | "fx" | "hugo" | "hugo-extended" | "rootlessctl" | "rootlesskit" | \
    "trivy-to-vuls" | "vuls")
      if [ "$2" = "rootlesskit" ] || [ "$2" = "rootlessctl" ]; then APP_RESOURCE=""; fi
      if [ "$2" = "hugo" ]; then APP_RESOURCE="hugo_${APP_VERSION}"; fi
      if [ "$2" = "hugo-extended" ]; then APP_RESOURCE="hugo_extended" APP_NAME="hugo"; fi
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${APP_RESOURCE}"\*64\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "exa" | "pgweb")
      if [ "$2" = "exa" ]; then APP_NAME_SUFFIX="-linux-x86_64"; fi
      if [ "$2" = "pgweb" ]; then APP_NAME_SUFFIX="_linux_amd64"; fi
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"=\*inux\*64\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}""${APP_NAME_SUFFIX}" -d "${INSTALL_DIR:?}" && \
      mv "${INSTALL_DIR:?}"/"${APP_NAME}""${APP_NAME_SUFFIX}" "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "deno_lint" | "identity" | "uplink")
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"="${APP_RESOURCE}"\*inux\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR:?}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "jsteg" | "linx-cleanup" | "linx-genkey" | "linx-server" | "pebble" | "pebble-challtestsrv" | "slink")
      if [ "$2" = "pebble" ]; then APP_RESOURCE="pebble_"; fi
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"="${APP_RESOURCE}"\*inux\*64\* && \
      echo_success-exit_0
    ;;

    "logcli" | "loki" | "promtail")
      gget ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"="${APP_RESOURCE}"\*inux\*64\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-amd64 -d "${INSTALL_DIR:?}" && \
      mv "${INSTALL_DIR:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "sslocal" | "ssmanager" | "ssserver" | "ssurl")
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*gnu\* | \
      tar -xJf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "ffmpeg")
      case "$3" in
        "latest")
          APP_VERSION="$(curl -sSL https://johnvansickle.com/ffmpeg/ | grep release: | sed 's|.* ||g;s|</th>||g')"
          INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
          FFMPEG_URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
        ;;

        "4.2.3")
          FFMPEG_URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
        ;;

        *)
          FFMPEG_URL="https://www.johnvansickle.com/ffmpeg/old-releases/ffmpeg-${APP_VERSION}-amd64-static.tar.xz"
        ;;
      esac
      curl -Lf "${FFMPEG_URL}" | \
      tar -xJf- -C "${INSTALL_DIR:?}" "${APP_NAME}"-"${APP_VERSION}"-amd64-static/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod_binary-echo_success-exit_0
    ;;

    "go")
      if [ -z "${DIR_FLAG}" ]; then INSTALL_DIR=/usr/local; fi
      if [ "$3" = "latest" ]; then
        APP_VERSION="$(curl -sSL https://golang.org/dl/ | grep "downloadBox.*linux-amd64" | sed 's|.*go||g;s|.linux.*||g')"
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
      fi
      rm -rf "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      curl -Lf https://dl.google.com/go/go"${APP_VERSION}".linux-amd64.tar.gz | \
      tar -xzf- -C "${INSTALL_DIR:?}" ${TAR_ARGS} && \
      echo_success-exit_0
    ;;

    "gobuster")
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* > "${TMP_DIR_7Z}" && \
      7z e -so "${TMP_DIR_7Z}" > "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_7Z:?}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "helm")
      curl -Lf https://get.helm.sh/helm-v"${APP_VERSION}"-linux-amd64.tar.gz | \
      tar -xzf- -C "${INSTALL_DIR:?}" linux-amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod_binary-echo_success-exit_0
    ;;

    "hey")
      curl -Lf -o "${INSTALL_DIR:?}"/"${APP_NAME}" https://storage.googleapis.com/hey-release/hey_linux_amd64 && \
      chmod_binary-echo_success-exit_0
    ;;

    "restic")
      gget --stdout ${EXCL_EXTRAS} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | \
      bunzip2 > "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "unftp")
      gget --executable ${EXCL_EXTRAS} ${EXCL_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*64\*inux\*-musl && \
      echo_success-exit_0
    ;;

    *)
      echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
      exit 1
    ;;
  esac
else
  echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}"
  exit 1
fi
