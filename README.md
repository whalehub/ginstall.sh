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
About:
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
  --version, -v         Print the ginstall.sh version information
```

## API Rate Limits

The default [rate limit for unauthenticated API requests](https://developer.github.com/v3/#rate-limiting) on GitHub is 60 per hour per IP address. If required, you can increase this limit for your account to 5,000 per hour for free by [generating a personal access token](https://github.com/settings/tokens) in your account settings and adding the following line to your user's `.bashrc` file.

```
export GITHUB_TOKEN=replace_this_string_with_your_token
```

## Supported Applications

You can view a markdown-formatted version of the list (one with easily-clickable repository links) by opening the spoiler below.

<details>
  <summary>Spoiler</summary>
<p></p>

| Application | Repository |
| ----------- | ---------- |
| annie                       | https://github.com/iawia002/annie |
| bin                         | https://github.com/w4/bin |
| blocky                      | https://github.com/0xERR0R/blocky |
| bw                          | https://github.com/bitwarden/cli |
| caddy                       | https://github.com/caddyserver/caddy |
| caire                       | https://github.com/esimov/caire |
| composer                    | https://github.com/composer/composer |
| coredns                     | https://github.com/coredns/coredns |
| croc                        | https://github.com/schollz/croc |
| ctop                        | https://github.com/bcicen/ctop |
| delta                       | https://github.com/dandavison/delta |
| dive                        | https://github.com/wagoodman/dive |
| dnscrypt-proxy              | https://github.com/DNSCrypt/dnscrypt-proxy |
| docker-compose              | https://github.com/docker/compose |
| docker-credential-pass      | https://github.com/docker/docker-credential-helpers |
| exa                         | https://github.com/ogham/exa |
| ffmpeg                      | https://github.com/FFmpeg/FFmpeg |
| ffsend                      | https://github.com/timvisee/ffsend |
| filebrowser                 | https://github.com/filebrowser/filebrowser |
| frpc                        | https://github.com/fatedier/frp |
| frps                        | https://github.com/fatedier/frp |
| fzf                         | https://github.com/junegunn/fzf |
| gdrive                      | https://github.com/gdrive-org/gdrive |
| gget                        | https://github.com/dpb587/gget |
| gh                          | https://github.com/cli/cli |
| ginstall.sh                 | https://github.com/whalehub/ginstall.sh |
| gitea                       | https://github.com/go-gitea/gitea |
| go                          | https://github.com/golang/go |
| gogs                        | https://github.com/gogs/gogs |
| goreleaser                  | https://github.com/goreleaser/goreleaser |
| gosu                        | https://github.com/tianon/gosu |
| gotty                       | https://github.com/yudai/gotty |
| hey                         | https://github.com/rakyll/hey |
| httpstat                    | https://github.com/davecheney/httpstat |
| hugo                        | https://github.com/gohugoio/hugo |
| imdl                        | https://github.com/casey/intermodal |
| inlets                      | https://github.com/inlets/inlets |
| k3s                         | https://github.com/rancher/k3s |
| k9s                         | https://github.com/derailed/k9s |
| komga                       | https://github.com/gotson/komga |
| kompose                     | https://github.com/kubernetes/kompose |
| lazydocker                  | https://github.com/jesseduffield/lazydocker |
| lego                        | https://github.com/go-acme/lego |
| micro                       | https://github.com/zyedidia/micro |
| mkcert                      | https://github.com/FiloSottile/mkcert |
| nebula                      | https://github.com/slackhq/nebula |
| pgweb                       | https://github.com/sosedoff/pgweb |
| podman-remote               | https://github.com/containers/libpod |
| portainer                   | https://github.com/portainer/portainer |
| qrcp                        | https://github.com/claudiodangelis/qrcp |
| rclone                      | https://github.com/rclone/rclone |
| restic                      | https://github.com/restic/restic |
| shellcheck                  | https://github.com/koalaman/shellcheck |
| slack-term                  | https://github.com/erroneousboat/slack-term |
| statping                    | https://github.com/statping/statping |
| stdiscosrv                  | https://github.com/syncthing/discosrv |
| step                        | https://github.com/smallstep/cli |
| strelaysrv                  | https://github.com/syncthing/relaysrv |
| syncthing                   | https://github.com/syncthing/syncthing |
| tldr++                      | https://github.com/isacikgoz/tldr |
| traefik                     | https://github.com/containous/traefik |
| transfersh                  | https://github.com/dutchcoders/transfer.sh |
| upx                         | https://github.com/upx/upx |
| vigil                       | https://github.com/valeriansaliou/vigil |
| watchtower                  | https://github.com/containrrr/watchtower |
| wuzz                        | https://github.com/asciimoo/wuzz |
| youtube-dl                  | https://github.com/ytdl-org/youtube-dl |

</details>

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
