#!/bin/bash

# ------------------------------------------------------------------ #

GINSTALL_SH_VERSION="2.3.0"

# ------------------------------------------------------------------ #

INSTALL_DIR_APP="/usr/local/bin"
INSTALL_DIR_GO="/usr/local"

GGET_DIR="$(command -v gget)"

TMP_DIR_GGET="/tmp/gget"
TMP_DIR_7Z="/tmp/ginstall.7z"
TMP_DIR_BZ2="/tmp/ginstall.bz2"
TMP_DIR_GZ="/tmp/ginstall.gz"
TMP_DIR_TAR_GZ="/tmp/ginstall.tar.gz"
TMP_DIR_TAR_XZ="/tmp/ginstall.tar.xz"
TMP_DIR_TGZ="/tmp/ginstall.tgz"
TMP_DIR_ZIP="/tmp/ginstall.zip"

TAR_ARGS="--no-same-owner --no-same-permissions"

VERSION_PREFIX_V="@v"
VERSION_PREFIX_NONE="@"

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
REPO_ANDESITE="github.com/nektro/andesite"
REPO_ANNIE="github.com/iawia002/annie"
REPO_APIZZA="github.com/harrybrwn/apizza"
REPO_ARC="github.com/mholt/archiver"
REPO_ARGOCD="github.com/argoproj/argo-cd"
REPO_AUTHELIA="github.com/authelia/authelia"
REPO_AUTOCERT="github.com/smallstep/autocert"

# B
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
REPO_DIUN="github.com/crazy-max/diun"
REPO_DIVE="github.com/wagoodman/dive"
REPO_DNSCONTROL="github.com/StackExchange/dnscontrol"
REPO_DNSCRYPT_PROXY="github.com/DNSCrypt/dnscrypt-proxy"
REPO_DOBI="github.com/dnephin/dobi"
REPO_DOCKER_COMPOSE="github.com/docker/compose"
REPO_DOCKER_CREDENTIAL_PASS="github.com/docker/docker-credential-helpers"
REPO_DOCKER_GEN="github.com/jwilder/docker-gen"
REPO_DOCKER_MACHINE="github.com/docker/machine"
REPO_DRONE="github.com/drone/drone-cli"
REPO_DUPLICACY="github.com/gilbertchen/duplicacy"

# E
REPO_EDGEDNS="github.com/jedisct1/edgedns"
REPO_ETCD="github.com/etcd-io/etcd"
REPO_ETHR="github.com/microsoft/ethr"
REPO_EUREKA="github.com/mimoo/eureka"
REPO_EXA="github.com/ogham/exa"

# F
REPO_FFMPEG="github.com/FFmpeg/FFmpeg"
REPO_FFSEND="github.com/timvisee/ffsend"
REPO_FILEBROWSER="github.com/filebrowser/filebrowser"
REPO_FIRECRACKER="github.com/firecracker-microvm/firecracker"
REPO_FLUX="github.com/fluxcd/flux"
REPO_FN="github.com/iron-io/functions"
REPO_FRPC="github.com/fatedier/frp"
REPO_FRPS="github.com/fatedier/frp"
REPO_FTPGRAB="github.com/ftpgrab/ftpgrab"
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
REPO_GO_AVIF="github.com/Kagami/go-avif"
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
REPO_HEY="github.com/rakyll/hey"
REPO_HTTPSTAT="github.com/davecheney/httpstat"
REPO_HUGO="github.com/gohugoio/hugo"

# I
REPO_IDENTITY="github.com/storj/storj"
REPO_IMDL="github.com/casey/intermodal"
REPO_INLETS="github.com/inlets/inlets"
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

# M
REPO_MAGNETICOD="github.com/boramalper/magnetico"
REPO_MAGNETICOW="github.com/boramalper/magnetico"
REPO_MATTERBRIDGE="github.com/42wim/matterbridge"
REPO_MDBOOK="github.com/rust-lang/mdBook"
REPO_MICRO="github.com/zyedidia/micro"
REPO_MINIFY="github.com/tdewolff/minify"
REPO_MKCERT="github.com/FiloSottile/mkcert"
REPO_MONITOROR="github.com/monitoror/monitoror"

# N
REPO_NAVIDROME="github.com/deluan/navidrome"
REPO_NEBULA="github.com/slackhq/nebula"
REPO_NILTALK="github.com/knadh/niltalk"
REPO_NNN="github.com/jarun/nnn"

# O
REPO_OAUTH2_PROXY="github.com/oauth2-proxy/oauth2-proxy"
REPO_ORAGONO="github.com/oragono/oragono"

# P
REPO_PARCELLO="github.com/phogolabs/parcello"
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
REPO_RATTLESNAKEOS_STACK="github.com/dan-v/rattlesnakeos-stack"
REPO_RCLONE="github.com/rclone/rclone"
REPO_RED="github.com/antonmedv/red"
REPO_REG="github.com/genuinetools/reg"
REPO_RESTIC="github.com/restic/restic"
REPO_RIO="github.com/rancher/rio"
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
REPO_STARSHIP="github.com/starship/starship"
REPO_STATPING="github.com/statping/statping"
REPO_STDISCOSRV="github.com/syncthing/discosrv"
REPO_STEGIFY="github.com/DimitarPetrov/stegify"
REPO_STEP="github.com/smallstep/cli"
REPO_STRELAYSRV="github.com/syncthing/relaysrv"
REPO_SUP="github.com/pressly/sup"
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
REPO_TXEH="github.com/txn2/txeh"

# U
REPO_UP="github.com/apex/up"
REPO_UPLINK="github.com/storj/storj"
REPO_UPX="github.com/upx/upx"

# V
REPO_VIGIL="github.com/valeriansaliou/vigil"
REPO_VSPHERE_INFLUXDB_GO="github.com/Oxalide/vsphere-influxdb-go"
REPO_VULS="github.com/future-architect/vuls"

# W
REPO_WATCHTOWER="github.com/containrrr/watchtower"
REPO_WUZZ="github.com/asciimoo/wuzz"

# Y
REPO_YOUTUBE_DL="github.com/ytdl-org/youtube-dl"
REPO_YQ="github.com/mikefarah/yq"

# Z
REPO_ZOLA="github.com/getzola/zola"

# ------------------------------------------------------------------ #

SUPPORTED_APPS_HEADER="Application:                Repository:
------------                -----------"

SUPPORTED_APPS_LIST="
A
acme-dns                    $REPO_ACME_DNS
adguardhome                 $REPO_ADGUARDHOME
age                         $REPO_AGE
andesite                    $REPO_ANDESITE
annie                       $REPO_ANNIE
apizza                      $REPO_APIZZA
arc                         $REPO_ARC
argocd                      $REPO_ARGOCD
authelia                    $REPO_AUTHELIA
autocert                    $REPO_AUTOCERT

B
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
ddns                        $REPO_DDNS_ROUTE53
delta                       $REPO_DELTA
discord-console             $REPO_DISCORD_CONSOLE
discord-delete              $REPO_DISCORD_DELETE
diun                        $REPO_DIUN
dive                        $REPO_DIVE
dnscontrol                  $REPO_DNSCONTROL
dnscrypt-proxy              $REPO_DNSCRYPT_PROXY
dobi                        $REPO_DOBI
docker-compose              $REPO_DOCKER_COMPOSE
docker-credential-pass      $REPO_DOCKER_CREDENTIAL_PASS
docker-gen                  $REPO_DOCKER_GEN
docker-machine              $REPO_DOCKER_MACHINE
drone                       $REPO_DRONE
duplicacy                   $REPO_DUPLICACY

E
edgedns                     $REPO_EDGEDNS
etcd                        $REPO_ETCD
ethr                        $REPO_ETHR
eureka                      $REPO_EUREKA
exa                         $REPO_EXA

F
ffmpeg                      $REPO_FFMPEG
ffsend                      $REPO_FFSEND
filebrowser                 $REPO_FILEBROWSER
firecracker                 $REPO_FIRECRACKER
flux                        $REPO_FLUX
fn                          $REPO_FN
frpc                        $REPO_FRPC
frps                        $REPO_FRPS
ftpgrab                     $REPO_FTPGRAB
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
go-avif                     $REPO_GO_AVIF
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
gpldr-clint                 $REPO_GPLDR_CLIENT
gpldr-server                $REPO_GPLDR_SERVER

H
hey                         $REPO_HEY
httpstat                    $REPO_HTTPSTAT
hugo                        $REPO_HUGO

I
identity                    $REPO_IDENTITY
imdl                        $REPO_IMDL
inlets                      $REPO_INLETS
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

M
magneticod                  $REPO_MAGNETICOD
magneticow                  $REPO_MAGNETICOW
matterbridge                $REPO_MATTERBRIDGE
mdbook                      $REPO_MDBOOK
micro                       $REPO_MICRO
minify                      $REPO_MINIFY
mkcert                      $REPO_MKCERT
monitoror                   $REPO_MONITOROR

N
navidrome                   $REPO_NAVIDROME
nebula                      $REPO_NEBULA
niltalk                     $REPO_NILTALK
nnn                         $REPO_NNN

O
oauth2-proxy                $REPO_OAUTH2_PROXY
oragono                     $REPO_ORAGONO

P
parcello                    $REPO_PARCELLO
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
rattlesnakeos-stack         $REPO_RATTLESNAKEOS_STACK
rclone                      $REPO_RCLONE
red                         $REPO_RED
reg                         $REPO_REG
restic                      $REPO_RESTIC
rio                         $REPO_RIO
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
starship                    $REPO_STARSHIP
statping                    $REPO_STATPING
stdiscosrv                  $REPO_STDISCOSRV
stegify                     $REPO_STEGIFY
step                        $REPO_STEP
strelaysrv                  $REPO_STRELAYSRV
sup                         $REPO_SUP
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
txeh                        $REPO_TXEH

U
up                          $REPO_UP
uplink                      $REPO_UPLINK
upx                         $REPO_UPX

V
vigil                       $REPO_VIGIL
vsphere-influxdb-go         $REPO_VSPHERE_INFLUXDB_GO
vuls                        $REPO_VULS

W
watchtower                  $REPO_WATCHTOWER
wuzz                        $REPO_WUZZ

Y
youtube-dl                  $REPO_YOUTUBE_DL
yq                          $REPO_YQ

Z
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
    if [ -z "${GGET_DIR}" ]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}"
      exit 1
    else
      case "$2" in
        "age")
          echo -e "The latest version of $2 is v1.0.0-beta2."
          exit 0
        ;;

        "ffmpeg")
          RESULT_CHECK="$(curl -sSL https://ffmpeg.org/releases/ | grep "tar.gz\"" | sed 's|^.\{62\}||g;s|.tar.gz.*||g' | sort | sed '$!d')"
          echo -e "The latest version of $2 is v${RESULT_CHECK}."
          exit 0
        ;;

        "go")
          RESULT_CHECK="$(curl -sSL https://golang.org/dl/ | grep "span class.*src.tar.gz" | sed 's|^.\{27\}||g;s|.src.*||g')"
          echo -e "The latest version of $2 is v${RESULT_CHECK}."
          exit 0
        ;;

        "go-auto-yt")
          echo -e "The latest version of $2 is v0.5.1."
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

        "rage")
          echo -e "The latest version of $2 is v0.4.0."
          exit 0
        ;;

        *)
          REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')"
          RESULT_CHECK="$(gget --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
          if [ -z "${RESULT_CHECK}" ]; then
            echo -e "${UNSUPPORTED_APP}\n${USAGE_INFORMATION}"
            exit 1
          else
            echo -e "The latest version of $2 is v${RESULT_CHECK}."
            exit 0
          fi
        ;;
      esac
    fi
  ;;

  "--directory" | "-d")
    INSTALL_DIR_APP="$2"
    INSTALL_DIR_GO="$2"
    DIR_FLAG="true"

    case "$3" in
      "--check" | "-c" | "--help" | "-h" | "--list" | "-l" | "--remove" | "-r" | "--search" | "-s" | "--self-update" | "--version" | "-version")
        echo -e "The $1 flag can only be used as a prefix for the --first-run flag or the app argument.\n${USAGE_INFORMATION}"
        exit 1
      ;;

      "--first-run")
        curl -Lf -o "${INSTALL_DIR_APP:?}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
        chmod +x "${INSTALL_DIR_APP:?}"/gget && \
        echo -e "\nThe dependency gget has been successfully installed and ginstall.sh is now ready for use."
        exit 0
      ;;

      *)
        shift 2
      ;;
  esac
  ;;

  "--first-run")
    if [ ! "$(id -u)" == "0" ]; then
      echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}"
      exit 1
    else
      curl -Lf -o "${INSTALL_DIR_APP:?}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
      chmod +x "${INSTALL_DIR_APP:?}"/gget && \
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
        "age" | "rage")
          APP_DIR="$(command -v $2)"
          rm -v "${APP_DIR:?}" "${APP_DIR:?}"-keygen && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "etcd")
          APP_DIR="$(command -v $2)"
          rm -v "${APP_DIR:?}" "${APP_DIR:?}"ctl && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "gget")
          echo -e "Are you sure that you want to uninstall ginstall.sh's dependency gget?\n" && \
          echo -e "Please type the number next to your desired answer." && \
          select yn in "yes" "no"; do
          case $yn in
            "yes")
                echo -e "" && \
                rm -v "${GGET_DIR:?}" && \
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
          APP_DIR="$(command -v $2 | sed 's|/bin/go||g')"
          rm -vr "${APP_DIR:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "komga")
          APP_DIR="$(command -v $2.jar)"
          rm -v "${APP_DIR:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "nebula")
          APP_DIR="$(command -v $2)"
          rm -v "${APP_DIR:?}" "${APP_DIR:?}"-cert && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "rootlesskit")
          APP_DIR="$(command -v $2)"
          APP_DIR_CTL="$(command -v rootlessctl)"
          rm -v "${APP_DIR:?}" "${APP_DIR_CTL:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "tldr++")
          APP_DIR="$(command -v tldr)"
          rm -v "${APP_DIR:?}" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        *)
          APP_DIR="$(command -v $2)"
          rm -v "${APP_DIR:?}" && \
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
    if [ -z "${GGET_DIR}" ]; then
      echo -e "${MISSING_DEPENDENCY}\n${USAGE_INFORMATION}"
      exit 1
    else
      APP_VERSION="$(gget --show-ref "${REPO_GINSTALL_SH}" | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
      gget --stdout "${REPO_GINSTALL_SH}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ginstall.sh' > "$0" && \
      chmod +x "$0" && \
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

if [ -z "${GGET_DIR}" ]; then
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
APP_VERSION="$3"

REPO="$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')"

INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR_APP}."

# ------------------------------------------------------------------ #

if [ "$3" == "latest" ]; then
  if [ "$(id -u)" == "0" ] || [ "${DIR_FLAG}" == "true" ]; then
    case "$2" in
      "ffmpeg" | "go")
      ;;

      "age")
        APP_VERSION="1.0.0-beta2"
        INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR_APP}."
      ;;

      "go-auto-yt")
        APP_VERSION="0.5.1"
        INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR_APP}."
      ;;

      "intercert")
        APP_VERSION="0.0.2"
        INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR_APP}."
      ;;

      "louketo-proxy")
        APP_VERSION="1.0.0-alpha.1"
        INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR_APP}."
      ;;

      "rage")
        APP_VERSION="0.4.0"
        INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was successfully installed to ${INSTALL_DIR_APP}."
      ;;

      *)
        APP_VERSION="$(gget --show-ref "${!REPO}" 2>/dev/null | sed '2d;s|tag[[:blank:]]||g;s|v||g')"
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR_APP}."
      ;;
    esac
  else
    echo -e "${PERMISSION_DENIED}\n${USAGE_INFORMATION}"
    exit 1
  fi
fi

# ------------------------------------------------------------------ #

if [ "$(id -u)" == "0" ] || [ "${DIR_FLAG}" == "true" ]; then
  case "$2" in
    "acme-dns")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'acme-dns_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "adguardhome")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'AdGuardHome_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" AdGuardHome/AdGuardHome ${TAR_ARGS} --strip-components=1 && \
      mv "${INSTALL_DIR_APP:?}"/AdGuardHome "${INSTALL_DIR_APP:?}"/adguardhome && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "age")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'age-v*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-keygen && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "andesite")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'andesite-v*-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "annie")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'annie_*_Linux_64-bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "apizza")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'apizza-linux' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "arc")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'arc_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "argocd")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'argocd-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "authelia")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'authelia-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}"-linux-amd64 ${TAR_ARGS} && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}/${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "autocert")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'autocert_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" autocert_"${APP_VERSION}"/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "bed")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'bed_v0.2.0_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" bed_v"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "bin")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'bin-v*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "blocky")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'blocky_v*_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "bombardier")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'bombardier-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "brig")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'brig_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}"_linux_amd64 ${TAR_ARGS} && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"_linux_amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}"
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "bw")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'bw-linux-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "caddy")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'caddy_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "caire")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'caire-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" caire-"${APP_VERSION}"-linux-amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "captainhook")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'captainhook_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ccat")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linux-amd64-*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" linux-amd64-"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "chroma")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'chroma-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "cloud-torrent")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'cloud-torrent_linux_amd64.gz' > "${TMP_DIR_GZ}" && \
      gzip -c -d "${TMP_DIR_GZ}" > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "cobalt")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'cobalt-v*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "comics-downloader")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'comics-downloader' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "composer")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'composer.phar' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "coredns")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'coredns_*_linux_amd64.tgz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "croc")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'croc_*_Linux-64bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ctop")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ctop-*-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ddgr")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ddgr-*-x86_64.pkg.tar.xz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${INSTALL_DIR_APP:?}" usr/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ddns-route53")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ddns-route53_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "delta")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'delta-*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" delta-"${APP_VERSION}"-x86_64-unknown-linux-gnu/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "diun")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'diun_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "discord-console")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'DC-*-Linux.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" DC-"${APP_VERSION}"-Linux/64-bit/DiscordConsole -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/DiscordConsole "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "discord-delete")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'discord-delete-linux' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "dive")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'dive_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "dnscontrol")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'dnscontrol-Linux' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "dnscrypt-proxy")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'dnscrypt-proxy-linux_x86_64-*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" linux-x86_64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "dobi")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'dobi-linux' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "docker-compose")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'docker-compose-Linux-x86_64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "docker-credential-pass")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'docker-credential-pass-v*-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "docker-gen")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'docker-gen-linux-amd64-*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "docker-machine")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'docker-machine-Linux-x86_64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "drone")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'drone_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "duplicacy")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'duplicacy_linux_x64_*' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "edgedns")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'edgedns-*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "etcd")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'etcd-v*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" etcd-v"${APP_VERSION}"-linux-amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" etcd-v"${APP_VERSION}"-linux-amd64/"${APP_NAME}"ctl ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}"ctl && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ethr")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ethr_linux.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "eureka")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'eureka_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "exa")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'exa-linux-x86_64-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-x86_64 -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-linux-x86_64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ffmpeg")
      if [ "$3" == "latest" ]; then
        APP_VERSION="$(curl -sSL https://ffmpeg.org/releases/ | grep "tar.gz\"" | sed 's|^.\{62\}||g;s|.tar.gz.*||g' | sort | sed '$!d')"
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR_APP}."
        FFMPEG_URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
      elif [ "$3" == "4.2.3" ]; then
        FFMPEG_URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
      else
        FFMPEG_URL="https://www.johnvansickle.com/ffmpeg/old-releases/ffmpeg-${APP_VERSION}-amd64-static.tar.xz"
      fi
      curl -Lf -o "${TMP_DIR_TAR_XZ}" "${FFMPEG_URL}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${INSTALL_DIR_APP:?}" ffmpeg-"${APP_VERSION}"-amd64-static/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ffsend")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ffsend-v*-linux-x64-static' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "filebrowser")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linux-amd64-filebrowser.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "firecracker")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'firecracker-v*-x86_64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "flux")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'fluxctl_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "fn")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'fn_linux' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "frpc")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'frp_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" frp_"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "frps")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'frp_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" frp_"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ftpgrab")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'ftpgrab_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "fx")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'fx_*_Tux_64-bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "fzf")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'fzf-*-linux_amd64.tgz' > "${TMP_DIR_TGZ}" && \
      tar -xf "${TMP_DIR_TGZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TGZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gdrive")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'gdrive-linux-x64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "geoip-updater")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'geoip-updater_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gget")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gget-*-linux-amd64' > "${TMP_DIR_GGET}" && \
      mv "${TMP_DIR_GGET}" "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gh")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gh_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" gh_"${APP_VERSION}"_linux_amd64/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ginstall.sh")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ginstall.sh' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "git-hooks")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'git-hooks_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" build/"${APP_NAME}"_linux_amd64 ${TAR_ARGS} --strip-components=1 && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"_linux_amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "git-rewrite-author")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'git-rewrite-author_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gitbatch")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gitbatch_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gitea")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gitea-*-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "go")
      if [ "$3" == "latest" ]; then
        APP_VERSION="$(curl -sSL https://golang.org/dl/ | grep "span class.*src.tar.gz" | sed 's|^.\{27\}||g;s|.src.*||g')"
        INSTALL_SUCCESS="The latest version of $2 (v$APP_VERSION) was successfully installed to ${INSTALL_DIR_GO}."
      fi
      curl -Lf -o "${TMP_DIR_TAR_GZ}" https://dl.google.com/go/go"${APP_VERSION}".linux-amd64.tar.gz && \
      rm -rf "${INSTALL_DIR_GO:?}"/"${APP_NAME}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_GO:?}" ${TAR_ARGS} && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "goatcounter")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'goatcounter-v*-linux-amd64.gz' > "${TMP_DIR_GZ}" && \
      gzip -c -d "${TMP_DIR_GZ}" > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "go-auto-yt")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'go-auto-yt_*-linux.amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "go-avif")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'avif-linux-x64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gobuster")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gobuster-linux-amd64.7z' > "${TMP_DIR_7Z}" && \
      7z e -so "${TMP_DIR_7Z}" > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_7Z}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gogs")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" gogs/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "golangci-lint")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'golangci-lint-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" golangci-lint-"${APP_VERSION}"-linux-amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gomplate")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gomplate_linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gomuks")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gomuks-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "googler")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'googler-*-x86_64.pkg.tar.xz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${INSTALL_DIR_APP:?}" usr/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gopass")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gopass-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "goreleaser")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'goreleaser_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gossa")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gossa-linux64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gosu")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'gosu-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gotty")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'gotty_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ./"${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "govc")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'govc_linux_amd64.gz' > "${TMP_DIR_GZ}" && \
      gzip -c -d "${TMP_DIR_GZ}" > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gpldr-client")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'client_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "gpldr-server")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'server-standalone_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" goploader-server/server-standalone ${TAR_ARGS} --strip-components=1 && \
      mv "${INSTALL_DIR_APP:?}"/server-standalone "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "hey")
      curl -Lf -o "${INSTALL_DIR_APP:?}"/"${APP_NAME}" https://storage.googleapis.com/hey-release/hey_linux_amd64 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}"  && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "httpstat")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'httpstat-linux-amd64-v*' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "hugo")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'hugo_extended_*_Linux-64bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "identity")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'identity_linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "imdl")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'imdl-v*-x86_64-unknown-linux-musl.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "inlets")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'inlets' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "intercert")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'intercert_0.0.2_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ipfs")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'go-ipfs_v*_linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" go-ipfs/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "jailer")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'jailer-v*-x86_64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "jellycli")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'Jellycli_*_Linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" Jellycli ${TAR_ARGS} && \
      mv "${INSTALL_DIR_APP:?}"/Jellycli "${INSTALL_DIR_APP:?}"/"${APP_NAME}"
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "json2csv")
      JSON2CSV_PATH="$(gget --show-resources ${!REPO}${VERSION_PREFIX_V}${APP_VERSION} 'json2csv-*.linux-amd64.go*.tar.gz' | sed 's|.tar.gz||g')"
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'json2csv-*.linux-amd64.go*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${JSON2CSV_PATH:?}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "json5")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'json5_*_linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "jsteg")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'jsteg-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "k3s")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'k3s' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "k9s")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'k9s_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "komga")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'komga-*.jar' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}".jar && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}".jar && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "kompose")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'kompose-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}"-linux-amd64 ${TAR_ARGS} && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}/${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "lazydocker")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'lazydocker_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "lego")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'lego_v*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "linuxkit")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linuxkit-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "linx-cleanup")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linx-cleanup-v*_linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "linx-genkey")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linx-genkey-v*_linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "linx-server")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linx-server-v*_linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "logcli")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'logcli-linux-amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-amd64 -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "loki")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'loki-linux-amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-amd64 -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "louketo-proxy")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'louketo-proxy_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}"_"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "magneticod")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'magneticod' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "magneticow")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'magneticow' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "matterbridge")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'matterbridge-*-linux-64bit' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "mdbook")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'mdbook-v*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "micro")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'micro-*-linux64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" micro-"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "minify")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'minify_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "mkcert")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'mkcert-v*-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "monitoror")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'monitoror-linux-amd64-*' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "navidrome")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'navidrome_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "nebula")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'nebula-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-cert && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "niltalk")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'niltalk_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "nnn")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'nnn-static-*.x86-64.tar.gz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}"-static ${TAR_ARGS} && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-static "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "oauth2-proxy")
      OAUTH2_PROXY_PATH="$(gget --show-resources ${!REPO}${VERSION_PREFIX_V}${APP_VERSION} 'oauth2_proxy-v*.linux-amd64.go*.tar.gz' | sed 's|.tar.gz||g')"
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'oauth2_proxy-v*.linux-amd64.go*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${OAUTH2_PROXY_PATH:?}"/oauth2_proxy ${TAR_ARGS} --strip-components=1 && \
      mv "${INSTALL_DIR_APP:?}"/oauth2_proxy "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "oragono")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'oragono-*-linux-x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" oragono-"${APP_VERSION}"-linux-x86_64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "parcello")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'parcello_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "peach")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pebble")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pebble_linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pebble-challtestsrv")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pebble-challtestsrv_linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pgweb")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pgweb_linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"_linux_amd64 -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"_linux_amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pkger")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pkger_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "plexdrive")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'plexdrive-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "plik")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'plik-*-linux-64bits.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" plik-"${APP_VERSION}"/clients/linux-amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=3 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "plikd")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'plik-*-linux-64bits.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" plik-"${APP_VERSION}"/server/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "podman-remote")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'podman-remote-static.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pomerium")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pomerium-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pomerium-cli")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pomerium-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "portainer")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'portainer-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" portainer/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "promtail")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'promtail-linux-amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-amd64 -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-linux-amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "qrcp")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'qrcp_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "rage")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'rage-v*-x86_64-linux.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}"-keygen && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "rattlesnakeos-stack")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'rattlesnakeos-stack-linux-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "rclone")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'rclone-v*-linux-amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" rclone-v"${APP_VERSION}"-linux-amd64/rclone -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "red")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'red_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "reg")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'reg-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "restic")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'restic_*_linux_amd64.bz2' > "${TMP_DIR_BZ2}" && \
      bzip2 -d "${TMP_DIR_BZ2}" -c > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_BZ2}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "rio")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'rio-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "rootlesskit")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'rootlesskit-x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/rootlessctl && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "s")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 's-linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux_amd64/"${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "s2c")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 's2-cmds_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "s2d")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 's2-cmds_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "sdns")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'sdns_linux_amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}"_linux_amd64 ${TAR_ARGS} && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"_linux_amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "shellcheck")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'shellcheck-v*.linux.x86_64.tar.xz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${INSTALL_DIR_APP:?}" shellcheck-v"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "simple-vpn")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'simple-vpn-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "slack-term")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'slack-term-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "slink")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'slink-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "ssh-auditor")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'ssh-auditor_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ssh-auditor_"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "starship")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'starship-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "statping")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'statping-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "stdiscosrv")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'stdiscosrv-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" stdiscosrv-linux-amd64-v"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "stegify")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'stegify_linux_x86-64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "step")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'step_linux_*_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" step_"${APP_VERSION}"/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "strelaysrv")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'strelaysrv-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" strelaysrv-linux-amd64-v"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "sup")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'sup-linux64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "swarm-cronjob")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'swarm-cronjob_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "syncthing")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'syncthing-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" syncthing-linux-amd64-v"${APP_VERSION}"/syncthing ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "tableview")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'tableview_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "task")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'task_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "tengo")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'tengo_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "tldr++")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'tldr_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" tldr ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/tldr && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "traefik")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'traefik_v*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "transfersh")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'transfersh-v*-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "travis-wait-enhanced")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'travis-wait-enhanced_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "txeh")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'txeh_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "up")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'up_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "uplink")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'uplink_linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -qjo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "upx")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'upx-*-amd64_linux.tar.xz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${INSTALL_DIR_APP:?}" upx-"${APP_VERSION}"-amd64_linux/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "vigil")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'v*-x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ./vigil/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "vsphere-influxdb-go")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'vsphere-influxdb-go_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "vuls")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'vuls_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "watchtower")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'watchtower_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "wuzz")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'wuzz_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "youtube-dl")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'youtube-dl' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "yq")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'yq_linux_amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "zola")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'zola-v*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
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
