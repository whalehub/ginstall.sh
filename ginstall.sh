#!/bin/bash

# ------------------------------------------------------------------ #

GINSTALL_SH_VERSION="2.6.0"

# ------------------------------------------------------------------ #

INSTALL_DIR="/usr/local/bin"

GGET_LOCATION="$(command -v "gget")"

TMP_DIR_7Z="/tmp/ginstall.7z"
TMP_DIR_ZIP="/tmp/ginstall.zip"

TAR_ARGS="--no-same-owner --no-same-permissions"

VERSION_PREFIX="@v"

MISSING_DEPENDENCY="Error: To use this flag, you must first install ginstall.sh's dependency gget."
MISSING_DEPENDENCY_INSTALL="Error: To install an application with ginstall.sh, you must first install its dependency gget."
PERMISSION_DENIED="Error: This script needs to be running as root or with sudo."
UNSUPPORTED_APP="Error: This application is not supported by ginstall.sh."

USAGE_INFORMATION="Please run \"ginstall.sh --help\" for usage information."

# ------------------------------------------------------------------ #

# A
REPO_ACME_DNS="github.com/joohoi/acme-dns"
REPO_ADGUARDHOME="github.com/AdguardTeam/AdGuardHome"
REPO_AGE="github.com/FiloSottile/age"
REPO_AGE_KEYGEN="github.com/FiloSottile/age"
REPO_ANDESITE="github.com/nektro/andesite"
REPO_ANNIE="github.com/iawia002/annie"
REPO_APIZZA="github.com/harrybrwn/apizza"
REPO_ARC="github.com/mholt/archiver"
REPO_ARGOCD="github.com/argoproj/argo-cd"
REPO_AUTHELIA="github.com/authelia/authelia"
REPO_AUTOCERT="github.com/smallstep/autocert"
REPO_AVIF="github.com/Kagami/go-avif"

# B
REPO_BAT="github.com/sharkdp/bat"
REPO_BED="github.com/itchyny/bed"
REPO_BIN="github.com/w4/bin"
REPO_BLOCKY="github.com/0xERR0R/blocky"
REPO_BOMBARDIER="github.com/codesenberg/bombardier"
REPO_BRIG="github.com/sahib/brig"
REPO_BW="github.com/bitwarden/cli"

# C
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

# D
REPO_DDGR="github.com/jarun/ddgr"
REPO_DDNS_ROUTE53="github.com/crazy-max/ddns-route53"
REPO_DELTA="github.com/dandavison/delta"
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

# E
REPO_EDGEDNS="github.com/jedisct1/edgedns"
REPO_ETCD="github.com/etcd-io/etcd"
REPO_ETCDCTL="github.com/etcd-io/etcd"
REPO_ETHR="github.com/microsoft/ethr"
REPO_EUREKA="github.com/mimoo/eureka"
REPO_EXA="github.com/ogham/exa"

# F
REPO_FD="github.com/sharkdp/fd"
REPO_FFMPEG="github.com/FFmpeg/FFmpeg"
REPO_FFSEND="github.com/timvisee/ffsend"
REPO_FILEBROWSER="github.com/filebrowser/filebrowser"
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

# G
REPO_GDRIVE="github.com/gdrive-org/gdrive"
REPO_GEOIP_UPDATER="github.com/crazy-max/geoip-updater"
REPO_GGET="github.com/dpb587/gget"
REPO_GH="github.com/cli/cli"
REPO_GINSTALL_SH="github.com/whalehub/ginstall.sh"
REPO_GIT_HOOKS="github.com/git-hooks/git-hooks"
REPO_GIT_REWRITE_AUTHOR="github.com/crazy-max/git-rewrite-author"
REPO_GITBATCH="github.com/isacikgoz/gitbatch"
REPO_GITEA="github.com/go-gitea/gitea"
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
REPO_GOSSA="github.com/pldubouilh/gossa"
REPO_GOSU="github.com/tianon/gosu"
REPO_GOTTY="github.com/yudai/gotty"
REPO_GOVC="github.com/vmware/govmomi"
REPO_GPLDR_CLIENT="github.com/Depado/goploader"
REPO_GPLDR_SERVER="github.com/Depado/goploader"

# H
REPO_HEXYL="github.com/sharkdp/hexyl"
REPO_HEY="github.com/rakyll/hey"
REPO_HTTPSTAT="github.com/davecheney/httpstat"
REPO_HUGO="github.com/gohugoio/hugo"
REPO_HUGO_EXTENDED="github.com/gohugoio/hugo"
REPO_HYPERFINE="github.com/sharkdp/hyperfine"

# I
REPO_IDENTITY="github.com/storj/storj"
REPO_IMDL="github.com/casey/intermodal"
REPO_INLETS="github.com/inlets/inlets"
REPO_INSECT="github.com/sharkdp/insect"
REPO_INTERCERT="github.com/evenh/intercert"
REPO_IPFS="github.com/ipfs/go-ipfs"

# J
REPO_JAILER="github.com/firecracker-microvm/firecracker"
REPO_JELLYCLI="github.com/tryffel/jellycli"
REPO_JSON2CSV="github.com/jehiah/json2csv"
REPO_JSON5="github.com/yosuke-furukawa/json5"
REPO_JSTEG="github.com/lukechampine/jsteg"

# K
REPO_K3S="github.com/rancher/k3s"
REPO_K9S="github.com/derailed/k9s"
REPO_KOMGA="github.com/gotson/komga"
REPO_KOMPOSE="github.com/kubernetes/kompose"

# L
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

# M
REPO_MAGNETICOD="github.com/boramalper/magnetico"
REPO_MAGNETICOW="github.com/boramalper/magnetico"
REPO_MATTERBRIDGE="github.com/42wim/matterbridge"
REPO_MDBOOK="github.com/rust-lang/mdBook"
REPO_MICRO="github.com/zyedidia/micro"
REPO_MIGRATE="github.com/golang-migrate/migrate"
REPO_MINIFY="github.com/tdewolff/minify"
REPO_MKCERT="github.com/FiloSottile/mkcert"
REPO_MONITOROR="github.com/monitoror/monitoror"

# N
REPO_NAABU="github.com/projectdiscovery/naabu"
REPO_NAVIDROME="github.com/deluan/navidrome"
REPO_NEBULA="github.com/slackhq/nebula"
REPO_NEBULA_CERT="github.com/slackhq/nebula"
REPO_NILTALK="github.com/knadh/niltalk"
REPO_NNN="github.com/jarun/nnn"

# O
REPO_OAUTH2_PROXY="github.com/oauth2-proxy/oauth2-proxy"
REPO_OPA="github.com/open-policy-agent/opa"
REPO_ORAGONO="github.com/oragono/oragono"

# P
REPO_PARCELLO="github.com/phogolabs/parcello"
REPO_PASTEL="github.com/sharkdp/pastel"
REPO_PEACH="github.com/peachdocs/peach"
REPO_PEBBLE="github.com/letsencrypt/pebble"
REPO_PEBBLE_CHALLTESTSRV="github.com/letsencrypt/pebble"
REPO_PGWEB="github.com/sosedoff/pgweb"
REPO_PKGER="github.com/markbates/pkger"
REPO_PLEXDRIVE="github.com/plexdrive/plexdrive"
REPO_PLIK="github.com/root-gg/plik"
REPO_PLIKD="github.com/root-gg/plik"
REPO_PODMAN_REMOTE="github.com/containers/libpod"
REPO_POMERIUM="github.com/pomerium/pomerium"
REPO_POMERIUM_CLI="github.com/pomerium/pomerium"
REPO_PORTAINER="github.com/portainer/portainer"
REPO_PROMTAIL="github.com/grafana/loki"

# Q
REPO_QRCP="github.com/claudiodangelis/qrcp"

# R
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
REPO_ROOTLESSCTL="github.com/rootless-containers/rootlesskit"
REPO_ROOTLESSKIT="github.com/rootless-containers/rootlesskit"

# S
REPO_S="github.com/zquestz/s"
REPO_S2C="github.com/klauspost/compress"
REPO_S2D="github.com/klauspost/compress"
REPO_SDNS="github.com/semihalev/sdns"
REPO_SHELLCHECK="github.com/koalaman/shellcheck"
REPO_SIMPLE_VPN="github.com/skx/simple-vpn"
REPO_SLACK_TERM="github.com/erroneousboat/slack-term"
REPO_SLINK="github.com/lukechampine/jsteg"
REPO_SSH_AUDITOR="github.com/ncsa/ssh-auditor"
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

# T
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

# U
REPO_UNFTP="github.com/bolcom/unFTP"
REPO_UP="github.com/apex/up"
REPO_UPLINK="github.com/storj/storj"
REPO_UPX="github.com/upx/upx"

# V
REPO_VECTOR="github.com/timberio/vector"
REPO_VELERO="github.com/vmware-tanzu/velero"
REPO_VIGIL="github.com/valeriansaliou/vigil"
REPO_VIVID="github.com/sharkdp/vivid"
REPO_VSPHERE_INFLUXDB_GO="github.com/Oxalide/vsphere-influxdb-go"
REPO_VULS="github.com/future-architect/vuls"

# W
REPO_WATCHTOWER="github.com/containrrr/watchtower"
REPO_WUZZ="github.com/asciimoo/wuzz"

# X
REPO_XSV="github.com/BurntSushi/xsv"

# Y
REPO_YOUTUBE_DL="github.com/ytdl-org/youtube-dl"
REPO_YQ="github.com/mikefarah/yq"
REPO_YTOP="github.com/cjbassi/ytop"

# Z
REPO_ZENITH="github.com/bvaisvil/zenith"
REPO_ZOLA="github.com/getzola/zola"

# ------------------------------------------------------------------ #

SUPPORTED_APPS_HEADER="Application:                Repository:
------------                -----------"

SUPPORTED_APPS_LIST="
A
acme-dns                    $REPO_ACME_DNS
adguardhome                 $REPO_ADGUARDHOME
age                         $REPO_AGE
age-keygen                  $REPO_AGE_KEYGEN
andesite                    $REPO_ANDESITE
annie                       $REPO_ANNIE
apizza                      $REPO_APIZZA
arc                         $REPO_ARC
argocd                      $REPO_ARGOCD
authelia                    $REPO_AUTHELIA
autocert                    $REPO_AUTOCERT
avif                        $REPO_AVIF

B
bat                         $REPO_BAT
bed                         $REPO_BED
bin                         $REPO_BIN
blocky                      $REPO_BLOCKY
bombardier                  $REPO_BOMBARDIER
brig                        $REPO_BRIG
bw                          $REPO_BW

C
caddy                       $REPO_CADDY
caire                       $REPO_CAIRE
captainhook                 $REPO_CAPTAINHOOK
ccat                        $REPO_CCAT
chisel                      $REPO_CHISEL
chroma                      $REPO_CHROMA
cloud-torrent               $REPO_CLOUD_TORRENT
cobalt                      $REPO_COBALT
comics-downloader           $REPO_COMICS_DOWNLOADER
composer                    $REPO_COMPOSER
coredns                     $REPO_COREDNS
croc                        $REPO_CROC
ctop                        $REPO_CTOP

D
ddgr                        $REPO_DDGR
ddns-route53                $REPO_DDNS_ROUTE53
delta                       $REPO_DELTA
discord-console             $REPO_DISCORD_CONSOLE
discord-delete              $REPO_DISCORD_DELETE
diskus                      $REPO_DISKUS
diun                        $REPO_DIUN
dive                        $REPO_DIVE
dnscontrol                  $REPO_DNSCONTROL
dnscrypt-proxy              $REPO_DNSCRYPT_PROXY
dnsproxy                    $REPO_DNSPROXY
dobi                        $REPO_DOBI
docker-compose              $REPO_DOCKER_COMPOSE
docker-credential-pass      $REPO_DOCKER_CREDENTIAL_PASS
docker-gen                  $REPO_DOCKER_GEN
docker-machine              $REPO_DOCKER_MACHINE
drive                       $REPO_DRIVE
drone                       $REPO_DRONE
duplicacy                   $REPO_DUPLICACY

E
edgedns                     $REPO_EDGEDNS
etcd                        $REPO_ETCD
etcdctl                     $REPO_ETCDCTL
ethr                        $REPO_ETHR
eureka                      $REPO_EUREKA
exa                         $REPO_EXA

F
fd                          $REPO_FD
ffmpeg                      $REPO_FFMPEG
ffsend                      $REPO_FFSEND
filebrowser                 $REPO_FILEBROWSER
firecracker                 $REPO_FIRECRACKER
fluxctl                     $REPO_FLUXCTL
fn                          $REPO_FN
frece                       $REPO_FRECE
frpc                        $REPO_FRPC
frps                        $REPO_FRPS
ftpgrab                     $REPO_FTPGRAB
future-vuls                 $REPO_FUTURE_VULS
fx                          $REPO_FX
fzf                         $REPO_FZF_SOURCE

G
gdrive                      $REPO_GDRIVE
geoip-updater               $REPO_GEOIP_UPDATER
gget                        $REPO_GGET
gh                          $REPO_GH
ginstall.sh                 $REPO_GINSTALL_SH
git-hooks                   $REPO_GIT_HOOKS
git-rewrite-author          $REPO_GIT_REWRITE_AUTHOR
gitbatch                    $REPO_GITBATCH
gitea                       $REPO_GITEA
go                          $REPO_GO
go-auto-yt                  $REPO_GO_AUTO_YT
goatcounter                 $REPO_GOATCOUNTER
gobuster                    $REPO_GOBUSTER
gogs                        $REPO_GOGS
golangci-lint               $REPO_GOLANGCI_LINT
gomplate                    $REPO_GOMPLATE
gomuks                      $REPO_GOMUKS
googler                     $REPO_GOOGLER
gopass                      $REPO_GOPASS
goreleaser                  $REPO_GORELEASER
gossa                       $REPO_GOSSA
gosu                        $REPO_GOSU
gotty                       $REPO_GOTTY
govc                        $REPO_GOVC
gpldr-client                $REPO_GPLDR_CLIENT
gpldr-server                $REPO_GPLDR_SERVER

H
hexyl                       $REPO_HEXYL
hey                         $REPO_HEY
httpstat                    $REPO_HTTPSTAT
hugo                        $REPO_HUGO
hugo-extended               $REPO_HUGO_EXTENDED
hyperfine                   $REPO_HYPERFINE

I
identity                    $REPO_IDENTITY
imdl                        $REPO_IMDL
inlets                      $REPO_INLETS
insect                      $REPO_INSECT
intercert                   $REPO_INTERCERT
ipfs                        $REPO_IPFS

J
jailer                      $REPO_JAILER
jellycli                    $REPO_JELLYCLI
json2csv                    $REPO_JSON2CSV
json5                       $REPO_JSON5
jsteg                       $REPO_JSTEG

K
k3s                         $REPO_K3S
k9s                         $REPO_K9S
komga                       $REPO_KOMGA
kompose                     $REPO_KOMPOSE

L
lazydocker                  $REPO_LAZYDOCKER
lego                        $REPO_LEGO
linuxkit                    $REPO_LINUXKIT
linx-cleanup                $REPO_LINX_CLEANUP
linx-genkey                 $REPO_LINX_GENKEY
linx-server                 $REPO_LINX_SERVER
logcli                      $REPO_LOGCLI
loki                        $REPO_LOKI
louketo-proxy               $REPO_LOUKETO_PROXY
lucid                       $REPO_LUCID

M
magneticod                  $REPO_MAGNETICOD
magneticow                  $REPO_MAGNETICOW
matterbridge                $REPO_MATTERBRIDGE
mdbook                      $REPO_MDBOOK
micro                       $REPO_MICRO
migrate                     $REPO_MIGRATE
minify                      $REPO_MINIFY
mkcert                      $REPO_MKCERT
monitoror                   $REPO_MONITOROR

N
naabu                       $REPO_NAABU
navidrome                   $REPO_NAVIDROME
nebula                      $REPO_NEBULA
nebula-cert                 $REPO_NEBULA_CERT
niltalk                     $REPO_NILTALK
nnn                         $REPO_NNN

O
oauth2-proxy                $REPO_OAUTH2_PROXY
opa                         $REPO_OPA
oragono                     $REPO_ORAGONO

P
parcello                    $REPO_PARCELLO
pastel                      $REPO_PASTEL
peach                       $REPO_PEACH
pebble                      $REPO_PEBBLE
pebble-challtestsrv         $REPO_PEBBLE_CHALLTESTSRV
pgweb                       $REPO_PGWEB
pkger                       $REPO_PKGER
plexdrive                   $REPO_PLEXDRIVE
plik                        $REPO_PLIK
plikd                       $REPO_PLIKD
podman-remote               $REPO_PODMAN_REMOTE
pomerium                    $REPO_POMERIUM
pomerium-cli                $REPO_POMERIUM_CLI
portainer                   $REPO_PORTAINER
promtail                    $REPO_PROMTAIL

Q
qrcp                        $REPO_QRCP

R
rage                        $REPO_RAGE
rage-keygen                 $REPO_RAGE_KEYGEN
rattlesnakeos-stack         $REPO_RATTLESNAKEOS_STACK
rclone                      $REPO_RCLONE
red                         $REPO_RED
reg                         $REPO_REG
restic                      $REPO_RESTIC
rg                          $REPO_RG
rga                         $REPO_RGA
rga-preproc                 $REPO_RGA_PREPROC
rio                         $REPO_RIO
rootlessctl                 $REPO_ROOTLESSCTL
rootlesskit                 $REPO_ROOTLESSKIT

S
s                           $REPO_S
s2c                         $REPO_S2C
s2d                         $REPO_S2D
sdns                        $REPO_SDNS
shellcheck                  $REPO_SHELLCHECK
simple-vpn                  $REPO_SIMPLE_VPN
slack-term                  $REPO_SLACK_TERM
slink                       $REPO_SLINK
ssh-auditor                 $REPO_SSH_AUDITOR
sslocal                     $REPO_SSLOCAL
ssmanager                   $REPO_SSMANAGER
ssserver                    $REPO_SSSERVER
ssurl                       $REPO_SSURL
starship                    $REPO_STARSHIP
statping                    $REPO_STATPING
stdiscosrv                  $REPO_STDISCOSRV
stegify                     $REPO_STEGIFY
step                        $REPO_STEP
strelaysrv                  $REPO_STRELAYSRV
sup                         $REPO_SUP
swagger                     $REPO_SWAGGER
swarm-cronjob               $REPO_SWARM_CRONJOB
syncthing                   $REPO_SYNCTHING

T
tableview                   $REPO_TABLEVIEW
task                        $REPO_TASK
tengo                       $REPO_TENGO
tldr++                      $REPO_TLDR_PLUS_PLUS
traefik                     $REPO_TRAEFIK
transfersh                  $REPO_TRANSFERSH
travis-wait-enhanced        $REPO_TRAVIS_WAIT_ENHANCED
trivy                       $REPO_TRIVY
trivy-to-vuls               $REPO_TRIVY_TO_VULS
txeh                        $REPO_TXEH

U
unftp                       $REPO_UNFTP
up                          $REPO_UP
uplink                      $REPO_UPLINK
upx                         $REPO_UPX

V
vector                      $REPO_VECTOR
velero                      $REPO_VELERO
vigil                       $REPO_VIGIL
vivid                       $REPO_VIVID
vsphere-influxdb-go         $REPO_VSPHERE_INFLUXDB_GO
vuls                        $REPO_VULS

W
watchtower                  $REPO_WATCHTOWER
wuzz                        $REPO_WUZZ

X
xsv                         $REPO_XSV

Y
youtube-dl                  $REPO_YOUTUBE_DL
yq                          $REPO_YQ
ytop                        $REPO_YTOP

Z
zenith                      $REPO_ZENITH
zola                        $REPO_ZOLA"

# ------------------------------------------------------------------ #

HELP="About:
  ginstall.sh is a script for installing and updating statically compiled applications.

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

# ------------------------------------------------------------------ #

ARGS="$(getopt -l check:,directory:,first-run,help,list,remove:,search:,self-update,version -o c:d:hlr:s:v -n ginstall.sh -- "$@")"

if [ $? -ne 0 ]; then
  exit 1
fi

eval set -- "$ARGS"
unset ARGS

# ------------------------------------------------------------------ #

case "$1" in
  "--check" | "-c")
    if [ -z "${GGET_LOCATION}" ]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}"
      exit 1
    else
      case "$2" in
        "age" | "age-keygen")
          echo -e "The latest version of $2 is v1.0.0-beta2."
          exit 0
        ;;

        "ffmpeg")
          CHECK_RESULT="$(curl -sSL https://ffmpeg.org/releases/ | grep "tar.gz\"" | sed 's|^.\{62\}||g;s|.tar.gz.*||g' | sort | sed '$!d')"
          echo -e "The latest version of $2 is v${CHECK_RESULT}."
          exit 0
        ;;

        "go")
          CHECK_RESULT="$(curl -sSL https://golang.org/dl/ | grep "span class.*src.tar.gz" | sed 's|^.\{27\}||g;s|.src.*||g')"
          echo -e "The latest version of $2 is v${CHECK_RESULT}."
          exit 0
        ;;

        "go-auto-yt")
          echo -e "The latest version of $2 is v0.5.1."
          exit 0
        ;;

        "insect")
          echo -e "The latest version of $2 is v5.3.0."
          exit 0
        ;;

        "intercert")
          echo -e "The latest version of $2 is v0.0.2."
          exit 0
        ;;

        "louketo-proxy")
          echo -e "The latest version of $2 is v1.0.0-alpha.1."
          exit 0
        ;;

        "rage" | "rage-keygen")
          echo -e "The latest version of $2 is v0.4.0."
          exit 0
        ;;

        *)
          REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')"
          CHECK_RESULT="$(gget --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
          if [ -z "${CHECK_RESULT}" ]; then
            echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
            exit 1
          else
            echo -e "The latest version of $2 is v${CHECK_RESULT}."
            exit 0
          fi
        ;;
      esac
    fi
  ;;

  "--directory" | "-d")
    INSTALL_DIR="$2"
    DIR_FLAG="true"

    case "$3" in
      "--check" | "-c" | "--help" | "-h" | "--list" | "-l" | "--remove" | "-r" | "--search" | "-s" | "--self-update" | "--version" | "-version")
        echo -e "The $1 flag can only be used as a prefix for the --first-run flag or the app argument.\n${USAGE_INFORMATION}"
        exit 1
      ;;

      "--first-run")
        curl -Lf -o "${INSTALL_DIR:?}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
        chmod 0755 "${INSTALL_DIR:?}"/gget && \
        echo -e "\nThe dependency gget has been successfully installed and ginstall.sh is now ready for use."
        exit 0
      ;;

      *)
        shift 2
      ;;
  esac
  ;;

  "--first-run")
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

  "--help" | "-h")
    echo -e "${HELP}"
    exit 0
  ;;

  "--list" | "-l")
    echo -e "${SUPPORTED_APPS_HEADER}""${SUPPORTED_APPS_LIST}"
    exit 0
  ;;

  "--remove" | "-r")
    UNINSTALL_SUCCESS="$2 was uninstalled successfully."
    REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')"
    if [ -z "${!REPO}" ]; then
      echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
      exit 1
    else
      case "$2" in
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

        "go")
          APP_LOCATION="$(command -v "$2" | sed 's|/bin/go||g')"
          rm -vr "${APP_LOCATION:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        *)
          APP_LOCATION="$(command -v "$2")"
          if [ "$2" = "composer" ]; then APP_LOCATION="$(command -v "$2".phar)"; fi
          if [ "$2" = "hugo-extended" ]; then APP_LOCATION="$(command -v "hugo")"; fi
          if [ "$2" = "komga" ]; then APP_LOCATION="$(command -v "$2".jar)"; fi
          if [ "$2" == "tldr++" ]; then APP_LOCATION="$(command -v "tldr")"; fi
          rm -v "${APP_LOCATION:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;
      esac
    fi
  ;;

  "--search" | "-s")
    echo -e "${SUPPORTED_APPS_HEADER}""\n""$(echo -e "$SUPPORTED_APPS_LIST" | grep "$2")"
    exit 0
  ;;

  "--self-update")
    if [ -z "${GGET_LOCATION}" ]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}"
      exit 1
    else
      APP_VERSION="$(gget --show-ref "${REPO_GINSTALL_SH}" | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
      gget --stdout "${REPO_GINSTALL_SH}""${VERSION_PREFIX}""${APP_VERSION}" 'ginstall.sh' > "$0" && \
      chmod 0755 "$0" && \
      echo -e "ginstall.sh successfully updated itself to the latest version (v${APP_VERSION})."
      exit 0
    fi
  ;;

  "--version" | "-v")
    echo -e "ginstall.sh version ${GINSTALL_SH_VERSION} linux/amd64"
    exit 0
  ;;
esac

# ------------------------------------------------------------------ #

if [ -z "${GGET_LOCATION}" ]; then
  echo -e "${MISSING_DEPENDENCY_INSTALL}\n${USAGE_INFORMATION}"
  exit 1
elif [ -z "$2" ]; then
  echo -e "Error: You forgot to supply an application name.\n${USAGE_INFORMATION}"
  exit 1
elif [ -z "$3" ]; then
  echo -e "Error: You forgot to supply a version number.\n${USAGE_INFORMATION}"
  exit 1
fi

# ------------------------------------------------------------------ #

APP_NAME="$2"
APP_RESOURCE="$2"
APP_VERSION="$3"

REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')"

INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR}."

# ------------------------------------------------------------------ #

if [ "$3" = "latest" ]; then
  if [ "$(id -u)" = "0" ] || [ "${DIR_FLAG}" = "true" ]; then
    case "$2" in
      "ffmpeg" | "go")
      ;;

      "age" | "age-keygen" | "go-auto-yt" | "insect" | "intercert" | "louketo-proxy" | "rage" | "rage-keygen")
        if [ "$2" = "age" ] || [ "$2" = "age-keygen" ]; then APP_VERSION="1.0.0-beta2"; fi
        if [ "$2" = "go-auto-yt" ]; then APP_VERSION="0.5.1"; fi
        if [ "$2" = "insect" ]; then APP_VERSION="5.3.0"; fi
        if [ "$2" = "intercert" ]; then APP_VERSION="0.0.2"; fi
        if [ "$2" = "louketo-proxy" ]; then APP_VERSION="1.0.0-alpha.1"; fi
        if [ "$2" = "rage" ] || [ "$2" = "rage-keygen" ]; then APP_VERSION="0.4.0"; fi
        INSTALL_SUCCESS="The latest version of ${APP_NAME} (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
      ;;

      *)
        if [ -z "${!REPO}" ]; then
          echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
          exit 1
        fi
        APP_VERSION="$(gget --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
        INSTALL_SUCCESS="The latest version of ${APP_NAME} (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
      ;;
    esac
  else
    echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}"
    exit 1
  fi
fi

# ------------------------------------------------------------------ #

rm_tmp_file-chmod_binary-echo_success-exit_0() {
  rm "${TMP_DIR_ZIP}" && \
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

# ------------------------------------------------------------------ #

EXCLUDE_GENERIC="--exclude=\"*-arm*\"       --exclude=\"*-canary-*\"    --exclude=\"*-gui\"         --exclude=\"*-slim\"        --exclude=\"*-source*\" \
                 --exclude=\"*.asc\"        --exclude=\"*.cid\"         --exclude=\"*.deb\"         --exclude=\"*.exe\"         --exclude=\"*.log\" \
                 --exclude=\"*.md5\"        --exclude=\"*.minisig\"     --exclude=\"*.msi\"         --exclude=\"*.nupkg*\"      --exclude=\"*.rpm\" \
                 --exclude=\"*.sha*5*\"     --exclude=\"*.txt\"         --exclude=\"*_arm*\"        --exclude=\"*_musl_*\"      --exclude=\"*386*\" \
                 --exclude=\"*686*\"        --exclude=\"*32*bit*\"      --exclude=\"*aarch*\"       --exclude=\"*acOS*\"        --exclude=\"*acos*\" \
                 --exclude=\"*ARM*\"        --exclude=\"*arwin*\"       --exclude=\"*DragonFly*\"   --exclude=\"*dragonfly*\"   --exclude=\"*FreeBSD*\" \
                 --exclude=\"*freebsd*\"    --exclude=\"*lan9*\"        --exclude=\"*llumos*\"      --exclude=\"*lpine*\"       --exclude=\"*indows*\" \
                 --exclude=\"*mips*\"       --exclude=\"*NetBSD*\"      --exclude=\"*netbsd*\"      --exclude=\"*olaris*\"      --exclude=\"*OpenBSD*\" \
                 --exclude=\"*openbsd*\"    --exclude=\"*OSX*\"         --exclude=\"*osx*\"         --exclude=\"*powerpc*\"     --exclude=\"*ppc64*\" \
                 --exclude=\"*riscv*\"      --exclude=\"*rpi*\"         --exclude=\"*s390x*\"       --exclude=\"MD5SUMS\"       --exclude=\"SHA*SUMS\" \
                 --exclude=\"sha*sums\""

EXCLUDE_ARCHIVES="--exclude=\"*.7z\"        --exclude=\"*.bz2\"         --exclude=\"*.gz\"          --exclude=\"*.tar\"         --exclude=\"*.xz\" \
                  --exclude=\"*.zip\""

# ------------------------------------------------------------------ #

if [ "$(id -u)" = "0" ] || [ "${DIR_FLAG}" = "true" ]; then
  case "$2" in
    "annie" | "captainhook" | "cloud-torrent" | "composer" | "delta" | "discord-console" | "discord-delete" | "dnscrypt-proxy" | "docker-compose" | \
    "docker-gen" | "edgedns" | "eureka" | "fluxctl" | "fn" | "frece" | "ftpgrab" | "fx" |"fzf" | "gdrive" | "git-rewrite-author" | "go-auto-yt" | \
    "gosu" | "inlets" | "louketo-proxy" | "monitoror" | "naabu" | "plexdrive" | "plik" | "plikd" | "portainer" | "qrcp" | "rg" | "simple-vpn" | \
    "xsv" | "youtube-dl" | "yq" | "ytop" | "zenith")
      VERSION_PREFIX="@"
    ;;
  esac

  case "$2" in
    "acme-dns" | "annie" | "apizza" | "caddy" | "captainhook" | "chroma" | "coredns" | "croc" | "ddns-route53" | "diun" | "dive" | "docker-gen" | \
    "drone" | "filebrowser" | "ftpgrab" | "fzf" | "geoip-updater" | "git-rewrite-author" | "gitbatch" | "gopass" | "goreleaser" | "intercert" | \
    "k9s" | "lazydocker" | "lego" | "minify" | "naabu" | "navidrome" | "nebula" | "nebula-cert" | "niltalk" | "parcello" | "peach" | "pkger" | \
    "pomerium" | "pomerium-cli" | "qrcp" | "red" | "s2c" | "s2d" | "statping" | "swarm-cronjob" | "task" | "tengo" | "traefik" | \
    "travis-wait-enhanced" | "trivy" | "txeh" | "up" | "vsphere-influxdb-go" | "watchtower")
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "adguardhome" | "git-hooks" | "gotty" | "gpldr-server" | "micro" | "migrate" | "oauth2-proxy")
      APP_RESOURCE_PREFIX="inux"
      if [ "$2" = "adguardhome" ]; then FOLDER_PREFIX="AdGuardHome" APP_NAME_ARCHIVED="AdGuardHome"; fi
      if [ "$2" = "git-hooks" ]; then FOLDER_PREFIX="build" APP_NAME_ARCHIVED="${APP_NAME}_linux_amd64"; fi
      if [ "$2" = "gotty" ]; then FOLDER_PREFIX="." APP_NAME_ARCHIVED="${APP_NAME}"; fi
      if [ "$2" = "gpldr-server" ]; then APP_RESOURCE_PREFIX="standalone" FOLDER_PREFIX="goploader-server" APP_NAME_ARCHIVED="server-standalone"; fi
      if [ "$2" = "micro" ]; then APP_RESOURCE_SUFFIX="static.tar.gz" FOLDER_PREFIX="${APP_NAME}-${APP_VERSION}" APP_NAME_ARCHIVED="micro"; fi
      if [ "$2" = "migrate" ]; then FOLDER_PREFIX="." APP_NAME_ARCHIVED="${APP_NAME}.linux-amd64"; fi
      if [ "$2" = "oauth2-proxy" ]; then FOLDER_PREFIX="$(gget --show-resources ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.tar.gz||g')" APP_NAME_ARCHIVED="oauth2_proxy"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\*64\*"${APP_RESOURCE_SUFFIX}" | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME_ARCHIVED}" ${TAR_ARGS} --strip-components=1 && \
      mv "${INSTALL_DIR:?}"/"${APP_NAME_ARCHIVED}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2>/dev/null ; \
      chmod_binary-echo_success-exit_0
    ;;

    "age" | "age-keygen" | "frpc" | "frps" | "ipfs" | "plik" | "plikd" | "rage" | "rage-keygen" | "step" | "vector" | "vigil")
      COMPONENT_COUNT="1"
      APP_RESOURCE_PREFIX="inux"
      if [ "$2" = "age" ] || [ "$2" = "age-keygen" ]; then FOLDER_PREFIX="age"; fi
      if [ "$2" = "frpc" ] || [ "$2" = "frps" ]; then FOLDER_PREFIX="frp_${APP_VERSION}_linux_amd64"; fi
      if [ "$2" = "ipfs" ]; then FOLDER_PREFIX="go-ipfs"; fi
      if [ "$2" = "plik" ]; then FOLDER_PREFIX="plik-${APP_VERSION}/clients/linux-amd64" COMPONENT_COUNT="3"; fi
      if [ "$2" = "plikd" ]; then FOLDER_PREFIX="plik-${APP_VERSION}/server" COMPONENT_COUNT="2"; fi
      if [ "$2" = "rage" ] || [ "$2" = "rage-keygen" ]; then FOLDER_PREFIX="rage"; fi
      if [ "$2" = "step" ]; then FOLDER_PREFIX="${APP_NAME}_${APP_VERSION}/bin" COMPONENT_COUNT="2"; fi
      if [ "$2" = "vector" ]; then FOLDER_PREFIX="./${APP_NAME}-x86_64-unknown-linux-musl/bin" COMPONENT_COUNT="3"; fi
      if [ "$2" = "vigil" ]; then FOLDER_PREFIX="./${APP_NAME}" COMPONENT_COUNT="2" APP_RESOURCE_PREFIX="64"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME}" ${TAR_ARGS} --strip-components="${COMPONENT_COUNT}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "andesite" | "arc" | "argocd" | "avif" | "blocky" | "bombardier" | "ctop" | "docker-compose" | "docker-machine" | "duplicacy" | "eureka" | \
    "ffsend" | "fluxctl" | "gdrive" | "gget" | "gitea" | "go-auto-yt" | "gomplate" | "gomuks" | "gossa" | "gpldr-client" | "httpstat" | "insect" | \
    "kompose" | "linuxkit" | "matterbridge" | "mkcert" | "monitoror" | "opa" | "plexdrive" | "reg" | "rio" | "simple-vpn" | "slack-term" | "stegify" | \
    "sup" | "swagger" | "tableview" | "transfersh" | "wuzz" | "yq")
      if [ "$2" = "ffsend" ]; then APP_RESOURCE_SUFFIX="static"; fi
      gget --executable ${EXCLUDE_GENERIC} ${EXCLUDE_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*inux\*64\*"${APP_RESOURCE_SUFFIX}" && \
      echo_success-exit_0
    ;;

    "authelia" | "brig" | "jellycli" | "nnn" | "podman-remote" | "sdns" | "tldr++" | "zenith")
      APP_RESOURCE_PREFIX="inux"
      APP_RESOURCE_SUFFIX="64"
      if [ "$2" = "authelia" ] || [ "$2" = "brig" ]; then RESOURCE_NAME="$(gget --show-resources ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.tar.gz||g')"; fi
      if [ "$2" = "jellycli" ]; then RESOURCE_NAME="Jellycli"; fi
      if [ "$2" = "nnn" ]; then APP_RESOURCE_PREFIX="static" RESOURCE_NAME="${APP_NAME}-static"; fi
      if [ "$2" = "podman-remote" ]; then APP_RESOURCE_PREFIX="static" APP_RESOURCE_SUFFIX=".tar.gz" RESOURCE_NAME="${APP_NAME}"; fi
      if [ "$2" = "sdns" ]; then RESOURCE_NAME="${APP_NAME}_linux_amd64"; fi
      if [ "$2" = "tldr++" ]; then RESOURCE_NAME="tldr"; fi
      if [ "$2" = "zenith" ]; then APP_RESOURCE_SUFFIX=".tgz" RESOURCE_NAME="${APP_NAME}"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*"${APP_RESOURCE_PREFIX}"\*"${APP_RESOURCE_SUFFIX}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}" ${TAR_ARGS} && \
      mv "${INSTALL_DIR:?}"/"${RESOURCE_NAME:?}" "${INSTALL_DIR:?}"/"${APP_NAME}" 2>/dev/null ; \
      chmod_binary-echo_success-exit_0
    ;;

    "bat" | "delta" | "diskus" | "fd" | "frece" | "hexyl" | "hyperfine" | "lucid" | "pastel" | "rg" | "rga" | "rga-preproc" | "vivid")
      APP_ARCH="gnu"
      if [ "$2" = "rg" ] || [ "$2" = "rga" ] || [ "$2" = "rga-preproc" ]; then APP_ARCH="musl"; fi
      RESOURCE_NAME="$(gget --show-resources ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* | sed 's|.tar.gz||g')"
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod_binary-echo_success-exit_0
    ;;

    "bed" | "caire" | "ccat" | "dnscrypt-proxy" | "dnsproxy" | "etcd" | "etcdctl" | "gogs" | "golangci-lint" | "json2csv" | "louketo-proxy" | \
    "oragono" | "portainer" | "ssh-auditor" | "stdiscosrv" | "strelaysrv" | "syncthing" | "velero")
      RESOURCE_NAME="$(gget --show-resources ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | sed 's|.tar.gz||g')"
      if [ "$2" = "dnscrypt-proxy" ]; then RESOURCE_NAME="linux-x86_64"; fi
      if [ "$2" = "dnsproxy" ]; then RESOURCE_NAME="linux-amd64"; fi
      if [ "$2" = "gogs" ]; then RESOURCE_NAME="gogs" APP_RESOURCE_SUFFIX=".tar.gz"; fi
      if [ "$2" = "portainer" ]; then RESOURCE_NAME="portainer"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\*"${APP_RESOURCE_SUFFIX}" | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${RESOURCE_NAME:?}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod_binary-echo_success-exit_0
    ;;

    "bin" | "cobalt" | "edgedns" | "imdl" | "mdbook" | "starship" | "xsv" | "ytop" | "zola")
      APP_ARCH="gnu"
      if [ "$2" = "imdl" ] || [ "$2" = "xsv" ]; then APP_ARCH="musl"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*"${APP_ARCH}"\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "bw" | "ethr" | "json5" | "rattlesnakeos-stack")
      gget ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"=\*inux\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR:?}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "chisel" | "cloud-torrent" | "goatcounter" | "govc")
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | \
      gzip -d > "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "comics-downloader" | "composer" | "firecracker" | "magneticod" | "magneticow" | "ginstall.sh" | "gosu" | "inlets" | "k3s" | "komga" | "youtube-dl")
      APP_RESOURCE_SUFFIX="*"
      case "$2" in
        "comics-downloader" | "ginstall.sh" | "inlets" | "k3s" | "magneticod" | "magneticow" | "youtube-dl")
           APP_RESOURCE_SUFFIX=""
        ;;
      esac
      if [ "$2" = "composer" ]; then APP_EXTENSION=".phar"; fi
      if [ "$2" = "komga" ]; then APP_EXTENSION=".jar"; fi
      gget --executable ${EXCLUDE_GENERIC} ${EXCLUDE_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}""${APP_EXTENSION}"="${APP_RESOURCE}""${APP_RESOURCE_SUFFIX}" && \
      echo_success-exit_0
    ;;

    "ddgr" | "googler" | "shellcheck" | "upx")
      if [ "$2" = "ddgr" ] || [ "$2" = "googler" ]; then FOLDER_PREFIX="usr/bin" COMPONENT_COUNT="2"; fi
      if [ "$2" = "shellcheck" ]; then FOLDER_PREFIX="shellcheck-v${APP_VERSION}" COMPONENT_COUNT="1"; fi
      if [ "$2" = "upx" ]; then FOLDER_PREFIX="$(gget --show-resources ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*tar.xz | sed 's|.tar.xz||g')" COMPONENT_COUNT="1"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*tar.xz | \
      tar -xJf- -C "${INSTALL_DIR:?}" "${FOLDER_PREFIX}"/"${APP_NAME}" ${TAR_ARGS} --strip-components="${COMPONENT_COUNT}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "discord-console" | "rclone" | "s")
      RESOURCE_NAME="$(gget --show-resources ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\* | sed 's|.zip||g')"
      gget ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"=\*inux\* && \
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
      gget --executable ${EXCLUDE_GENERIC} ${EXCLUDE_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*inux\* && \
      echo_success-exit_0
    ;;

    "docker-credential-pass" | "future-vuls" | "fx" | "hugo" | "hugo-extended" | "rootlessctl" | "rootlesskit" | "trivy-to-vuls" | "vuls")
      if [ "$2" = "rootlesskit" ] || [ "$2" = "rootlessctl" ]; then APP_RESOURCE=""; fi
      if [ "$2" = "hugo" ]; then APP_RESOURCE="hugo_${APP_VERSION}"; fi
      if [ "$2" = "hugo-extended" ]; then APP_RESOURCE="hugo_extended" APP_NAME="hugo"; fi
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${APP_RESOURCE}"\*64\* | \
      tar -xzf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

    "exa" | "pgweb")
      if [ "$2" = "exa" ]; then APP_NAME_SUFFIX="-linux-x86_64"; fi
      if [ "$2" = "pgweb" ]; then APP_NAME_SUFFIX="_linux_amd64"; fi
      gget ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"=\*inux\*64\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}""${APP_NAME_SUFFIX}" -d "${INSTALL_DIR:?}" && \
      mv "${INSTALL_DIR:?}"/"${APP_NAME}""${APP_NAME_SUFFIX}" "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "identity" | "uplink")
      gget ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"="${APP_RESOURCE}"\*inux\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR:?}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "jsteg" | "linx-cleanup" | "linx-genkey" | "linx-server" | "pebble" | "pebble-challtestsrv" | "slink")
      if [ "$2" = "pebble" ]; then APP_RESOURCE="pebble_"; fi
      gget --executable ${EXCLUDE_GENERIC} ${EXCLUDE_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"="${APP_RESOURCE}"\*inux\*64\* && \
      echo_success-exit_0
    ;;

    "logcli" | "loki" | "promtail")
      gget ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${TMP_DIR_ZIP}"="${APP_RESOURCE}"\*inux\*64\* && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-amd64 -d "${INSTALL_DIR:?}" && \
      mv "${INSTALL_DIR:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      rm_tmp_file-chmod_binary-echo_success-exit_0
    ;;

    "sslocal" | "ssmanager" | "ssserver" | "ssurl")
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*64\*inux\*gnu\* | \
      tar -xJf- -C "${INSTALL_DIR:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod_binary-echo_success-exit_0
    ;;

# ------------------------------------------------------------------ #

    "ffmpeg")
      case "$3" in
        "latest")
          APP_VERSION="$(curl -sSL https://ffmpeg.org/releases/ | grep "tar.gz\"" | sed 's|^.\{62\}||g;s|.tar.gz.*||g' | sort | sed '$!d')"
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
        APP_VERSION="$(curl -sSL https://golang.org/dl/ | grep "span class.*src.tar.gz" | sed 's|^.\{27\}||g;s|.src.*||g')"
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR}."
      fi
      rm -rf "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      curl -Lf https://dl.google.com/go/go"${APP_VERSION}".linux-amd64.tar.gz | \
      tar -xzf- -C "${INSTALL_DIR:?}" ${TAR_ARGS} && \
      echo_success-exit_0
    ;;

    "gobuster")
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* > "${TMP_DIR_7Z}" && \
      7z e -so "${TMP_DIR_7Z}" > "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_7Z}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "hey")
      curl -Lf -o "${INSTALL_DIR:?}"/"${APP_NAME}" https://storage.googleapis.com/hey-release/hey_linux_amd64 && \
      chmod_binary-echo_success-exit_0
    ;;

    "restic")
      gget --stdout ${EXCLUDE_GENERIC} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" \*inux\*64\* | \
      bzip2 -d > "${INSTALL_DIR:?}"/"${APP_NAME}" && \
      chmod_binary-echo_success-exit_0
    ;;

    "unftp")
      gget --executable ${EXCLUDE_GENERIC} ${EXCLUDE_ARCHIVES} "${!REPO}""${VERSION_PREFIX}""${APP_VERSION}" "${INSTALL_DIR:?}"/"${APP_NAME}"=\*64\*inux\*-musl && \
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

# ------------------------------------------------------------------ #
