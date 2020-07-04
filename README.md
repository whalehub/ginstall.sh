## About
This script can be used to install/update the compiled binaries of statically and dynamically linked applications from the command line.

It makes heavy use of [gget](https://github.com/dpb587/gget) under the hood to dynamically fetch git repository assets whenever possible.

## Dependencies
### Mandatory
• [gget](https://github.com/dpb587/gget) v0.5.1 or later

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
curl -L -o /usr/local/bin/ginstall.sh https://github.com/whalehub/ginstall.sh/releases/download/v3.1.0/ginstall.sh
chmod +x /usr/local/bin/ginstall.sh
```

The dependency `gget` can be installed by running `ginstall.sh` with the `--first-run` flag.

Once `gget` has been installed, you can update it with `ginstall.sh` just like any other supported application.

## Usage
```
whalehub@pdh:~# ginstall.sh --help
About:
  ginstall.sh is a script for installing/updating the compiled binaries of statically and dynamically linked applications.

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

## Addition Requests
If you would like to see an application added to the list of supported ones, please feel free to either open an issue or a pull request.

## Supported Applications
You can view a markdown-formatted version of the `--list` flag's output with easily-clickable repository links by opening the spoiler below.

<details>
  <summary>Spoiler</summary>
<p></p>

| Application | Linker Type | Repository |
| ----------- | ----------- | ---------- |
| acme-dns                    | dynamic             | https://github.com/joohoi/acme-dns |
| act                         | static              | https://github.com/nektos/act |
| adguardhome                 | static              | https://github.com/AdguardTeam/AdGuardHome |
| age                         | static              | https://github.com/FiloSottile/age |
| age-keygen                  | static              | https://github.com/FiloSottile/age |
| amass                       | static              | https://github.com/OWASP/Amass |
| andesite                    | dynamic             | https://github.com/nektro/andesite |
| annie                       | static              | https://github.com/iawia002/annie |
| apizza                      | static              | https://github.com/harrybrwn/apizza |
| arc                         | static              | https://github.com/mholt/archiver |
| argocd                      | static              | https://github.com/argoproj/argo-cd |
| authelia                    | static              | https://github.com/authelia/authelia |
| autocert                    | static              | https://github.com/smallstep/autocert |
| avif                        | static              | https://github.com/Kagami/go-avif |
| badger                      | dynamic             | https://github.com/dgraph-io/dgraph |
| bat                         | dynamic             | https://github.com/sharkdp/bat |
| bed                         | static              | https://github.com/itchyny/bed |
| bin                         | dynamic             | https://github.com/w4/bin |
| blocky                      | dynamic             | https://github.com/0xERR0R/blocky |
| bombardier                  | static              | https://github.com/codesenberg/bombardier |
| borg                        | dynamic             | https://github.com/borgbackup/borg |
| brig                        | dynamic             | https://github.com/sahib/brig |
| bw                          | dynamic             | https://github.com/bitwarden/cli |
| caddy                       | static              | https://github.com/caddyserver/caddy |
| caire                       | dynamic             | https://github.com/esimov/caire |
| captainhook                 | static              | https://github.com/bketelsen/captainhook |
| ccat                        | static              | https://github.com/jingweno/ccat |
| chisel                      | static              | https://github.com/jpillora/chisel |
| chroma                      | dynamic             | https://github.com/alecthomas/chroma |
| cloud-torrent               | static              | https://github.com/jpillora/cloud-torrent |
| cobalt                      | dynamic             | https://github.com/cobalt-org/cobalt.rs |
| comics-downloader           | static              | https://github.com/Girbons/comics-downloader |
| composer                    | dynamic             | https://github.com/composer/composer |
| coredns                     | static              | https://github.com/coredns/coredns |
| croc                        | static              | https://github.com/schollz/croc |
| ctop                        | dynamic             | https://github.com/bcicen/ctop |
| ddgr                        | dynamic             | https://github.com/jarun/ddgr |
| ddns-route53                | static              | https://github.com/crazy-max/ddns-route53 |
| delta                       | dynamic             | https://github.com/dandavison/delta |
| deno_lint                   | dynamic             | https://github.com/denoland/deno_lint |
| dgraph                      | dynamic             | https://github.com/dgraph-io/dgraph |
| dgraph-ratel                | dynamic             | https://github.com/dgraph-io/dgraph |
| discord-console             | static              | https://github.com/discordconsole-team/DiscordConsole |
| discord-delete              | dynamic             | https://github.com/adversarialtools/discord-delete |
| diskus                      | dynamic             | https://github.com/sharkdp/diskus |
| diun                        | static              | https://github.com/crazy-max/diun |
| dive                        | static              | https://github.com/wagoodman/dive |
| dnscontrol                  | static              | https://github.com/StackExchange/dnscontrol |
| dnscrypt-proxy              | static              | https://github.com/DNSCrypt/dnscrypt-proxy |
| dnsproxy                    | dynamic             | https://github.com/AdguardTeam/dnsproxy |
| dobi                        | static              | https://github.com/dnephin/dobi |
| docker-compose              | dynamic             | https://github.com/docker/compose |
| docker-credential-pass      | static              | https://github.com/docker/docker-credential-helpers |
| docker-gen                  | static              | https://github.com/jwilder/docker-gen |
| docker-machine              | static              | https://github.com/docker/machine |
| drive                       | static              | https://github.com/odeke-em/drive |
| drone                       | static              | https://github.com/drone/drone-cli |
| dstask                      | static              | https://github.com/naggie/dstask |
| duplicacy                   | static              | https://github.com/gilbertchen/duplicacy |
| edgedns                     | dynamic             | https://github.com/jedisct1/edgedns |
| etcd                        | static              | https://github.com/etcd-io/etcd |
| etcdctl                     | static              | https://github.com/etcd-io/etcd |
| ethr                        | dynamic             | https://github.com/microsoft/ethr |
| eureka                      | static              | https://github.com/mimoo/eureka |
| exa                         | dynamic             | https://github.com/ogham/exa |
| fd                          | dynamic             | https://github.com/sharkdp/fd |
| ffmpeg                      | static              | https://github.com/FFmpeg/FFmpeg |
| ffsend                      | static              | https://github.com/timvisee/ffsend |
| filebrowser                 | static              | https://github.com/filebrowser/filebrowser |
| findomain                   | dynamic             | https://github.com/Edu4rdSHL/findomain |
| firecracker                 | static              | https://github.com/firecracker-microvm/firecracker |
| fluxctl                     | static              | https://github.com/fluxcd/flux |
| fn                          | dynamic             | https://github.com/iron-io/functions |
| frece                       | dynamic             | https://github.com/YodaEmbedding/frece |
| frpc                        | static              | https://github.com/fatedier/frp |
| frps                        | static              | https://github.com/fatedier/frp |
| ftpgrab                     | static              | https://github.com/ftpgrab/ftpgrab |
| future-vuls                 | dynamic             | https://github.com/future-architect/vuls |
| fx                          | dynamic             | https://github.com/metrue/fx |
| fzf                         | static              | https://github.com/junegunn/fzf |
| gau                         | static              | https://github.com/lc/gau |
| gdrive                      | dynamic             | https://github.com/gdrive-org/gdrive |
| geoip-updater               | static              | https://github.com/crazy-max/geoip-updater |
| gget                        | static              | https://github.com/dpb587/gget |
| gh                          | dynamic             | https://github.com/cli/cli |
| ginstall.sh                 | dynamic             | https://github.com/whalehub/ginstall.sh |
| git-hooks                   | static              | https://github.com/git-hooks/git-hooks |
| git-rewrite-author          | static              | https://github.com/crazy-max/git-rewrite-author |
| gitbatch                    | static              | https://github.com/isacikgoz/gitbatch |
| gitea                       | static              | https://github.com/go-gitea/gitea |
| gitui                       | static              | https://github.com/extrawurst/gitui |
| go                          | dynamic             | https://github.com/golang/go |
| go-auto-yt                  | dynamic             | https://github.com/XiovV/Golty |
| goatcounter                 | static              | https://github.com/zgoat/goatcounter |
| gobuster                    | dynamic             | https://github.com/OJ/gobuster |
| gogs                        | dynamic             | https://github.com/gogs/gogs |
| golangci-lint               | static              | https://github.com/golangci/golangci-lint |
| gomplate                    | static              | https://github.com/hairyhenderson/gomplate |
| gomuks                      | static              | https://github.com/tulir/gomuks |
| googler                     | dynamic             | https://github.com/jarun/googler |
| gopass                      | static              | https://github.com/gopasspw/gopass |
| goreleaser                  | static              | https://github.com/goreleaser/goreleaser |
| gorush                      | dynamic             | https://github.com/appleboy/gorush |
| gossa                       | static              | https://github.com/pldubouilh/gossa |
| gosu                        | static              | https://github.com/tianon/gosu |
| gotop                       | dynamic             | https://github.com/xxxserxxx/gotop |
| gotty                       | dynamic             | https://github.com/yudai/gotty |
| govc                        | static              | https://github.com/vmware/govmomi |
| gpldr-client                | dynamic             | https://github.com/Depado/goploader |
| gpldr-server                | dynamic             | https://github.com/Depado/goploader |
| grpcurl                     | static              | https://github.com/fullstorydev/grpcurl |
| handlr                      | dynamic             | https://github.com/chmln/handlr |
| helm                        | static              | https://github.com/helm/helm |
| hexyl                       | dynamic             | https://github.com/sharkdp/hexyl |
| hey                         | static              | https://github.com/rakyll/hey |
| httpstat                    | static              | https://github.com/davecheney/httpstat |
| hub                         | dynamic             | https://github.com/github/hub |
| hugo                        | static              | https://github.com/gohugoio/hugo |
| hugo-extended               | dynamic             | https://github.com/gohugoio/hugo |
| hydra                       | static              | https://github.com/ory/hydra |
| hyperfine                   | dynamic             | https://github.com/sharkdp/hyperfine |
| identity                    | static              | https://github.com/storj/storj |
| imdl                        | static              | https://github.com/casey/intermodal |
| inlets                      | static              | https://github.com/inlets/inlets |
| insect                      | dynamic             | https://github.com/sharkdp/insect |
| intercert                   | static              | https://github.com/evenh/intercert |
| ipfs                        | dynamic             | https://github.com/ipfs/go-ipfs |
| jailer                      | static              | https://github.com/firecracker-microvm/firecracker |
| jellycli                    | dynamic             | https://github.com/tryffel/jellycli |
| jq                          | static              | https://github.com/stedolan/jq |
| json2csv                    | static              | https://github.com/jehiah/json2csv |
| json5                       | static              | https://github.com/yosuke-furukawa/json5 |
| jsteg                       | static              | https://github.com/lukechampine/jsteg |
| k3s                         | static              | https://github.com/rancher/k3s |
| k9s                         | static              | https://github.com/derailed/k9s |
| komga                       | dynamic             | https://github.com/gotson/komga |
| kompose                     | static              | https://github.com/kubernetes/kompose |
| lazydocker                  | static              | https://github.com/jesseduffield/lazydocker |
| lego                        | static              | https://github.com/go-acme/lego |
| linuxkit                    | static              | https://github.com/linuxkit/linuxkit |
| linx-cleanup                | static              | https://github.com/andreimarcu/linx-server |
| linx-genkey                 | static              | https://github.com/andreimarcu/linx-server |
| linx-server                 | static              | https://github.com/andreimarcu/linx-server |
| logcli                      | static              | https://github.com/grafana/loki |
| loki                        | static              | https://github.com/grafana/loki |
| louketo-proxy               | dynamic             | https://github.com/louketo/louketo-proxy |
| lucid                       | dynamic             | https://github.com/sharkdp/lucid |
| magneticod                  | dynamic             | https://github.com/boramalper/magnetico |
| magneticow                  | dynamic             | https://github.com/boramalper/magnetico |
| matterbridge                | static              | https://github.com/42wim/matterbridge |
| mdbook                      | dynamic             | https://github.com/rust-lang/mdBook |
| micro                       | static              | https://github.com/zyedidia/micro |
| migrate                     | static              | https://github.com/golang-migrate/migrate |
| minify                      | static              | https://github.com/tdewolff/minify |
| mkcert                      | static              | https://github.com/FiloSottile/mkcert |
| monitoror                   | static              | https://github.com/monitoror/monitoror |
| naabu                       | dynamic             | https://github.com/projectdiscovery/naabu |
| nakama                      | dynamic             | https://github.com/heroiclabs/nakama |
| navidrome                   | static              | https://github.com/deluan/navidrome |
| nebula                      | dynamic             | https://github.com/slackhq/nebula |
| nebula-cert                 | dynamic             | https://github.com/slackhq/nebula |
| niltalk                     | static              | https://github.com/knadh/niltalk |
| nnn                         | static              | https://github.com/jarun/nnn |
| oauth2-proxy                | static              | https://github.com/oauth2-proxy/oauth2-proxy |
| opa                         | static              | https://github.com/open-policy-agent/opa |
| oragono                     | dynamic             | https://github.com/oragono/oragono |
| parcello                    | static              | https://github.com/phogolabs/parcello |
| pastel                      | dynamic             | https://github.com/sharkdp/pastel |
| peach                       | static              | https://github.com/peachdocs/peach |
| pebble                      | dynamic             | https://github.com/letsencrypt/pebble |
| pebble-challtestsrv         | dynamic             | https://github.com/letsencrypt/pebble |
| pegasus-fe                  | dynamic             | https://github.com/mmatyas/pegasus-frontend |
| pgweb                       | static              | https://github.com/sosedoff/pgweb |
| phoneinfoga                 | static              | https://github.com/sundowndev/PhoneInfoga |
| pkger                       | static              | https://github.com/markbates/pkger |
| plexdrive                   | dynamic             | https://github.com/plexdrive/plexdrive |
| plik                        | dynamic             | https://github.com/root-gg/plik |
| plikd                       | dynamic             | https://github.com/root-gg/plik |
| podman-remote               | dynamic             | https://github.com/containers/libpod |
| pomerium                    | static              | https://github.com/pomerium/pomerium |
| pomerium-cli                | static              | https://github.com/pomerium/pomerium |
| portainer                   | static              | https://github.com/portainer/portainer |
| promtail                    | dynamic             | https://github.com/grafana/loki |
| qrcp                        | static              | https://github.com/claudiodangelis/qrcp |
| rage                        | dynamic             | https://github.com/str4d/rage |
| rage-keygen                 | dynamic             | https://github.com/str4d/rage |
| rattlesnakeos-stack         | dynamic             | https://github.com/dan-v/rattlesnakeos-stack |
| rclone                      | static              | https://github.com/rclone/rclone |
| red                         | static              | https://github.com/antonmedv/red |
| reg                         | static              | https://github.com/genuinetools/reg |
| restic                      | static              | https://github.com/restic/restic |
| rg                          | static              | https://github.com/BurntSushi/ripgrep |
| rga                         | static              | https://github.com/phiresky/ripgrep-all |
| rga-preproc                 | static              | https://github.com/phiresky/ripgrep-all |
| rio                         | static              | https://github.com/rancher/rio |
| rke                         | static              | https://github.com/rancher/rke |
| rootlessctl                 | static              | https://github.com/rootless-containers/rootlesskit |
| rootlesskit                 | static              | https://github.com/rootless-containers/rootlesskit |
| rqbench                     | dynamic             | https://github.com/rqlite/rqlite |
| rqlite                      | dynamic             | https://github.com/rqlite/rqlite |
| rqlited                     | dynamic             | https://github.com/rqlite/rqlite |
| rust-analyzer               | dynamic             | https://github.com/rust-analyzer/rust-analyzer |
| s                           | dynamic             | https://github.com/zquestz/s |
| s2c                         | static              | https://github.com/klauspost/compress |
| s2d                         | static              | https://github.com/klauspost/compress |
| sccache                     | static              | https://github.com/mozilla/sccache |
| sdns                        | static              | https://github.com/semihalev/sdns |
| shellcheck                  | static              | https://github.com/koalaman/shellcheck |
| simple-vpn                  | dynamic             | https://github.com/skx/simple-vpn |
| slack-term                  | static              | https://github.com/erroneousboat/slack-term |
| slink                       | static              | https://github.com/lukechampine/jsteg |
| spotifyd                    | static              | https://github.com/Spotifyd/spotifyd |
| spt                         | dynamic             | https://github.com/Rigellute/spotify-tui |
| ssh-auditor                 | static              | https://github.com/ncsa/ssh-auditor |
| sshcode                     | dynamic             | https://github.com/cdr/sshcode |
| sslocal                     | dynamic             | https://github.com/shadowsocks/shadowsocks-rust |
| ssmanager                   | dynamic             | https://github.com/shadowsocks/shadowsocks-rust |
| ssserver                    | dynamic             | https://github.com/shadowsocks/shadowsocks-rust |
| ssurl                       | dynamic             | https://github.com/shadowsocks/shadowsocks-rust |
| starship                    | dynamic             | https://github.com/starship/starship |
| statping                    | static              | https://github.com/statping/statping |
| stdiscosrv                  | static              | https://github.com/syncthing/discosrv |
| stegify                     | static              | https://github.com/DimitarPetrov/stegify |
| step                        | static              | https://github.com/smallstep/cli |
| strelaysrv                  | static              | https://github.com/syncthing/relaysrv |
| sup                         | static              | https://github.com/pressly/sup |
| swagger                     | static              | https://github.com/go-swagger/go-swagger |
| swarm-cronjob               | static              | https://github.com/crazy-max/swarm-cronjob |
| syncthing                   | static              | https://github.com/syncthing/syncthing |
| tableview                   | static              | https://github.com/informationsea/tableview |
| task                        | static              | https://github.com/go-task/task |
| tasklite                    | dynamic             | https://github.com/ad-si/TaskLite |
| tengo                       | static              | https://github.com/d5/tengo |
| tldr++                      | static              | https://github.com/isacikgoz/tldr |
| traefik                     | static              | https://github.com/containous/traefik |
| transfersh                  | static              | https://github.com/dutchcoders/transfer.sh |
| travis-wait-enhanced        | static              | https://github.com/crazy-max/travis-wait-enhanced |
| trivy                       | static              | https://github.com/aquasecurity/trivy |
| trivy-to-vuls               | dynamic             | https://github.com/future-architect/vuls |
| txeh                        | static              | https://github.com/txn2/txeh |
| unetbootin                  | static              | https://github.com/unetbootin/unetbootin |
| unftp                       | static              | https://github.com/bolcom/unFTP |
| up                          | static              | https://github.com/apex/up |
| uplink                      | static              | https://github.com/storj/storj |
| upx                         | static              | https://github.com/upx/upx |
| vector                      | static              | https://github.com/timberio/vector |
| velero                      | static              | https://github.com/vmware-tanzu/velero |
| vigil                       | static              | https://github.com/valeriansaliou/vigil |
| vivid                       | dynamic             | https://github.com/sharkdp/vivid |
| vsphere-influxdb-go         | dynamic             | https://github.com/Oxalide/vsphere-influxdb-go |
| vuls                        | dynamic             | https://github.com/future-architect/vuls |
| wal-g                       | dynamic             | https://github.com/wal-g/wal-g |
| watchtower                  | static              | https://github.com/containrrr/watchtower |
| wrangler                    | static              | https://github.com/cloudflare/wrangler |
| wuzz                        | static              | https://github.com/asciimoo/wuzz |
| xsv                         | static              | https://github.com/BurntSushi/xsv |
| youtube-dl                  | dynamic             | https://github.com/ytdl-org/youtube-dl |
| yq                          | static              | https://github.com/mikefarah/yq |
| ytop                        | dynamic             | https://github.com/cjbassi/ytop |
| zenith                      | static              | https://github.com/bvaisvil/zenith |
| zola                        | dynamic             | https://github.com/getzola/zola |
</details>
