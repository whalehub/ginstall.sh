#!/bin/bash

GINSTALL_VERSION="1.4.0"

APP_NAME="$1"
APP_VERSION="$2"
APP_DIR="/usr/local/bin"

TMP_DIR_TAR_GZ="/tmp/ginstall.tar.gz"
TMP_DIR_TAR_XZ="/tmp/ginstall.tar.xz"
TMP_DIR_ZIP="/tmp/ginstall.zip"

TAR_ARGS="--no-same-owner --no-same-permissions"

PREFIX_V="@v"
PREFIX_NONE="@"

REPO_BIN="github.com/w4/bin"
REPO_BLOCKY="github.com/0xERR0R/blocky"
REPO_BW="github.com/bitwarden/cli"
REPO_CADDY="github.com/caddyserver/caddy"
REPO_COMPOSER="github.com/composer/composer"
REPO_CROC="github.com/schollz/croc"
REPO_CTOP="github.com/bcicen/ctop"
REPO_DOCKER_COMPOSE="github.com/docker/compose"
REPO_DOCKER_CREDENTIAL_PASS="github.com/docker/docker-credential-helpers"
REPO_FFMPEG="github.com/FFmpeg/FFmpeg"
REPO_FFSEND="github.com/timvisee/ffsend"
REPO_GGET="github.com/dpb587/gget"
REPO_GINSTALL_SH="github.com/whalehub/ginstall.sh"
REPO_GITEA="github.com/go-gitea/gitea"
REPO_GO="github.com/golang/go"
REPO_GOSU="github.com/tianon/gosu"
REPO_HEY="github.com/rakyll/hey"
REPO_HUGO="github.com/gohugoio/hugo"
REPO_IMDL="github.com/casey/intermodal"
REPO_KOMGA="github.com/gotson/komga"
REPO_LAZYDOCKER="github.com/jesseduffield/lazydocker"
REPO_LEGO="github.com/go-acme/lego"
REPO_MKCERT="github.com/FiloSottile/mkcert"
REPO_NEBULA="github.com/slackhq/nebula"
REPO_PORTAINER="github.com/portainer/portainer"
REPO_RCLONE="github.com/rclone/rclone"
REPO_STDISCOSRV="github.com/syncthing/discosrv"
REPO_STEP="github.com/smallstep/cli"
REPO_STRELAYSRV="github.com/syncthing/relaysrv"
REPO_SYNCTHING="github.com/syncthing/syncthing"
REPO_TLDR_PLUS_PLUS="github.com/isacikgoz/tldr"
REPO_TRAEFIK="github.com/containous/traefik"
REPO_UPX="github.com/upx/upx"
REPO_VIGIL="github.com/valeriansaliou/vigil"
REPO_YOUTUBE_DL="github.com/ytdl-org/youtube-dl"

REPO=REPO_${2^^}

SUPPORTED_APPS_HEADER="Application:                Repository:
------------                -----------"

SUPPORTED_APPS_LIST="
bin                         $REPO_BIN
blocky                      $REPO_BLOCKY
bw                          $REPO_BW
caddy                       $REPO_CADDY
composer                    $REPO_COMPOSER
croc                        $REPO_CROC
ctop                        $REPO_CTOP
docker-compose              $REPO_DOCKER_COMPOSE
docker-credential-pass      $REPO_DOCKER_CREDENTIAL_PASS
ffmpeg                      $REPO_FFMPEG
ffsend                      $REPO_FFSEND
gget                        $REPO_GGET
ginstall.sh                 $REPO_GINSTALL_SH
gitea                       $REPO_GITEA
go                          $REPO_GO
gosu                        $REPO_GOSU
hey                         $REPO_HEY
hugo                        $REPO_HUGO
imdl                        $REPO_IMDL
komga                       $REPO_KOMGA
lazydocker                  $REPO_LAZYDOCKER
lego                        $REPO_LEGO
mkcert                      $REPO_MKCERT
nebula                      $REPO_NEBULA
portainer                   $REPO_PORTAINER
rclone                      $REPO_RCLONE
stdiscosrv                  $REPO_STDISCOSRV
step                        $REPO_STEP
strelaysrv                  $REPO_STRELAYSRV
syncthing                   $REPO_SYNCTHING
tldr++                      $REPO_TLDR_PLUS_PLUS
traefik                     $REPO_TRAEFIK
upx                         $REPO_UPX
vigil                       $REPO_VIGIL
youtube-dl                  $REPO_YOUTUBE_DL"

HELP="Usage:
  ginstall.sh [flags] <app> <version>

Examples:
  ginstall.sh docker-compose 1.25.5
  ginstall.sh docker-compose latest
  ginstall.sh --check docker-compose
  ginstall.sh --search sync

Flags:
  --check, -c           Prints the latest available version of an application
  --first-run           Installs ginstall.sh's dependency gget via curl
  --help, -h            Shows this page
  --list, -l            Prints a list of supported applications
  --remove, -r          Uninstalls an application
  --search, -s          Performs a search on the list of supported applications
  --self-update         Updates ginstall.sh to the latest available version
  --version, -v         Prints ginstall.sh version information"

case "$1" in
  "--help" | "-h")
    echo -e "$HELP"
    exit 0
  ;;

  "--list" | "-l")
    echo -e "$SUPPORTED_APPS_HEADER""$SUPPORTED_APPS_LIST"
    exit 0
  ;;

  "--search" | "-s")
    echo -e "$SUPPORTED_APPS_HEADER""\n""$(echo -e "$SUPPORTED_APPS_LIST" | grep "$APP_VERSION")"
    exit 0
  ;;

  "--version" | "-v")
    echo -e "ginstall version $GINSTALL_VERSION linux/amd64"
    exit 0
  ;;
esac

if [ "$1" == "--first-run" ] && [ "$(id -u)" -ne 0 ]; then
  echo -e "Error: This script is not running as root or with sudo! Exiting..."
  exit 1
elif [ "$1" == "--first-run" ] && [ "$(id -u)" == 0 ]; then
  curl -Lf -o ${APP_DIR}/gget https://${REPO_GGET}/releases/download/v0.2.0/gget-0.2.0-linux-amd64 && \
  chmod +x ${APP_DIR}/gget && \
  echo -e "\nThe dependencies for ginstall.sh have been successfully installed and it is now ready for use."
  exit 0
fi

if [ "$1" == "--check" ] || [ "$1" == "-c" ]; then
case "$2" in
  "bin" | \
  "blocky" | \
  "bw" | \
  "caddy" | \
  "composer" | \
  "croc" | \
  "ctop" | \
  "ffsend" | \
  "gget" | \
  "gitea" | \
  "gosu" | \
  "hugo" | \
  "imdl" | \
  "komga" | \
  "lazydocker" | \
  "lego" | \
  "mkcert" | \
  "nebula" | \
  "portainer" | \
  "rclone" | \
  "stdiscosrv" | \
  "step" | \
  "strelaysrv" | \
  "syncthing" | \
  "traefik" | \
  "upx" | \
  "vigil")
    echo -e "The latest version of $2 is" && \
    gget --show-ref ${!REPO}
    exit 0
  ;;

  "docker-compose")
    echo -e "The latest version of $2 is" && \
    gget --show-ref ${REPO_DOCKER_COMPOSE}
    exit 0
  ;;

  "docker-credential-pass")
    echo -e "The latest version of $2 is" && \
    gget --show-ref ${REPO_DOCKER_CREDENTIAL_PASS}
    exit 0
  ;;

  "ginstall.sh")
    echo -e "The latest version of $2 is" && \
    gget --show-ref ${REPO_GINSTALL_SH}
    exit 0
  ;;

  "tldr++")
    echo -e "The latest version of $2 is" && \
    gget --show-ref ${REPO_TLDR_PLUS_PLUS}
    exit 0
  ;;

  "youtube-dl")
    echo -e "The latest version of $2 is" && \
    gget --show-ref ${REPO_YOUTUBE_DL}
    exit 0
  ;;

  "ffmpeg" | \
  "go" | \
  "hey")
    echo -e "The $1 flag currently does not support $2."
    exit 1
  ;;
esac
fi

if [ "$(id -u)" -ne 0 ]; then
  echo -e "Error: This script is not running as root or with sudo! Exiting..."
  exit 1
fi

if [ "$1" == "--self-update" ]; then
  gget --stdout ${REPO_GINSTALL_SH} 'ginstall.sh' > ${APP_DIR}/ginstall.sh && \
  chmod +x ${APP_DIR}/ginstall.sh
  exit 0
fi

if [ "$1" == "--remove" ] || [ "$1" == "-r" ] && [ "$2" == "gget" ]; then
echo -e "Are you sure that you want to uninstall ginstall.sh's dependency gget?"
echo -e "\nPlease type the number next to your desired answer."
select yn in "yes" "no"; do
  case $yn in
    "yes")
      rm ${APP_DIR}/"$2" && \
      echo -e "The dependency gget for ginstall.sh has been successfully uninstalled."
      exit 0
    ;;
    "no")
      echo -e "Exiting..."
      exit 0
    ;;
  esac
done
fi

if [ "$1" == "--remove" ] || [ "$1" == "-r" ]; then
case "$2" in
  "bin" | \
  "blocky" | \
  "bw" | \
  "caddy" | \
  "composer" | \
  "croc" | \
  "ctop" | \
  "docker-compose" | \
  "docker-credential-pass" | \
  "ffmpeg" | \
  "ffsend" | \
  "ginstall.sh" | \
  "gitea" | \
  "gosu" | \
  "hey" | \
  "hugo" | \
  "imdl" | \
  "komga" | \
  "lazydocker" | \
  "lego" | \
  "mkcert" | \
  "portainer" | \
  "rclone" | \
  "stdiscosrv" | \
  "step" | \
  "strelaysrv" | \
  "syncthing" | \
  "traefik" | \
  "upx" | \
  "vigil" | \
  "youtube-dl")
    rm ${APP_DIR}/"$2"
    exit 0
  ;;

  "go")
    rm -r /usr/local/"$2"
    exit 0
  ;;

  "nebula")
    rm ${APP_DIR}/"$2" ${APP_DIR}/"$2"-cert
    exit 0
  ;;

  "tldr++")
    rm ${APP_DIR}/tldr
    exit 0
  ;;
esac
fi

if [ -z "$1" ]; then
  echo -e "You forgot to supply an application name. Please run \"ginstall.sh --help\" for usage information."
  exit 1
fi

if [ -z "$2" ]; then
  echo -e "You forgot to supply a version number. Please run \"ginstall.sh --help\" for usage information."
  exit 1
fi

if [ "$2" == "latest" ]; then
case "$1" in
  "ffmpeg" | \
  "go" | \
  "rclone" | \
  "stdiscosrv" | \
  "step" | \
  "strelaysrv" | \
  "syncthing" | \
  "upx")
    echo -e "This application currently does not support the version argument \"$2\"."
    exit 1
  ;;

  *)
    APP_VERSION=""
    PREFIX_V=""
    PREFIX_NONE=""
  ;;
esac
fi

case "$1" in
  "bin")
    gget --stdout ${REPO_BIN}${PREFIX_V}${APP_VERSION} 'bin-v*-x86_64-unknown-linux-gnu.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "blocky")
    gget --stdout ${REPO_BLOCKY}${PREFIX_V}${APP_VERSION} 'blocky_v*_linux_amd64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "bw")
    gget --stdout ${REPO_BW}${PREFIX_V}${APP_VERSION} 'bw-linux-*.zip' > ${TMP_DIR_ZIP} && \
    unzip -jo ${TMP_DIR_ZIP} ${APP_NAME} -d ${APP_DIR} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_ZIP}
  ;;

  "caddy")
    gget --stdout ${REPO_CADDY}${PREFIX_V}${APP_VERSION} 'caddy_*_linux_amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "composer")
    gget --stdout ${REPO_COMPOSER}${PREFIX_NONE}${APP_VERSION} 'composer.phar' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "croc")
    gget --stdout ${REPO_CROC}${PREFIX_V}${APP_VERSION} 'croc_*_Linux-64bit.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "ctop")
    gget --stdout ${REPO_CTOP}${PREFIX_V}${APP_VERSION} 'ctop-*-linux-amd64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "docker-compose")
    gget --stdout ${REPO_DOCKER_COMPOSE}${PREFIX_NONE}${APP_VERSION} 'docker-compose-Linux-x86_64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "docker-credential-pass")
    gget --stdout ${REPO_DOCKER_CREDENTIAL_PASS}${PREFIX_V}${APP_VERSION} 'docker-credential-pass-v*-amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "ffmpeg")
    curl -Lf -o ${TMP_DIR_TAR_XZ} https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    tar -xf ${TMP_DIR_TAR_XZ} -C ${APP_DIR} ffmpeg-${APP_VERSION}-amd64-static/${APP_NAME} ${TAR_ARGS} --strip-components=1 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_XZ} && \
    echo -e "\n$APP_NAME v$APP_VERSION has been successfully installed."
  ;;

  "ffsend")
    gget --stdout ${REPO_FFSEND}${PREFIX_V}${APP_VERSION} 'ffsend-v*-linux-x64-static' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "gget")
    gget --stdout ${REPO_GGET}${PREFIX_V}${APP_VERSION} 'gget-*-linux-amd64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "ginstall.sh")
    gget --stdout ${REPO_GINSTALL_SH}${PREFIX_V}${APP_VERSION} 'ginstall.sh' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "gitea")
    gget --stdout ${REPO_GITEA}${PREFIX_V}${APP_VERSION} 'gitea-*-linux-amd64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "go")
    curl -Lf -o ${TMP_DIR_TAR_GZ} https://dl.google.com/go/go${APP_VERSION}.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && \
    tar -xf ${TMP_DIR_TAR_GZ} -C /usr/local ${TAR_ARGS} && \
    rm ${TMP_DIR_TAR_GZ} && \
    echo -e "\n$APP_NAME v$APP_VERSION has been successfully installed."
  ;;

  "gosu")
    gget --stdout ${REPO_GOSU}${PREFIX_NONE}${APP_VERSION} 'gosu-amd64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "hey")
    curl -Lf -o ${APP_DIR}/${APP_NAME} https://storage.googleapis.com/hey-release/hey_linux_amd64 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    echo -e "\n$APP_NAME v0.1.2 has been successfully installed."
  ;;

  "hugo")
    gget --stdout ${REPO_HUGO}${PREFIX_V}${APP_VERSION} 'hugo_extended_*_Linux-64bit.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "imdl")
    gget --stdout ${REPO_IMDL}${PREFIX_V}${APP_VERSION} 'imdl-v*-x86_64-unknown-linux-musl.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "komga")
    gget --stdout ${REPO_KOMGA}${PREFIX_V}${APP_VERSION} 'komga-*.jar' > ${APP_DIR}/${APP_NAME}.jar && \
    chmod +x ${APP_DIR}/${APP_NAME}.jar
  ;;

  "lazydocker")
    gget --stdout ${REPO_LAZYDOCKER}${PREFIX_V}${APP_VERSION} 'lazydocker_*_Linux_x86_64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "lego")
    gget --stdout ${REPO_LEGO}${PREFIX_V}${APP_VERSION} 'lego_v*_linux_amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "mkcert")
    gget --stdout ${REPO_MKCERT}${PREFIX_V}${APP_VERSION} 'mkcert-v*-linux-amd64' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  "nebula")
    gget --stdout ${REPO_NEBULA}${PREFIX_V}${APP_VERSION} 'nebula-linux-amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "portainer")
    gget --stdout ${REPO_PORTAINER}${PREFIX_NONE}${APP_VERSION} 'portainer-*-linux-amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} portainer/${APP_NAME} ${TAR_ARGS} --strip-components=1 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "rclone")
    gget --stdout ${REPO_RCLONE}${PREFIX_V}${APP_VERSION} 'rclone-v*-linux-amd64.zip' > ${TMP_DIR_ZIP} && \
    unzip -jo ${TMP_DIR_ZIP} rclone-v${APP_VERSION}-linux-amd64/rclone -d ${APP_DIR} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_ZIP}
  ;;

  "stdiscosrv")
    gget --stdout ${REPO_STDISCOSRV}${PREFIX_V}${APP_VERSION} 'stdiscosrv-linux-amd64-v*.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} stdiscosrv-linux-amd64-v${APP_VERSION}/${APP_NAME} ${TAR_ARGS} --strip-components=1 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "step")
    gget --stdout ${REPO_STEP}${PREFIX_V}${APP_VERSION} 'step_linux_*_amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} step_${APP_VERSION}/bin/${APP_NAME} ${TAR_ARGS} --strip-components=2 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "strelaysrv")
    gget --stdout ${REPO_STRELAYSRV}${PREFIX_V}${APP_VERSION} 'strelaysrv-linux-amd64-v*.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} strelaysrv-linux-amd64-v${APP_VERSION}/${APP_NAME} ${TAR_ARGS} --strip-components=1 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "syncthing")
    gget --stdout ${REPO_SYNCTHING}${PREFIX_V}${APP_VERSION} 'syncthing-linux-amd64-v*.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} syncthing-linux-amd64-v${APP_VERSION}/syncthing ${TAR_ARGS} --strip-components=1 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "tldr++")
    gget --stdout ${REPO_TLDR_PLUS_PLUS}${PREFIX_V}${APP_VERSION} 'tldr_*_linux_amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} tldr ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/tldr && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "traefik")
    gget --stdout ${REPO_TRAEFIK}${PREFIX_V}${APP_VERSION} 'traefik_v*_linux_amd64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ${APP_NAME} ${TAR_ARGS} && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "upx")
    gget --stdout ${REPO_UPX}${PREFIX_V}${APP_VERSION} 'upx-*-amd64_linux.tar.xz' > ${TMP_DIR_TAR_XZ} && \
    tar -xf ${TMP_DIR_TAR_XZ} -C ${APP_DIR} upx-${APP_VERSION}-amd64_linux/${APP_NAME} ${TAR_ARGS} --strip-components=1 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_XZ}
  ;;

  "vigil")
    gget --stdout ${REPO_VIGIL}${PREFIX_V}${APP_VERSION} 'v*-x86_64.tar.gz' > ${TMP_DIR_TAR_GZ} && \
    tar -xf ${TMP_DIR_TAR_GZ} -C ${APP_DIR} ./vigil/${APP_NAME} ${TAR_ARGS} --strip-components=2 && \
    chmod +x ${APP_DIR}/${APP_NAME} && \
    rm ${TMP_DIR_TAR_GZ}
  ;;

  "youtube-dl")
    gget --stdout ${REPO_YOUTUBE_DL}${PREFIX_NONE}${APP_VERSION} 'youtube-dl' > ${APP_DIR}/${APP_NAME} && \
    chmod +x ${APP_DIR}/${APP_NAME}
  ;;

  *)
    echo -e "This application is not supported by ginstall.sh. Please run \"ginstall.sh --help\" for usage information."
    exit 1
  ;;
esac
