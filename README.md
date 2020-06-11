## About
This script can be used to install/update a number of statically compiled applications from the command line.

It makes heavy use of [gget](https://github.com/dpb587/gget) under the hood to dynamically fetch git repository assets whenever possible.

## Dependencies
### Mandatory
• [gget](https://github.com/dpb587/gget) v0.3.0 or later

• [curl](https://packages.debian.org/buster/curl)

• [tar](https://packages.debian.org/buster/tar)

• [unzip](https://packages.debian.org/buster/unzip)

### Optional
• [bzip2](https://packages.debian.org/buster/bzip2) (only required for installing `restic`)

• [gzip](https://packages.debian.org/buster/gzip) (only required for installing `cloud-torrnt`, `goatcounter` and `govc`)

• [p7zip](https://packages.debian.org/buster/p7zip) (only required for installing `gobuster`)

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

You can view a markdown-formatted version of the list with easily-clickable repository links by opening the spoiler below.

<details>
  <summary>Spoiler</summary>
<p></p>

| Application | Repository |
| ----------- | ---------- |
| acme-dns                    | https://github.com/joohoi/acme-dns |
| adguardhome                 | https://github.com/AdguardTeam/AdGuardHome |
| age                         | https://github.com/FiloSottile/age |
| andesite                    | https://github.com/nektro/andesite |
| annie                       | https://github.com/iawia002/annie |
| apizza                      | https://github.com/harrybrwn/apizza |
| arc                         | https://github.com/mholt/archiver |
| argocd                      | https://github.com/argoproj/argo-cd |
| authelia                    | https://github.com/authelia/authelia |
| autocert                    | https://github.com/smallstep/autocert |
| bed                         | https://github.com/itchyny/bed |
| bin                         | https://github.com/w4/bin |
| blocky                      | https://github.com/0xERR0R/blocky |
| bombardier                  | https://github.com/codesenberg/bombardier |
| brig                        | https://github.com/sahib/brig |
| bw                          | https://github.com/bitwarden/cli |
| caddy                       | https://github.com/caddyserver/caddy |
| caire                       | https://github.com/esimov/caire |
| captainhook                 | https://github.com/bketelsen/captainhook |
| ccat                        | https://github.com/jingweno/ccat |
| chroma                      | https://github.com/alecthomas/chroma |
| cloud-torrent               | https://github.com/jpillora/cloud-torrent |
| cobalt                      | https://github.com/cobalt-org/cobalt.rs |
| comics-downloader           | https://github.com/Girbons/comics-downloader |
| composer                    | https://github.com/composer/composer |
| coredns                     | https://github.com/coredns/coredns |
| croc                        | https://github.com/schollz/croc |
| ctop                        | https://github.com/bcicen/ctop |
| ddgr                        | https://github.com/jarun/ddgr |
| ddns                        | https://github.com/crazy-max/ddns-route53 |
| delta                       | https://github.com/dandavison/delta |
| discord-console             | https://github.com/discordconsole-team/DiscordConsole |
| discord-delete              | https://github.com/adversarialtools/discord-delete |
| diun                        | https://github.com/crazy-max/diun |
| dive                        | https://github.com/wagoodman/dive |
| dnscontrol                  | https://github.com/StackExchange/dnscontrol |
| dnscrypt-proxy              | https://github.com/DNSCrypt/dnscrypt-proxy |
| dobi                        | https://github.com/dnephin/dobi |
| docker-compose              | https://github.com/docker/compose |
| docker-credential-pass      | https://github.com/docker/docker-credential-helpers |
| docker-gen                  | https://github.com/jwilder/docker-gen |
| docker-machine              | https://github.com/docker/machine |
| drone                       | https://github.com/drone/drone-cli |
| duplicacy                   | https://github.com/gilbertchen/duplicacy |
| edgedns                     | https://github.com/jedisct1/edgedns |
| etcd                        | https://github.com/etcd-io/etcd |
| ethr                        | https://github.com/microsoft/ethr |
| eureka                      | https://github.com/mimoo/eureka |
| exa                         | https://github.com/ogham/exa |
| ffmpeg                      | https://github.com/FFmpeg/FFmpeg |
| ffsend                      | https://github.com/timvisee/ffsend |
| filebrowser                 | https://github.com/filebrowser/filebrowser |
| firecracker                 | https://github.com/firecracker-microvm/firecracker |
| flux                        | https://github.com/fluxcd/flux |
| fn                          | https://github.com/iron-io/functions |
| frpc                        | https://github.com/fatedier/frp |
| frps                        | https://github.com/fatedier/frp |
| ftpgrab                     | https://github.com/ftpgrab/ftpgrab |
| fx                          | https://github.com/metrue/fx |
| fzf                         | https://github.com/junegunn/fzf |
| gdrive                      | https://github.com/gdrive-org/gdrive |
| geoip-updater               | https://github.com/crazy-max/geoip-updater |
| gget                        | https://github.com/dpb587/gget |
| gh                          | https://github.com/cli/cli |
| ginstall.sh                 | https://github.com/whalehub/ginstall.sh |
| git-hooks                   | https://github.com/git-hooks/git-hooks |
| git-rewrite-author          | https://github.com/crazy-max/git-rewrite-author |
| gitbatch                    | https://github.com/isacikgoz/gitbatch |
| gitea                       | https://github.com/go-gitea/gitea |
| go                          | https://github.com/golang/go |
| go-auto-yt                  | https://github.com/XiovV/Golty |
| go-avif                     | https://github.com/Kagami/go-avif |
| goatcounter                 | https://github.com/zgoat/goatcounter |
| gobuster                    | https://github.com/OJ/gobuster |
| gogs                        | https://github.com/gogs/gogs |
| golangci-lint               | https://github.com/golangci/golangci-lint |
| gomplate                    | https://github.com/hairyhenderson/gomplate |
| gomuks                      | https://github.com/tulir/gomuks |
| googler                     | https://github.com/jarun/googler |
| gopass                      | https://github.com/gopasspw/gopass |
| goreleaser                  | https://github.com/goreleaser/goreleaser |
| gossa                       | https://github.com/pldubouilh/gossa |
| gosu                        | https://github.com/tianon/gosu |
| gotty                       | https://github.com/yudai/gotty |
| govc                        | https://github.com/vmware/govmomi |
| gpldr-clint                 | https://github.com/Depado/goploader |
| gpldr-server                | https://github.com/Depado/goploader |
| hey                         | https://github.com/rakyll/hey |
| httpstat                    | https://github.com/davecheney/httpstat |
| hugo                        | https://github.com/gohugoio/hugo |
| identity                    | https://github.com/storj/storj |
| imdl                        | https://github.com/casey/intermodal |
| inlets                      | https://github.com/inlets/inlets |
| intercert                   | https://github.com/evenh/intercert |
| ipfs                        | https://github.com/ipfs/go-ipfs |
| jailer                      | https://github.com/firecracker-microvm/firecracker |
| jellycli                    | https://github.com/tryffel/jellycli |
| json2csv                    | https://github.com/jehiah/json2csv |
| json5                       | https://github.com/yosuke-furukawa/json5 |
| jsteg                       | https://github.com/lukechampine/jsteg |
| k3s                         | https://github.com/rancher/k3s |
| k9s                         | https://github.com/derailed/k9s |
| komga                       | https://github.com/gotson/komga |
| kompose                     | https://github.com/kubernetes/kompose |
| lazydocker                  | https://github.com/jesseduffield/lazydocker |
| lego                        | https://github.com/go-acme/lego |
| linuxkit                    | https://github.com/linuxkit/linuxkit |
| linx-cleanup                | https://github.com/andreimarcu/linx-server |
| linx-genkey                 | https://github.com/andreimarcu/linx-server |
| linx-server                 | https://github.com/andreimarcu/linx-server |
| logcli                      | https://github.com/grafana/loki |
| loki                        | https://github.com/grafana/loki |
| louketo-proxy               | https://github.com/louketo/louketo-proxy |
| magneticod                  | https://github.com/boramalper/magnetico |
| magneticow                  | https://github.com/boramalper/magnetico |
| matterbridge                | https://github.com/42wim/matterbridge |
| mdbook                      | https://github.com/rust-lang/mdBook |
| micro                       | https://github.com/zyedidia/micro |
| minify                      | https://github.com/tdewolff/minify |
| mkcert                      | https://github.com/FiloSottile/mkcert |
| monitoror                   | https://github.com/monitoror/monitoror |
| navidrome                   | https://github.com/deluan/navidrome |
| nebula                      | https://github.com/slackhq/nebula |
| niltalk                     | https://github.com/knadh/niltalk |
| nnn                         | https://github.com/jarun/nnn |
| oauth2-proxy                | https://github.com/oauth2-proxy/oauth2-proxy |
| oragono                     | https://github.com/oragono/oragono |
| parcello                    | https://github.com/phogolabs/parcello |
| peach                       | https://github.com/peachdocs/peach |
| pebble                      | https://github.com/letsencrypt/pebble |
| pebble-challtestsrv         | https://github.com/letsencrypt/pebble |
| pgweb                       | https://github.com/sosedoff/pgweb |
| pkger                       | https://github.com/markbates/pkger |
| plexdrive                   | https://github.com/plexdrive/plexdrive |
| plik                        | https://github.com/root-gg/plik |
| plikd                       | https://github.com/root-gg/plik |
| podman-remote               | https://github.com/containers/libpod |
| pomerium                    | https://github.com/pomerium/pomerium |
| pomerium-cli                | https://github.com/pomerium/pomerium |
| portainer                   | https://github.com/portainer/portainer |
| promtail                    | https://github.com/grafana/loki |
| qrcp                        | https://github.com/claudiodangelis/qrcp |
| rage                        | https://github.com/str4d/rage |
| rattlesnakeos-stack         | https://github.com/dan-v/rattlesnakeos-stack |
| rclone                      | https://github.com/rclone/rclone |
| red                         | https://github.com/antonmedv/red |
| reg                         | https://github.com/genuinetools/reg |
| restic                      | https://github.com/restic/restic |
| rio                         | https://github.com/rancher/rio |
| rootlesskit                 | https://github.com/rootless-containers/rootlesskit |
| s                           | https://github.com/zquestz/s |
| s2c                         | https://github.com/klauspost/compress |
| s2d                         | https://github.com/klauspost/compress |
| sdns                        | https://github.com/semihalev/sdns |
| shellcheck                  | https://github.com/koalaman/shellcheck |
| simple-vpn                  | https://github.com/skx/simple-vpn |
| slack-term                  | https://github.com/erroneousboat/slack-term |
| slink                       | https://github.com/lukechampine/jsteg |
| ssh-auditor                 | https://github.com/ncsa/ssh-auditor |
| starship                    | https://github.com/starship/starship |
| statping                    | https://github.com/statping/statping |
| stdiscosrv                  | https://github.com/syncthing/discosrv |
| stegify                     | https://github.com/DimitarPetrov/stegify |
| step                        | https://github.com/smallstep/cli |
| strelaysrv                  | https://github.com/syncthing/relaysrv |
| sup                         | https://github.com/pressly/sup |
| swarm-cronjob               | https://github.com/crazy-max/swarm-cronjob |
| syncthing                   | https://github.com/syncthing/syncthing |
| tableview                   | https://github.com/informationsea/tableview |
| task                        | https://github.com/go-task/task |
| tengo                       | https://github.com/d5/tengo |
| tldr++                      | https://github.com/isacikgoz/tldr |
| traefik                     | https://github.com/containous/traefik |
| transfersh                  | https://github.com/dutchcoders/transfer.sh |
| travis-wait-enhanced        | https://github.com/crazy-max/travis-wait-enhanced |
| txeh                        | https://github.com/txn2/txeh |
| up                          | https://github.com/apex/up |
| uplink                      | https://github.com/storj/storj |
| upx                         | https://github.com/upx/upx |
| vigil                       | https://github.com/valeriansaliou/vigil |
| vsphere-influxdb-go         | https://github.com/Oxalide/vsphere-influxdb-go |
| vuls                        | https://github.com/future-architect/vuls |
| watchtower                  | https://github.com/containrrr/watchtower |
| wuzz                        | https://github.com/asciimoo/wuzz |
| youtube-dl                  | https://github.com/ytdl-org/youtube-dl |
| yq                          | https://github.com/mikefarah/yq |
| zola                        | https://github.com/getzola/zola |

</details>

```
whalehub@pdh:~# ginstall.sh --list
Application:                Repository:
------------                -----------
A
acme-dns                    github.com/joohoi/acme-dns
adguardhome                 github.com/AdguardTeam/AdGuardHome
age                         github.com/FiloSottile/age
andesite                    github.com/nektro/andesite
annie                       github.com/iawia002/annie
apizza                      github.com/harrybrwn/apizza
arc                         github.com/mholt/archiver
argocd                      github.com/argoproj/argo-cd
authelia                    github.com/authelia/authelia
autocert                    github.com/smallstep/autocert

B
bed                         github.com/itchyny/bed
bin                         github.com/w4/bin
blocky                      github.com/0xERR0R/blocky
bombardier                  github.com/codesenberg/bombardier
brig                        github.com/sahib/brig
bw                          github.com/bitwarden/cli

C
caddy                       github.com/caddyserver/caddy
caire                       github.com/esimov/caire
captainhook                 github.com/bketelsen/captainhook
ccat                        github.com/jingweno/ccat
chroma                      github.com/alecthomas/chroma
cloud-torrent               github.com/jpillora/cloud-torrent
cobalt                      github.com/cobalt-org/cobalt.rs
comics-downloader           github.com/Girbons/comics-downloader
composer                    github.com/composer/composer
coredns                     github.com/coredns/coredns
croc                        github.com/schollz/croc
ctop                        github.com/bcicen/ctop

D
ddgr                        github.com/jarun/ddgr
ddns                        github.com/crazy-max/ddns-route53
delta                       github.com/dandavison/delta
discord-console             github.com/discordconsole-team/DiscordConsole
discord-delete              github.com/adversarialtools/discord-delete
diun                        github.com/crazy-max/diun
dive                        github.com/wagoodman/dive
dnscontrol                  github.com/StackExchange/dnscontrol
dnscrypt-proxy              github.com/DNSCrypt/dnscrypt-proxy
dobi                        github.com/dnephin/dobi
docker-compose              github.com/docker/compose
docker-credential-pass      github.com/docker/docker-credential-helpers
docker-gen                  github.com/jwilder/docker-gen
docker-machine              github.com/docker/machine
drone                       github.com/drone/drone-cli
duplicacy                   github.com/gilbertchen/duplicacy

E
edgedns                     github.com/jedisct1/edgedns
etcd                        github.com/etcd-io/etcd
ethr                        github.com/microsoft/ethr
eureka                      github.com/mimoo/eureka
exa                         github.com/ogham/exa

F
ffmpeg                      github.com/FFmpeg/FFmpeg
ffsend                      github.com/timvisee/ffsend
filebrowser                 github.com/filebrowser/filebrowser
firecracker                 github.com/firecracker-microvm/firecracker
flux                        github.com/fluxcd/flux
fn                          github.com/iron-io/functions
frpc                        github.com/fatedier/frp
frps                        github.com/fatedier/frp
ftpgrab                     github.com/ftpgrab/ftpgrab
fx                          github.com/metrue/fx
fzf                         github.com/junegunn/fzf

G
gdrive                      github.com/gdrive-org/gdrive
geoip-updater               github.com/crazy-max/geoip-updater
gget                        github.com/dpb587/gget
gh                          github.com/cli/cli
ginstall.sh                 github.com/whalehub/ginstall.sh
git-hooks                   github.com/git-hooks/git-hooks
git-rewrite-author          github.com/crazy-max/git-rewrite-author
gitbatch                    github.com/isacikgoz/gitbatch
gitea                       github.com/go-gitea/gitea
go                          github.com/golang/go
go-auto-yt                  github.com/XiovV/Golty
go-avif                     github.com/Kagami/go-avif
goatcounter                 github.com/zgoat/goatcounter
gobuster                    github.com/OJ/gobuster
gogs                        github.com/gogs/gogs
golangci-lint               github.com/golangci/golangci-lint
gomplate                    github.com/hairyhenderson/gomplate
gomuks                      github.com/tulir/gomuks
googler                     github.com/jarun/googler
gopass                      github.com/gopasspw/gopass
goreleaser                  github.com/goreleaser/goreleaser
gossa                       github.com/pldubouilh/gossa
gosu                        github.com/tianon/gosu
gotty                       github.com/yudai/gotty
govc                        github.com/vmware/govmomi
gpldr-clint                 github.com/Depado/goploader
gpldr-server                github.com/Depado/goploader

H
hey                         github.com/rakyll/hey
httpstat                    github.com/davecheney/httpstat
hugo                        github.com/gohugoio/hugo

I
identity                    github.com/storj/storj
imdl                        github.com/casey/intermodal
inlets                      github.com/inlets/inlets
intercert                   github.com/evenh/intercert
ipfs                        github.com/ipfs/go-ipfs

J
jailer                      github.com/firecracker-microvm/firecracker
jellycli                    github.com/tryffel/jellycli
json2csv                    github.com/jehiah/json2csv
json5                       github.com/yosuke-furukawa/json5
jsteg                       github.com/lukechampine/jsteg

K
k3s                         github.com/rancher/k3s
k9s                         github.com/derailed/k9s
komga                       github.com/gotson/komga
kompose                     github.com/kubernetes/kompose

L
lazydocker                  github.com/jesseduffield/lazydocker
lego                        github.com/go-acme/lego
linuxkit                    github.com/linuxkit/linuxkit
linx-cleanup                github.com/andreimarcu/linx-server
linx-genkey                 github.com/andreimarcu/linx-server
linx-server                 github.com/andreimarcu/linx-server
logcli                      github.com/grafana/loki
loki                        github.com/grafana/loki
louketo-proxy               github.com/louketo/louketo-proxy

M
magneticod                  github.com/boramalper/magnetico
magneticow                  github.com/boramalper/magnetico
matterbridge                github.com/42wim/matterbridge
mdbook                      github.com/rust-lang/mdBook
micro                       github.com/zyedidia/micro
minify                      github.com/tdewolff/minify
mkcert                      github.com/FiloSottile/mkcert
monitoror                   github.com/monitoror/monitoror

N
navidrome                   github.com/deluan/navidrome
nebula                      github.com/slackhq/nebula
niltalk                     github.com/knadh/niltalk
nnn                         github.com/jarun/nnn

O
oauth2-proxy                github.com/oauth2-proxy/oauth2-proxy
oragono                     github.com/oragono/oragono

P
parcello                    github.com/phogolabs/parcello
peach                       github.com/peachdocs/peach
pebble                      github.com/letsencrypt/pebble
pebble-challtestsrv         github.com/letsencrypt/pebble
pgweb                       github.com/sosedoff/pgweb
pkger                       github.com/markbates/pkger
plexdrive                   github.com/plexdrive/plexdrive
plik                        github.com/root-gg/plik
plikd                       github.com/root-gg/plik
podman-remote               github.com/containers/libpod
pomerium                    github.com/pomerium/pomerium
pomerium-cli                github.com/pomerium/pomerium
portainer                   github.com/portainer/portainer
promtail                    github.com/grafana/loki

Q
qrcp                        github.com/claudiodangelis/qrcp

R
rage                        github.com/str4d/rage
rattlesnakeos-stack         github.com/dan-v/rattlesnakeos-stack
rclone                      github.com/rclone/rclone
red                         github.com/antonmedv/red
reg                         github.com/genuinetools/reg
restic                      github.com/restic/restic
rio                         github.com/rancher/rio
rootlesskit                 github.com/rootless-containers/rootlesskit

S
s                           github.com/zquestz/s
s2c                         github.com/klauspost/compress
s2d                         github.com/klauspost/compress
sdns                        github.com/semihalev/sdns
shellcheck                  github.com/koalaman/shellcheck
simple-vpn                  github.com/skx/simple-vpn
slack-term                  github.com/erroneousboat/slack-term
slink                       github.com/lukechampine/jsteg
ssh-auditor                 github.com/ncsa/ssh-auditor
starship                    github.com/starship/starship
statping                    github.com/statping/statping
stdiscosrv                  github.com/syncthing/discosrv
stegify                     github.com/DimitarPetrov/stegify
step                        github.com/smallstep/cli
strelaysrv                  github.com/syncthing/relaysrv
sup                         github.com/pressly/sup
swarm-cronjob               github.com/crazy-max/swarm-cronjob
syncthing                   github.com/syncthing/syncthing

T
tableview                   github.com/informationsea/tableview
task                        github.com/go-task/task
tengo                       github.com/d5/tengo
tldr++                      github.com/isacikgoz/tldr
traefik                     github.com/containous/traefik
transfersh                  github.com/dutchcoders/transfer.sh
travis-wait-enhanced        github.com/crazy-max/travis-wait-enhanced
txeh                        github.com/txn2/txeh

U
up                          github.com/apex/up
uplink                      github.com/storj/storj
upx                         github.com/upx/upx

V
vigil                       github.com/valeriansaliou/vigil
vsphere-influxdb-go         github.com/Oxalide/vsphere-influxdb-go
vuls                        github.com/future-architect/vuls

W
watchtower                  github.com/containrrr/watchtower
wuzz                        github.com/asciimoo/wuzz

Y
youtube-dl                  github.com/ytdl-org/youtube-dl
yq                          github.com/mikefarah/yq

Z
zola                        github.com/getzola/zola
```

## Development

If there's a statically compiled application that you'd like to see supported by `ginstall.sh`, please feel free to either open an issue or submit a pull request.
