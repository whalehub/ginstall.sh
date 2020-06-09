#!/bin/bash

# ------------------------------------------------------------------ #

GINSTALL_SH_VERSION="2.0.3"

# ------------------------------------------------------------------ #

INSTALL_DIR_APP="/usr/local/bin"
INSTALL_DIR_GO="/usr/local"

GGET_DIR="$(command -v gget)"

TMP_DIR_GGET="/tmp/gget"
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

    case "$2" in
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
    "annie")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'annie_*_Linux_64-bit.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" "${APP_NAME}" ${TAR_ARGS} && \
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

    "bw")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'bw-linux-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" "${APP_NAME}" -d "${INSTALL_DIR_APP:?}" && \
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

    "delta")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'delta-*-x86_64-unknown-linux-gnu.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" delta-"${APP_VERSION}"-x86_64-unknown-linux-gnu/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
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

    "dnscrypt-proxy")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'dnscrypt-proxy-linux_x86_64-*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" linux-x86_64/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
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

    "exa")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'exa-linux-x86_64-*.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" "${APP_NAME}"-linux-x86_64 -d "${INSTALL_DIR_APP:?}" && \
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

    "gogs")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'linux_amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" gogs/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
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

    "hey")
      curl -Lf -o "${INSTALL_DIR_APP:?}"/"${APP_NAME}" https://storage.googleapis.com/hey-release/hey_linux_amd64 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}"  && \
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

    "httpstat")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'httpstat-linux-amd64-v*' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
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

    "micro")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'micro-*-linux64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" micro-"${APP_VERSION}"/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
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

    "nebula")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'nebula-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" ${TAR_ARGS} && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "pgweb")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'pgweb_linux_amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" "${APP_NAME}"_linux_amd64 -d "${INSTALL_DIR_APP:?}" && \
      mv "${INSTALL_DIR_APP:?}"/"${APP_NAME}"_linux_amd64 "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
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

    "portainer")
      gget --stdout "${!REPO}""${VERSION_PREFIX_NONE}""${APP_VERSION}" 'portainer-*-linux-amd64.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" portainer/"${APP_NAME}" ${TAR_ARGS} --strip-components=1 && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_TAR_GZ}" && \
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

    "restic")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'restic_*_linux_amd64.bz2' > "${TMP_DIR_BZ2}" && \
      bzip2 -d "${TMP_DIR_BZ2}" -c > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_BZ2}" && \
      echo -e "${INSTALL_SUCCESS}"
      exit 0
    ;;

    "rclone")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'rclone-v*-linux-amd64.zip' > "${TMP_DIR_ZIP}" && \
      unzip -jo "${TMP_DIR_ZIP}" rclone-v"${APP_VERSION}"-linux-amd64/rclone -d "${INSTALL_DIR_APP:?}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      rm "${TMP_DIR_ZIP}" && \
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

    "slack-term")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'slack-term-linux-amd64' > "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
      chmod +x "${INSTALL_DIR_APP:?}"/"${APP_NAME}" && \
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

    "syncthing")
      gget --stdout "${!REPO}""${VERSION_PREFIX_V}""${APP_VERSION}" 'syncthing-linux-amd64-v*.tar.gz' > "${TMP_DIR_TAR_GZ}" && \
      tar -xf "${TMP_DIR_TAR_GZ}" -C "${INSTALL_DIR_APP:?}" syncthing-linux-amd64-v"${APP_VERSION}"/syncthing ${TAR_ARGS} --strip-components=1 && \
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
