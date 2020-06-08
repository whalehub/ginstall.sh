## About
This script can be used to install/update a number of statically compiled applications from the command line.

It makes heavy use of [gget](https://github.com/dpb587/gget) under the hood to dynamically fetch git repository assets whenever possible.

## Dependencies

• [gget](https://github.com/dpb587/gget) v0.3.0 or later

• [bzip2](https://packages.debian.org/buster/bzip2) (only needed for `restic`)

• [curl](https://packages.debian.org/buster/curl)

• [tar](https://packages.debian.org/buster/tar)

• [unzip](https://packages.debian.org/buster/unzip)

## Installation

You can install `ginstall.sh` by downloading the latest release, moving it to `/usr/local/bin` and making it executable.

The dependency `gget` can be installed by running `ginstall.sh` with the `--first-run` flag.

Once `gget` has been installed, you can update it with `ginstall.sh` just like any other supported application.

## Usage

```
whalehub@pdh:~# ginstall.sh --help
Usage:
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
  --version, -v         Prints ginstall.sh version information
```

## API Rate Limits

The default [rate limit for unauthenticated API requests](https://developer.github.com/v3/#rate-limiting) on GitHub is 60 per hour per IP address. If required, you can increase this limit for your account to 5,000 per hour for free by [generating a personal access token](https://github.com/settings/tokens) in your account settings and adding the following line to your user's `.bashrc` file.

```
export GITHUB_TOKEN=replace_this_string_with_your_token
```

## Supported Applications

```
whalehub@pdh:~# ginstall.sh --list
Application:                Repository:
------------                -----------
A
annie                       github.com/iawia002/annie

B
bin                         github.com/w4/bin
blocky                      github.com/0xERR0R/blocky
bw                          github.com/bitwarden/cli

C
caddy                       github.com/caddyserver/caddy
caire                       github.com/esimov/caire
composer                    github.com/composer/composer
coredns                     github.com/coredns/coredns
croc                        github.com/schollz/croc
ctop                        github.com/bcicen/ctop

D
delta                       github.com/dandavison/delta
dive                        github.com/wagoodman/dive
dnscrypt-proxy              github.com/DNSCrypt/dnscrypt-proxy
docker-compose              github.com/docker/compose
docker-credential-pass      github.com/docker/docker-credential-helpers

E
exa                         github.com/ogham/exa

F
ffmpeg                      github.com/FFmpeg/FFmpeg
ffsend                      github.com/timvisee/ffsend
filebrowser                 github.com/filebrowser/filebrowser
frpc                        github.com/fatedier/frp
frps                        github.com/fatedier/frp
fzf                         github.com/junegunn/fzf

G
gdrive                      github.com/gdrive-org/gdrive
gget                        github.com/dpb587/gget
gh                          github.com/cli/cli
ginstall.sh                 github.com/whalehub/ginstall.sh
gitea                       github.com/go-gitea/gitea
go                          github.com/golang/go
gogs                        github.com/gogs/gogs
goreleaser                  github.com/goreleaser/goreleaser
gosu                        github.com/tianon/gosu
gotty                       github.com/yudai/gotty

H
hey                         github.com/rakyll/hey
httpstat                    github.com/davecheney/httpstat
hugo                        github.com/gohugoio/hugo

I
imdl                        github.com/casey/intermodal
inlets                      github.com/inlets/inlets

K
k3s                         github.com/rancher/k3s
k9s                         github.com/derailed/k9s
komga                       github.com/gotson/komga
kompose                     github.com/kubernetes/kompose

L
lazydocker                  github.com/jesseduffield/lazydocker
lego                        github.com/go-acme/lego

M
micro                       github.com/zyedidia/micro
mkcert                      github.com/FiloSottile/mkcert

N
nebula                      github.com/slackhq/nebula

P
pgweb                       github.com/sosedoff/pgweb
podman-remote               github.com/containers/libpod
portainer                   github.com/portainer/portainer

Q
qrcp                        github.com/claudiodangelis/qrcp

R
rclone                      github.com/rclone/rclone
restic                      github.com/restic/restic

S
shellcheck                  github.com/koalaman/shellcheck
slack-term                  github.com/erroneousboat/slack-term
statping                    github.com/statping/statping
stdiscosrv                  github.com/syncthing/discosrv
step                        github.com/smallstep/cli
strelaysrv                  github.com/syncthing/relaysrv
syncthing                   github.com/syncthing/syncthing

T
tldr++                      github.com/isacikgoz/tldr
traefik                     github.com/containous/traefik
transfersh                  github.com/dutchcoders/transfer.sh

U
upx                         github.com/upx/upx

V
vigil                       github.com/valeriansaliou/vigil

W
watchtower                  github.com/containrrr/watchtower
wuzz                        github.com/asciimoo/wuzz

Y
youtube-dl                  github.com/ytdl-org/youtube-dl
```

## Development

If there's a statically compiled application that you'd like to see supported by `ginstall.sh`, please feel free to either open an issue or submit a pull request.
