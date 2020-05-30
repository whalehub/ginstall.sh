## About
This script can be used to install/update a number of statically compiled applications from the command line.

It makes heavy use of [gget](https://github.com/dpb587/gget) under the hood to dynamically fetch git repository assets whenever possible.

## Dependencies

• [gget](https://github.com/dpb587/gget) v0.2.0 or later

• [tar](https://packages.debian.org/buster/tar)

• [unzip](https://packages.debian.org/buster/unzip)

## Installation

You can install `ginstall.sh` by downloading the latest release and moving it to `/usr/local/bin`.

## Usage

```
whalehub@pdh:~# ginstall.sh --help
Usage:
  ginstall.sh [flags] <app> <version>

Examples:
  ginstall.sh docker-compose 1.25.5
  ginstall.sh docker-compose latest
  ginstall.sh --check docker-compose
  ginstall.sh --remove docker-compose
  ginstall.sh --search sync

Flags:
  --check, -c           Prints the latest available version of an application
  --help, -h            Shows this page
  --list, -l            Prints a list of supported applications
  --remove, -r          Uninstalls an application
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
bin                         github.com/w4/bin
caddy                       github.com/caddyserver/caddy
composer                    github.com/composer/composer
croc                        github.com/schollz/croc
ctop                        github.com/bcicen/ctop
docker-compose              github.com/docker/compose
docker-credential-pass      github.com/docker/docker-credential-helpers
ffmpeg                      github.com/FFmpeg/FFmpeg
ffsend                      github.com/timvisee/ffsend
gget                        github.com/dpb587/gget
ginstall.sh                 github.com/whalehub/ginstall.sh
gitea                       github.com/go-gitea/gitea
go                          github.com/golang/go
gosu                        github.com/tianon/gosu
hey                         github.com/rakyll/hey
hugo                        github.com/gohugoio/hugo
imdl                        github.com/casey/intermodal
komga                       github.com/gotson/komga
lazydocker                  github.com/jesseduffield/lazydocker
lego                        github.com/go-acme/lego
mkcert                      github.com/FiloSottile/mkcert
nebula                      github.com/slackhq/nebula
portainer                   github.com/portainer/portainer
rclone                      github.com/rclone/rclone
stdiscosrv                  github.com/syncthing/discosrv
step                        github.com/smallstep/cli
strelaysrv                  github.com/syncthing/relaysrv
syncthing                   github.com/syncthing/syncthing
tldr++                      github.com/isacikgoz/tldr
traefik                     github.com/containous/traefik
upx                         github.com/upx/upx
vigil                       github.com/valeriansaliou/vigil
youtube-dl                  github.com/ytdl-org/youtube-dl
```

## Development

If there's a statically compiled application that you'd like to see supported by `ginstall.sh`, please feel free to either open an issue or submit a pull request.
