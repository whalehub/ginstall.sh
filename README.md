## About
This script can be used to install/update the compiled binaries of statically and dynamically linked applications from the command line.

It makes heavy use of [gget](https://github.com/dpb587/gget) under the hood to dynamically fetch git repository assets whenever possible.

## Dependencies
### Mandatory
• [gget](https://github.com/dpb587/gget) v0.3.0 or later

• [curl](https://packages.debian.org/buster/curl)

• [tar](https://packages.debian.org/buster/tar)

• [unzip](https://packages.debian.org/buster/unzip)

### Optional
• [bzip2](https://packages.debian.org/buster/bzip2) (only required for installing `restic`)

• [gzip](https://packages.debian.org/buster/gzip) (only required for installing `chisel`, `cloud-torrent`, `goatcounter` and `govc`)

• [p7zip](https://packages.debian.org/buster/p7zip) (only required for installing `gobuster`)

## Installation

You can install `ginstall.sh` by downloading the latest release, moving it to `/usr/local/bin` and making it executable:

```
curl -L -o /usr/local/bin/ginstall.sh https://github.com/whalehub/ginstall.sh/releases/download/v2.7.1/ginstall.sh && \
chmod +x /usr/local/bin/ginstall.sh
```

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
| act                         | https://github.com/nektos/act |
| adguardhome                 | https://github.com/AdguardTeam/AdGuardHome |
| age                         | https://github.com/FiloSottile/age |
| age-keygen                  | https://github.com/FiloSottile/age |
| amass                       | https://github.com/OWASP/Amass |
| andesite                    | https://github.com/nektro/andesite |
| annie                       | https://github.com/iawia002/annie |
| apizza                      | https://github.com/harrybrwn/apizza |
| arc                         | https://github.com/mholt/archiver |
| argocd                      | https://github.com/argoproj/argo-cd |
| authelia                    | https://github.com/authelia/authelia |
| autocert                    | https://github.com/smallstep/autocert |
| avif                        | https://github.com/Kagami/go-avif |
| badger                      | https://github.com/dgraph-io/dgraph |
| bat                         | https://github.com/sharkdp/bat |
| bed                         | https://github.com/itchyny/bed |
| bin                         | https://github.com/w4/bin |
| blocky                      | https://github.com/0xERR0R/blocky |
| bombardier                  | https://github.com/codesenberg/bombardier |
| borg                        | https://github.com/borgbackup/borg |
| brig                        | https://github.com/sahib/brig |
| bw                          | https://github.com/bitwarden/cli |
| caddy                       | https://github.com/caddyserver/caddy |
| caire                       | https://github.com/esimov/caire |
| captainhook                 | https://github.com/bketelsen/captainhook |
| ccat                        | https://github.com/jingweno/ccat |
| chisel                      | https://github.com/jpillora/chisel |
| chroma                      | https://github.com/alecthomas/chroma |
| cloud-torrent               | https://github.com/jpillora/cloud-torrent |
| cobalt                      | https://github.com/cobalt-org/cobalt.rs |
| comics-downloader           | https://github.com/Girbons/comics-downloader |
| composer                    | https://github.com/composer/composer |
| coredns                     | https://github.com/coredns/coredns |
| croc                        | https://github.com/schollz/croc |
| ctop                        | https://github.com/bcicen/ctop |
| ddgr                        | https://github.com/jarun/ddgr |
| ddns-route53                | https://github.com/crazy-max/ddns-route53 |
| delta                       | https://github.com/dandavison/delta |
| dgraph                      | https://github.com/dgraph-io/dgraph |
| dgraph-ratel                | https://github.com/dgraph-io/dgraph |
| discord-console             | https://github.com/discordconsole-team/DiscordConsole |
| discord-delete              | https://github.com/adversarialtools/discord-delete |
| diskus                      | https://github.com/sharkdp/diskus |
| diun                        | https://github.com/crazy-max/diun |
| dive                        | https://github.com/wagoodman/dive |
| dnscontrol                  | https://github.com/StackExchange/dnscontrol |
| dnscrypt-proxy              | https://github.com/DNSCrypt/dnscrypt-proxy |
| dnsproxy                    | https://github.com/AdguardTeam/dnsproxy |
| dobi                        | https://github.com/dnephin/dobi |
| docker-compose              | https://github.com/docker/compose |
| docker-credential-pass      | https://github.com/docker/docker-credential-helpers |
| docker-gen                  | https://github.com/jwilder/docker-gen |
| docker-machine              | https://github.com/docker/machine |
| drive                       | https://github.com/odeke-em/drive |
| drone                       | https://github.com/drone/drone-cli |
| duplicacy                   | https://github.com/gilbertchen/duplicacy |
| edgedns                     | https://github.com/jedisct1/edgedns |
| etcd                        | https://github.com/etcd-io/etcd |
| etcdctl                     | https://github.com/etcd-io/etcd |
| ethr                        | https://github.com/microsoft/ethr |
| eureka                      | https://github.com/mimoo/eureka |
| exa                         | https://github.com/ogham/exa |
| fd                          | https://github.com/sharkdp/fd |
| ffmpeg                      | https://github.com/FFmpeg/FFmpeg |
| ffsend                      | https://github.com/timvisee/ffsend |
| filebrowser                 | https://github.com/filebrowser/filebrowser |
| findomain                   | https://github.com/Edu4rdSHL/findomain |
| firecracker                 | https://github.com/firecracker-microvm/firecracker |
| fluxctl                     | https://github.com/fluxcd/flux |
| fn                          | https://github.com/iron-io/functions |
| frece                       | https://github.com/YodaEmbedding/frece |
| frpc                        | https://github.com/fatedier/frp |
| frps                        | https://github.com/fatedier/frp |
| ftpgrab                     | https://github.com/ftpgrab/ftpgrab |
| future-vuls                 | https://github.com/future-architect/vuls |
| fx                          | https://github.com/metrue/fx |
| fzf                         | https://github.com/junegunn/fzf |
| gau                         | https://github.com/lc/gau |
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
| gpldr-client                | https://github.com/Depado/goploader |
| gpldr-server                | https://github.com/Depado/goploader |
| handlr                      | https://github.com/chmln/handlr |
| hexyl                       | https://github.com/sharkdp/hexyl |
| hey                         | https://github.com/rakyll/hey |
| httpstat                    | https://github.com/davecheney/httpstat |
| hub                         | https://github.com/github/hub |
| hugo                        | https://github.com/gohugoio/hugo |
| hugo-extended               | https://github.com/gohugoio/hugo |
| hyperfine                   | https://github.com/sharkdp/hyperfine |
| identity                    | https://github.com/storj/storj |
| imdl                        | https://github.com/casey/intermodal |
| inlets                      | https://github.com/inlets/inlets |
| insect                      | https://github.com/sharkdp/insect |
| intercert                   | https://github.com/evenh/intercert |
| ipfs                        | https://github.com/ipfs/go-ipfs |
| jailer                      | https://github.com/firecracker-microvm/firecracker |
| jellycli                    | https://github.com/tryffel/jellycli |
| jq                          | https://github.com/stedolan/jq |
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
| lucid                       | https://github.com/sharkdp/lucid |
| magneticod                  | https://github.com/boramalper/magnetico |
| magneticow                  | https://github.com/boramalper/magnetico |
| matterbridge                | https://github.com/42wim/matterbridge |
| mdbook                      | https://github.com/rust-lang/mdBook |
| micro                       | https://github.com/zyedidia/micro |
| migrate                     | https://github.com/golang-migrate/migrate |
| minify                      | https://github.com/tdewolff/minify |
| mkcert                      | https://github.com/FiloSottile/mkcert |
| monitoror                   | https://github.com/monitoror/monitoror |
| naabu                       | https://github.com/projectdiscovery/naabu |
| navidrome                   | https://github.com/deluan/navidrome |
| nebula                      | https://github.com/slackhq/nebula |
| nebula-cert                 | https://github.com/slackhq/nebula |
| niltalk                     | https://github.com/knadh/niltalk |
| nnn                         | https://github.com/jarun/nnn |
| oauth2-proxy                | https://github.com/oauth2-proxy/oauth2-proxy |
| opa                         | https://github.com/open-policy-agent/opa |
| oragono                     | https://github.com/oragono/oragono |
| parcello                    | https://github.com/phogolabs/parcello |
| pastel                      | https://github.com/sharkdp/pastel |
| peach                       | https://github.com/peachdocs/peach |
| pebble                      | https://github.com/letsencrypt/pebble |
| pebble-challtestsrv         | https://github.com/letsencrypt/pebble |
| pegasus-fe                  | https://github.com/mmatyas/pegasus-frontend |
| pgweb                       | https://github.com/sosedoff/pgweb |
| phoneinfoga                 | https://github.com/sundowndev/PhoneInfoga |
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
| rage-keygen                 | https://github.com/str4d/rage |
| rattlesnakeos-stack         | https://github.com/dan-v/rattlesnakeos-stack |
| rclone                      | https://github.com/rclone/rclone |
| red                         | https://github.com/antonmedv/red |
| reg                         | https://github.com/genuinetools/reg |
| restic                      | https://github.com/restic/restic |
| rg                          | https://github.com/BurntSushi/ripgrep |
| rga                         | https://github.com/phiresky/ripgrep-all |
| rga-preproc                 | https://github.com/phiresky/ripgrep-all |
| rio                         | https://github.com/rancher/rio |
| rootlessctl                 | https://github.com/rootless-containers/rootlesskit |
| rootlesskit                 | https://github.com/rootless-containers/rootlesskit |
| rqbench                     | https://github.com/rqlite/rqlite |
| rqlite                      | https://github.com/rqlite/rqlite |
| rqlited                     | https://github.com/rqlite/rqlite |
| s                           | https://github.com/zquestz/s |
| s2c                         | https://github.com/klauspost/compress |
| s2d                         | https://github.com/klauspost/compress |
| sdns                        | https://github.com/semihalev/sdns |
| shellcheck                  | https://github.com/koalaman/shellcheck |
| simple-vpn                  | https://github.com/skx/simple-vpn |
| slack-term                  | https://github.com/erroneousboat/slack-term |
| slink                       | https://github.com/lukechampine/jsteg |
| spotifyd                    | https://github.com/Spotifyd/spotifyd |
| spt                         | https://github.com/Rigellute/spotify-tui |
| ssh-auditor                 | https://github.com/ncsa/ssh-auditor |
| sslocal                     | https://github.com/shadowsocks/shadowsocks-rust |
| ssmanager                   | https://github.com/shadowsocks/shadowsocks-rust |
| ssserver                    | https://github.com/shadowsocks/shadowsocks-rust |
| ssurl                       | https://github.com/shadowsocks/shadowsocks-rust |
| starship                    | https://github.com/starship/starship |
| statping                    | https://github.com/statping/statping |
| stdiscosrv                  | https://github.com/syncthing/discosrv |
| stegify                     | https://github.com/DimitarPetrov/stegify |
| step                        | https://github.com/smallstep/cli |
| strelaysrv                  | https://github.com/syncthing/relaysrv |
| sup                         | https://github.com/pressly/sup |
| swagger                     | https://github.com/go-swagger/go-swagger |
| swarm-cronjob               | https://github.com/crazy-max/swarm-cronjob |
| syncthing                   | https://github.com/syncthing/syncthing |
| tableview                   | https://github.com/informationsea/tableview |
| task                        | https://github.com/go-task/task |
| tengo                       | https://github.com/d5/tengo |
| tldr++                      | https://github.com/isacikgoz/tldr |
| traefik                     | https://github.com/containous/traefik |
| transfersh                  | https://github.com/dutchcoders/transfer.sh |
| travis-wait-enhanced        | https://github.com/crazy-max/travis-wait-enhanced |
| trivy                       | https://github.com/aquasecurity/trivy |
| trivy-to-vuls               | https://github.com/future-architect/vuls |
| txeh                        | https://github.com/txn2/txeh |
| unetbootin                  | https://github.com/unetbootin/unetbootin |
| unftp                       | https://github.com/bolcom/unFTP |
| up                          | https://github.com/apex/up |
| uplink                      | https://github.com/storj/storj |
| upx                         | https://github.com/upx/upx |
| vector                      | https://github.com/timberio/vector |
| velero                      | https://github.com/vmware-tanzu/velero |
| vigil                       | https://github.com/valeriansaliou/vigil |
| vivid                       | https://github.com/sharkdp/vivid |
| vsphere-influxdb-go         | https://github.com/Oxalide/vsphere-influxdb-go |
| vuls                        | https://github.com/future-architect/vuls |
| watchtower                  | https://github.com/containrrr/watchtower |
| wrangler                    | https://github.com/cloudflare/wrangler |
| wuzz                        | https://github.com/asciimoo/wuzz |
| xsv                         | https://github.com/BurntSushi/xsv |
| youtube-dl                  | https://github.com/ytdl-org/youtube-dl |
| yq                          | https://github.com/mikefarah/yq |
| ytop                        | https://github.com/cjbassi/ytop |
| zenith                      | https://github.com/bvaisvil/zenith |
| zola                        | https://github.com/getzola/zola |

</details>

```
whalehub@pdh:~# ginstall.sh --list
Application:                Repository:
------------                -----------
A
acme-dns                    github.com/joohoi/acme-dns
act                         github.com/nektos/act
adguardhome                 github.com/AdguardTeam/AdGuardHome
age                         github.com/FiloSottile/age
age-keygen                  github.com/FiloSottile/age
amass                       github.com/OWASP/Amass
andesite                    github.com/nektro/andesite
annie                       github.com/iawia002/annie
apizza                      github.com/harrybrwn/apizza
arc                         github.com/mholt/archiver
argocd                      github.com/argoproj/argo-cd
authelia                    github.com/authelia/authelia
autocert                    github.com/smallstep/autocert
avif                        github.com/Kagami/go-avif

B
badger                      github.com/dgraph-io/dgraph
bat                         github.com/sharkdp/bat
bed                         github.com/itchyny/bed
bin                         github.com/w4/bin
blocky                      github.com/0xERR0R/blocky
bombardier                  github.com/codesenberg/bombardier
borg                        github.com/borgbackup/borg
brig                        github.com/sahib/brig
bw                          github.com/bitwarden/cli

C
caddy                       github.com/caddyserver/caddy
caire                       github.com/esimov/caire
captainhook                 github.com/bketelsen/captainhook
ccat                        github.com/jingweno/ccat
chisel                      github.com/jpillora/chisel
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
ddns-route53                github.com/crazy-max/ddns-route53
delta                       github.com/dandavison/delta
dgraph                      github.com/dgraph-io/dgraph
dgraph-ratel                github.com/dgraph-io/dgraph
discord-console             github.com/discordconsole-team/DiscordConsole
discord-delete              github.com/adversarialtools/discord-delete
diskus                      github.com/sharkdp/diskus
diun                        github.com/crazy-max/diun
dive                        github.com/wagoodman/dive
dnscontrol                  github.com/StackExchange/dnscontrol
dnscrypt-proxy              github.com/DNSCrypt/dnscrypt-proxy
dnsproxy                    github.com/AdguardTeam/dnsproxy
dobi                        github.com/dnephin/dobi
docker-compose              github.com/docker/compose
docker-credential-pass      github.com/docker/docker-credential-helpers
docker-gen                  github.com/jwilder/docker-gen
docker-machine              github.com/docker/machine
drive                       github.com/odeke-em/drive
drone                       github.com/drone/drone-cli
duplicacy                   github.com/gilbertchen/duplicacy

E
edgedns                     github.com/jedisct1/edgedns
etcd                        github.com/etcd-io/etcd
etcdctl                     github.com/etcd-io/etcd
ethr                        github.com/microsoft/ethr
eureka                      github.com/mimoo/eureka
exa                         github.com/ogham/exa

F
fd                          github.com/sharkdp/fd
ffmpeg                      github.com/FFmpeg/FFmpeg
ffsend                      github.com/timvisee/ffsend
filebrowser                 github.com/filebrowser/filebrowser
findomain                   github.com/Edu4rdSHL/findomain
firecracker                 github.com/firecracker-microvm/firecracker
fluxctl                     github.com/fluxcd/flux
fn                          github.com/iron-io/functions
frece                       github.com/YodaEmbedding/frece
frpc                        github.com/fatedier/frp
frps                        github.com/fatedier/frp
ftpgrab                     github.com/ftpgrab/ftpgrab
future-vuls                 github.com/future-architect/vuls
fx                          github.com/metrue/fx
fzf                         github.com/junegunn/fzf

G
gau                         github.com/lc/gau
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
gpldr-client                github.com/Depado/goploader
gpldr-server                github.com/Depado/goploader

H
handlr                      github.com/chmln/handlr
hexyl                       github.com/sharkdp/hexyl
hey                         github.com/rakyll/hey
httpstat                    github.com/davecheney/httpstat
hub                         github.com/github/hub
hugo                        github.com/gohugoio/hugo
hugo-extended               github.com/gohugoio/hugo
hyperfine                   github.com/sharkdp/hyperfine

I
identity                    github.com/storj/storj
imdl                        github.com/casey/intermodal
inlets                      github.com/inlets/inlets
insect                      github.com/sharkdp/insect
intercert                   github.com/evenh/intercert
ipfs                        github.com/ipfs/go-ipfs

J
jailer                      github.com/firecracker-microvm/firecracker
jellycli                    github.com/tryffel/jellycli
jq                          github.com/stedolan/jq
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
lucid                       github.com/sharkdp/lucid

M
magneticod                  github.com/boramalper/magnetico
magneticow                  github.com/boramalper/magnetico
matterbridge                github.com/42wim/matterbridge
mdbook                      github.com/rust-lang/mdBook
micro                       github.com/zyedidia/micro
migrate                     github.com/golang-migrate/migrate
minify                      github.com/tdewolff/minify
mkcert                      github.com/FiloSottile/mkcert
monitoror                   github.com/monitoror/monitoror

N
naabu                       github.com/projectdiscovery/naabu
navidrome                   github.com/deluan/navidrome
nebula                      github.com/slackhq/nebula
nebula-cert                 github.com/slackhq/nebula
niltalk                     github.com/knadh/niltalk
nnn                         github.com/jarun/nnn

O
oauth2-proxy                github.com/oauth2-proxy/oauth2-proxy
opa                         github.com/open-policy-agent/opa
oragono                     github.com/oragono/oragono

P
parcello                    github.com/phogolabs/parcello
pastel                      github.com/sharkdp/pastel
peach                       github.com/peachdocs/peach
pebble                      github.com/letsencrypt/pebble
pebble-challtestsrv         github.com/letsencrypt/pebble
pegasus-fe                  github.com/mmatyas/pegasus-frontend
pgweb                       github.com/sosedoff/pgweb
phoneinfoga                 github.com/sundowndev/PhoneInfoga
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
rage-keygen                 github.com/str4d/rage
rattlesnakeos-stack         github.com/dan-v/rattlesnakeos-stack
rclone                      github.com/rclone/rclone
red                         github.com/antonmedv/red
reg                         github.com/genuinetools/reg
restic                      github.com/restic/restic
rg                          github.com/BurntSushi/ripgrep
rga                         github.com/phiresky/ripgrep-all
rga-preproc                 github.com/phiresky/ripgrep-all
rio                         github.com/rancher/rio
rootlessctl                 github.com/rootless-containers/rootlesskit
rootlesskit                 github.com/rootless-containers/rootlesskit
rqbench                     github.com/rqlite/rqlite
rqlite                      github.com/rqlite/rqlite
rqlited                     github.com/rqlite/rqlite

S
s                           github.com/zquestz/s
s2c                         github.com/klauspost/compress
s2d                         github.com/klauspost/compress
sdns                        github.com/semihalev/sdns
shellcheck                  github.com/koalaman/shellcheck
simple-vpn                  github.com/skx/simple-vpn
slack-term                  github.com/erroneousboat/slack-term
slink                       github.com/lukechampine/jsteg
spotifyd                    github.com/Spotifyd/spotifyd
spt                         github.com/Rigellute/spotify-tui
ssh-auditor                 github.com/ncsa/ssh-auditor
sslocal                     github.com/shadowsocks/shadowsocks-rust
ssmanager                   github.com/shadowsocks/shadowsocks-rust
ssserver                    github.com/shadowsocks/shadowsocks-rust
ssurl                       github.com/shadowsocks/shadowsocks-rust
starship                    github.com/starship/starship
statping                    github.com/statping/statping
stdiscosrv                  github.com/syncthing/discosrv
stegify                     github.com/DimitarPetrov/stegify
step                        github.com/smallstep/cli
strelaysrv                  github.com/syncthing/relaysrv
sup                         github.com/pressly/sup
swagger                     github.com/go-swagger/go-swagger
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
trivy                       github.com/aquasecurity/trivy
trivy-to-vuls               github.com/future-architect/vuls
txeh                        github.com/txn2/txeh

U
unetbootin                  github.com/unetbootin/unetbootin
unftp                       github.com/bolcom/unFTP
up                          github.com/apex/up
uplink                      github.com/storj/storj
upx                         github.com/upx/upx

V
vector                      github.com/timberio/vector
velero                      github.com/vmware-tanzu/velero
vigil                       github.com/valeriansaliou/vigil
vivid                       github.com/sharkdp/vivid
vsphere-influxdb-go         github.com/Oxalide/vsphere-influxdb-go
vuls                        github.com/future-architect/vuls

W
watchtower                  github.com/containrrr/watchtower
wrangler                    github.com/cloudflare/wrangler
wuzz                        github.com/asciimoo/wuzz

X
xsv                         github.com/BurntSushi/xsv

Y
youtube-dl                  github.com/ytdl-org/youtube-dl
yq                          github.com/mikefarah/yq
ytop                        github.com/cjbassi/ytop

Z
zenith                      github.com/bvaisvil/zenith
zola                        github.com/getzola/zola
```

## Development

If there's a statically compiled application that you'd like to see supported by `ginstall.sh`, please feel free to either open an issue or submit a pull request.
