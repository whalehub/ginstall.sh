#!/bin/bash

# ------------------------------------------------------------------ #

GINSTALL_SH_VERSION="1.8.0"

# ------------------------------------------------------------------ #

APP_DIR="/usr/local/bin"
GO_DIR="/usr/local"

TMP_DIR_GGET="/tmp/gget"
TMP_DIR_BZ2="/tmp/ginstall.bz2"
TMP_DIR_GZ="/tmp/ginstall.gz"
TMP_DIR_TAR_GZ="/tmp/ginstall.tar.gz"
TMP_DIR_TAR_XZ="/tmp/ginstall.tar.xz"
TMP_DIR_TGZ="/tmp/ginstall.tgz"
TMP_DIR_ZIP="/tmp/ginstall.zip"

TAR_ARGS="--no-same-owner --no-same-permissions"

PREFIX_V="@v"
PREFIX_NONE="@"

UNINSTALL_SUCCESS="$2 was uninstalled successfully."

UNSUPPORTED="This application is not supported by ginstall.sh. Please run \"ginstall.sh --help\" for usage information."
NO_PERMISSION="Error: This script is not running as root or with sudo! Exiting..."

# ------------------------------------------------------------------ #

# A
REPO_ANNIE="github.com/iawia002/annie"

# B
REPO_BIN="github.com/w4/bin"
REPO_BLOCKY="github.com/0xERR0R/blocky"
REPO_BW="github.com/bitwarden/cli"

# C
REPO_CADDY="github.com/caddyserver/caddy"
REPO_CAIRE="github.com/esimov/caire"
REPO_COMPOSER="github.com/composer/composer"
REPO_COREDNS="github.com/coredns/coredns"
REPO_CROC="github.com/schollz/croc"
REPO_CTOP="github.com/bcicen/ctop"

# D
REPO_DELTA="github.com/dandavison/delta"
REPO_DIVE="github.com/wagoodman/dive"
REPO_DNSCRYPT_PROXY="github.com/DNSCrypt/dnscrypt-proxy"
REPO_DOCKER_COMPOSE="github.com/docker/compose"
REPO_DOCKER_CREDENTIAL_PASS="github.com/docker/docker-credential-helpers"

# E
REPO_EXA="github.com/ogham/exa"

# F
REPO_FFMPEG="github.com/FFmpeg/FFmpeg"
REPO_FFSEND="github.com/timvisee/ffsend"
REPO_FILEBROWSER="github.com/filebrowser/filebrowser"
REPO_FRPC="github.com/fatedier/frp"
REPO_FRPS="github.com/fatedier/frp"
REPO_FZF="github.com/junegunn/fzf-bin"
REPO_FZF_SOURCE="github.com/junegunn/fzf"

# G
REPO_GDRIVE="github.com/gdrive-org/gdrive"
REPO_GGET="github.com/dpb587/gget"
REPO_GH="github.com/cli/cli"
REPO_GINSTALL_SH="github.com/whalehub/ginstall.sh"
REPO_GITEA="github.com/go-gitea/gitea"
REPO_GO="github.com/golang/go"
REPO_GOGS="github.com/gogs/gogs"
REPO_GORELEASER="github.com/goreleaser/goreleaser"
REPO_GOSU="github.com/tianon/gosu"
REPO_GOTTY="github.com/yudai/gotty"

# H
REPO_HEY="github.com/rakyll/hey"
REPO_HTTPSTAT="github.com/davecheney/httpstat"
REPO_HUGO="github.com/gohugoio/hugo"

# I
REPO_IMDL="github.com/casey/intermodal"
REPO_INLETS="github.com/inlets/inlets"

# K
REPO_K3S="github.com/rancher/k3s"
REPO_K9S="github.com/derailed/k9s"
REPO_KOMGA="github.com/gotson/komga"
REPO_KOMPOSE="github.com/kubernetes/kompose"

# L
REPO_LAZYDOCKER="github.com/jesseduffield/lazydocker"
REPO_LEGO="github.com/go-acme/lego"

# M
REPO_MICRO="github.com/zyedidia/micro"
REPO_MKCERT="github.com/FiloSottile/mkcert"

# N
REPO_NEBULA="github.com/slackhq/nebula"

# P
REPO_PGWEB="github.com/sosedoff/pgweb"
REPO_PODMAN_REMOTE="github.com/containers/libpod"
REPO_PORTAINER="github.com/portainer/portainer"

# Q
REPO_QRCP="github.com/claudiodangelis/qrcp"

# R
REPO_RCLONE="github.com/rclone/rclone"
REPO_RESTIC="github.com/restic/restic"

# S
REPO_SHELLCHECK="github.com/koalaman/shellcheck"
REPO_SLACK_TERM="github.com/erroneousboat/slack-term"
REPO_STATPING="github.com/statping/statping"
REPO_STDISCOSRV="github.com/syncthing/discosrv"
REPO_STEP="github.com/smallstep/cli"
REPO_STRELAYSRV="github.com/syncthing/relaysrv"
REPO_SYNCTHING="github.com/syncthing/syncthing"

# T
REPO_TLDR_PLUS_PLUS="github.com/isacikgoz/tldr"
REPO_TRAEFIK="github.com/containous/traefik"
REPO_TRANSFERSH="github.com/dutchcoders/transfer.sh"

# U
REPO_UPX="github.com/upx/upx"

# V
REPO_VIGIL="github.com/valeriansaliou/vigil"

# W
REPO_WATCHTOWER="github.com/containrrr/watchtower"
REPO_WUZZ="github.com/asciimoo/wuzz"

# Y
REPO_YOUTUBE_DL="github.com/ytdl-org/youtube-dl"

# ------------------------------------------------------------------ #

SUPPORTED_APPS_HEADER="Application:                Repository:
------------                -----------"

SUPPORTED_APPS_LIST="
A
annie                       $REPO_ANNIE

B
bin                         $REPO_BIN
blocky                      $REPO_BLOCKY
bw                          $REPO_BW

C
caddy                       $REPO_CADDY
caire                       $REPO_CAIRE
composer                    $REPO_COMPOSER
coredns                     $REPO_COREDNS
croc                        $REPO_CROC
ctop                        $REPO_CTOP

D
delta                       $REPO_DELTA
dive                        $REPO_DIVE
dnscrypt-proxy              $REPO_DNSCRYPT_PROXY
docker-compose              $REPO_DOCKER_COMPOSE
docker-credential-pass      $REPO_DOCKER_CREDENTIAL_PASS

E
exa                         $REPO_EXA

F
ffmpeg                      $REPO_FFMPEG
ffsend                      $REPO_FFSEND
filebrowser                 $REPO_FILEBROWSER
frpc                        $REPO_FRPC
frps                        $REPO_FRPS
fzf                         $REPO_FZF_SOURCE

G
gdrive                      $REPO_GDRIVE
gget                        $REPO_GGET
gh                          $REPO_GH
ginstall.sh                 $REPO_GINSTALL_SH
gitea                       $REPO_GITEA
go                          $REPO_GO
gogs                        $REPO_GOGS
goreleaser                  $REPO_GORELEASER
gosu                        $REPO_GOSU
gotty                       $REPO_GOTTY

H
hey                         $REPO_HEY
httpstat                    $REPO_HTTPSTAT
hugo                        $REPO_HUGO

I
imdl                        $REPO_IMDL
inlets                      $REPO_INLETS

K
k3s                         $REPO_K3S
k9s                         $REPO_K9S
komga                       $REPO_KOMGA
kompose                     $REPO_KOMPOSE

L
lazydocker                  $REPO_LAZYDOCKER
lego                        $REPO_LEGO

M
micro                       $REPO_MICRO
mkcert                      $REPO_MKCERT

N
nebula                      $REPO_NEBULA

P
pgweb                       $REPO_PGWEB
podman-remote               $REPO_PODMAN_REMOTE
portainer                   $REPO_PORTAINER

Q
qrcp                        $REPO_QRCP

R
rclone                      $REPO_RCLONE
restic                      $REPO_RESTIC

S
shellcheck                  $REPO_SHELLCHECK
slack-term                  $REPO_SLACK_TERM
statping                    $REPO_STATPING
stdiscosrv                  $REPO_STDISCOSRV
step                        $REPO_STEP
strelaysrv                  $REPO_STRELAYSRV
syncthing                   $REPO_SYNCTHING

T
tldr++                      $REPO_TLDR_PLUS_PLUS
traefik                     $REPO_TRAEFIK
transfersh                  $REPO_TRANSFERSH

U
upx                         $REPO_UPX

V
vigil                       $REPO_VIGIL

W
watchtower                  $REPO_WATCHTOWER
wuzz                        $REPO_WUZZ

Y
youtube-dl                  $REPO_YOUTUBE_DL"

# ------------------------------------------------------------------ #

HELP="Usage:
  ginstall.sh [flags] <app> <version>

Examples:
  ginstall.sh docker-compose 1.25.5
  ginstall.sh docker-compose latest
  ginstall.sh --check docker-compose
  ginstall.sh --directory /home/whalehub/apps docker-compose 1.25.5
  ginstall.sh --directory /home/whalehub/apps docker-compose latest
  ginstall.sh --first-run
  ginstall.sh --first-run-dir /home/whalehub/apps
  ginstall.sh --help
  ginstall.sh --list
  ginstall.sh --remove docker-compose
  ginstall.sh --rm-from-dir /home/whalehub/apps docker-compose
  ginstall.sh --search docker
  ginstall.sh --self-update
  ginstall.sh --version

Flags:
  --check, -c           Prints the latest available version of an application
  --directory, -d       Specifies a custom installation directory
  --first-run           Installs ginstall.sh's dependency gget via curl
  --first-run-dir       Installs ginstall.sh's dependency gget via curl into the specified directory
  --help, -h            Shows this page
  --list, -l            Prints a list of supported applications
  --remove, -r          Uninstalls an application
  --rm-from-dir         Uninstalls an application from the specified directory
  --search, -s          Performs a search on the list of supported applications
  --self-update         Updates ginstall.sh to the latest available version
  --version, -v         Prints ginstall.sh version information"

# ------------------------------------------------------------------ #

ARGS=$(getopt -l check:,directory:,first-run,first-run-dir:,help,list,remove:,rm-from-dir:,search:,self-update,version -o c:d:hlr:s:v -n ginstall.sh -- "$@") 

# ------------------------------------------------------------------ #

if [ $? -ne 0 ]; then
  exit 1
fi

# ------------------------------------------------------------------ #

eval set -- "$ARGS"
unset ARGS

# ------------------------------------------------------------------ #

case "$1" in
  "--check" | "-c")
    case "$2" in
      "ffmpeg" | "go" | "hey")
        echo -e "The $1 flag currently does not support $2."
        exit 1
      ;;

      *)
        REPO=$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')
        RESULT=$(gget --show-ref "${!REPO}" 2>/dev/null)
        if [ -z "$RESULT" ]; then
          echo -e "$UNSUPPORTED"
          exit 1
        else
          echo -e "The latest version of $2 is\n$RESULT"
          exit 0
        fi
      ;;
    esac
  ;;

  "--directory" | "-d")
    APP_DIR="$2"
    GO_DIR="$2"
    DIR_ARG="true"
    shift 2
  ;;

 "--first-run")
    curl -Lf -o "${APP_DIR}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
    chmod +x "${APP_DIR}"/gget && \
    echo -e "\nThe dependencies for ginstall.sh have been successfully installed and it is now ready for use."
    exit 0
  ;;

 "--first-run-dir")
    APP_DIR="$2"
    curl -Lf -o "${APP_DIR}"/gget https://"${REPO_GGET}"/releases/download/v0.3.0/gget-0.3.0-linux-amd64 && \
    chmod +x "${APP_DIR}"/gget && \
    echo -e "\nThe dependencies for ginstall.sh have been successfully installed and it is now ready for use."
    exit 0
  ;;

  "--help" | "-h")
    echo -e "$HELP"
    exit 0
  ;;

  "--list" | "-l")
    echo -e "$SUPPORTED_APPS_HEADER""$SUPPORTED_APPS_LIST"
    exit 0
  ;;

  "--remove" | "-r")
    if [ "$(id -u)" -ne 0 ]; then
      echo -e "$NO_PERMISSION"
      exit 1
    else
      case "$2" in
        "gget")
          echo -e "Are you sure that you want to uninstall ginstall.sh's dependency gget?" && \
          echo -e "\nPlease type the number next to your desired answer." && \
          select yn in "yes" "no"; do
          case $yn in
            "yes")
              rm -v "${APP_DIR}"/"$2" && \
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
          rm -vr "${GO_DIR:?}"/"$2" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "nebula")
          rm -v "${APP_DIR}"/"$2" "${APP_DIR}"/"$2"-cert && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        "tldr++")
          rm -v "${APP_DIR}"/tldr && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;

        *)
          rm -v "${APP_DIR}"/"$2" && \
          echo -e "${UNINSTALL_SUCCESS}"
          exit 0
        ;;
      esac
    fi
  ;;

  "--rm-from-dir")
    APP_DIR="$2"
    GO_DIR="$2"
    shift 2
    UNINSTALL_SUCCESS="$2 was uninstalled successfully."
    case "$2" in
      "gget")
        echo -e "Are you sure that you want to uninstall ginstall.sh's dependency gget?" && \
        echo -e "\nPlease type the number next to your desired answer." && \
        select yn in "yes" "no"; do
          case $yn in
            "yes")
              rm -v "${APP_DIR}"/"$2" && \
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
        rm -vr "${GO_DIR:?}"/"$2" && \
        echo -e "${UNINSTALL_SUCCESS}"
        exit 0
      ;;

      "nebula")
        rm -v "${APP_DIR}"/"$2" "${APP_DIR}"/"$2"-cert && \
        echo -e "${UNINSTALL_SUCCESS}"
        exit 0
      ;;

      "tldr++")
        rm -v "${APP_DIR}"/tldr && \
        echo -e "${UNINSTALL_SUCCESS}"
        exit 0
      ;;

      *)
        rm -v "${APP_DIR}"/"$2" && \
        echo -e "${UNINSTALL_SUCCESS}"
        exit 0
      ;;
      esac
  ;;

  "--search" | "-s")
    echo -e "$SUPPORTED_APPS_HEADER""\n""$(echo -e "$SUPPORTED_APPS_LIST" | grep "$2")"
    exit 0
  ;;

  "--self-update")
    gget --stdout "${REPO_GINSTALL_SH}" 'ginstall.sh' > "$0" && \
    chmod +x "$0"
    exit 0
  ;;

  "--version" | "-v")
    echo -e "ginstall version $GINSTALL_SH_VERSION linux/amd64"
    exit 0
  ;;
esac

# ------------------------------------------------------------------ #

REPO=$(echo "REPO_${2^^}" | sed 's/[-.]/_/g' | sed 's/+/_PLUS/g')
APP_NAME="$2"
APP_VERSION="$3"
INSTALL_SUCCESS="${APP_NAME} v${APP_VERSION} was installed successfully."

# ------------------------------------------------------------------ #

if [ -z "$2" ]; then
  echo -e "You forgot to supply an application name. Please run \"ginstall.sh --help\" for usage information."
  exit 1
fi

# ------------------------------------------------------------------ #

if [ -z "$3" ]; then
  echo -e "You forgot to supply a version number. Please run \"ginstall.sh --help\" for usage information."
  exit 1
fi

# ------------------------------------------------------------------ #

if [ "$3" == "latest" ]; then
  case "$2" in
    "caire" | "delta" | "ffmpeg" | "frpc" | "frps" | "gh" | "go" | "micro" | "rclone" | "stdiscosrv" | "shellcheck" | "step" | "strelaysrv" | "syncthing" | "upx")
      echo -e "This application currently does not support the version argument \"$3\"."
      exit 1
    ;;

    *)
      if [ "$(id -u)" == "0" ] || [ "${DIR_ARG}" == "true" ]; then
        APP_VERSION=""
        PREFIX_V=""
        PREFIX_NONE=""
        INSTALL_SUCCESS="The latest version of $2 was installed successfully."
      else
        echo -e "${NO_PERMISSION}"
        exit 1
      fi
    ;;
  esac
fi

# ------------------------------------------------------------------ #

if [ "$(id -u)" == "0" ] || [ "${DIR_ARG}" == "true" ]; then
  case "$2" in
    "annie")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'annie_*_Linux_64-bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}/${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "bin")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'bin-v*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}/${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "blocky")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'blocky_v*_linux_amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "bw")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'bw-linux-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${APP_DIR}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "caddy")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'caddy_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "caire")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'caire-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" caire-"${APP_VERSION}"-linux-amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "composer")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'composer.phar' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "coredns")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'coredns_*_linux_amd64.tgz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "croc")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'croc_*_Linux-64bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "ctop")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'ctop-*-linux-amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "delta")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'delta-*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" delta-"${APP_VERSION}"-x86_64-unknown-linux-gnu/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "dive")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'dive_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "dnscrypt-proxy")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'dnscrypt-proxy-linux_x86_64-*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" linux-x86_64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "docker-compose")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'docker-compose-Linux-x86_64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "docker-credential-pass")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'docker-credential-pass-v*-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "exa")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'exa-linux-x86_64-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-x86_64 -d "${APP_DIR}" && \
      mv "${APP_DIR}"/"${APP_NAME}"-linux-x86_64 "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "ffmpeg")
      curl -Lf -o "${TMP_DIR_TAR_XZ}" https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${APP_DIR}" ffmpeg-"${APP_VERSION}"-amd64-static/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "ffsend")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'ffsend-v*-linux-x64-static' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "filebrowser")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'linux-amd64-filebrowser.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "frpc")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'frp_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" frp_"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "frps")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'frp_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" frp_"${APP_VERSION}"_linux_amd64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "fzf")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'fzf-*-linux_amd64.tgz' > "${TMP_DIR_TGZ}" && \
      tar -xf "${TMP_DIR_TGZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TGZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gdrive")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'gdrive-linux-x64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gget")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'gget-*-linux-amd64' > "${TMP_DIR_GGET}" && \
      mv "${TMP_DIR_GGET}" "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gh")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'gh_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" gh_"${APP_VERSION}"_linux_amd64/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "ginstall.sh")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'ginstall.sh' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gitea")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'gitea-*-linux-amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "go")
      curl -Lf -o "${TMP_DIR_TAR_GZ}" https://dl.google.com/go/go"${APP_VERSION}".linux-amd64.tar.gz && \
      rm -rf "${GO_DIR:?}"/"${APP_NAME}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${GO_DIR}" ${TAR_ARGS} && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gogs")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" gogs/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "goreleaser")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'goreleaser_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gosu")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'gosu-amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "gotty")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'gotty_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" ./"${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "hey")
      curl -Lf -o "${APP_DIR}"/"${APP_NAME}" https://storage.googleapis.com/hey-release/hey_linux_amd64 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}"  && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "hugo")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'hugo_extended_*_Linux-64bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "httpstat")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'httpstat-linux-amd64-v*' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "imdl")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'imdl-v*-x86_64-unknown-linux-musl.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "inlets")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'inlets' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "k3s")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'k3s' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "k9s")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'k9s_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "komga")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'komga-*.jar' > "${APP_DIR}"/"${APP_NAME}".jar && \
      chmod +x "${APP_DIR}"/"${APP_NAME}".jar && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "kompose")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'kompose-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}"-linux-amd64 ${TAR_ARGS} && \
      mv "${APP_DIR}"/"${APP_NAME}"-linux-amd64 "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}/${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "lazydocker")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'lazydocker_*_Linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "lego")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'lego_v*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "micro")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'micro-*-linux64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" micro-"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "mkcert")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'mkcert-v*-linux-amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "nebula")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'nebula-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "pgweb")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'pgweb_linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" "${APP_NAME}"_linux_amd64 -d "${APP_DIR}" && \
      mv "${APP_DIR}"/"${APP_NAME}"_linux_amd64 "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "podman-remote")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'podman-remote-static.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "portainer")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'portainer-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" portainer/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "qrcp")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'qrcp_*_linux_x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "restic")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'restic_*_linux_amd64.bz2' > "${TMP_DIR_BZ2}" && \
      bzip2 -d "${TMP_DIR_BZ2}" -c > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_BZ2}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "rclone")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'rclone-v*-linux-amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" rclone-v"${APP_VERSION}"-linux-amd64/rclone -d "${APP_DIR}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "shellcheck")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'shellcheck-v*.linux.x86_64.tar.xz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${APP_DIR}" shellcheck-v"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "slack-term")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'slack-term-linux-amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "statping")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'statping-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "stdiscosrv")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'stdiscosrv-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" stdiscosrv-linux-amd64-v"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "step")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'step_linux_*_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" step_"${APP_VERSION}"/bin/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "strelaysrv")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'strelaysrv-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" strelaysrv-linux-amd64-v"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "syncthing")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'syncthing-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" syncthing-linux-amd64-v"${APP_VERSION}"/syncthing ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "tldr++")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'tldr_*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" tldr ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/tldr && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "traefik")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'traefik_v*_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "transfersh")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'transfersh-v*-linux-amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "upx")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'upx-*-amd64_linux.tar.xz' > "${TMP_DIR_TAR_XZ}" && \
      tar -xf "${TMP_DIR_TAR_XZ}" -C "${APP_DIR}" upx-"${APP_VERSION}"-amd64_linux/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_XZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "vigil")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'v*-x86_64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" ./vigil/"${APP_NAME}" ${TAR_ARGS} --strip-components=2 && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "watchtower")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'watchtower_linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${APP_DIR}" "${APP_NAME}" ${TAR_ARGS} && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "wuzz")
      gget --stdout "${!REPO}""${PREFIX_V}""${APP_VERSION}" 'wuzz_linux_amd64' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    "youtube-dl")
      gget --stdout "${!REPO}""${PREFIX_NONE}""${APP_VERSION}" 'youtube-dl' > "${APP_DIR}"/"${APP_NAME}" && \
      chmod +x "${APP_DIR}"/"${APP_NAME}" && \
      echo -e "${INSTALL_SUCCESS}"
    ;;

    *)
      echo -e "${UNSUPPORTED}"
      exit 1
    ;;
  esac
else
  echo -e "${NO_PERMISSION}"
  exit 1
fi
