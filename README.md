## ⚠ Warning ⚠
This project has reached EOL with the release of v3.4.1 and will be succeeded by a new script that was written from scratch soon™. This repository will be archived at that point.

## About
This script can be used to install/update the compiled binaries of statically and dynamically linked applications from the command line.

It makes heavy use of [gget](https://github.com/dpb587/gget) under the hood to dynamically fetch git repository assets whenever possible.

## Dependencies
### Mandatory
- standard tools (bash, chmod, chown, grep, mv, rm, sed, tar) 
- [gget](https://github.com/dpb587/gget) v0.5.2 or later
- [curl](https://packages.debian.org/buster/curl)
- [unzip](https://packages.debian.org/buster/unzip)

### Optional
- [bzip2](https://packages.debian.org/buster/bzip2) (only required for installing `restic`)
- [gzip](https://packages.debian.org/buster/gzip) (only required for installing `chisel`, `cloud-torrent`, `goatcounter` and `govc`)
- [p7zip](https://packages.debian.org/buster/p7zip) (only required for installing `gobuster`)
- [sudo](https://packages.debian.org/buster/sudo) (only required for installing to `/usr/local/bin`)

## Installation
You can install `ginstall.sh` by downloading the latest release to `/usr/local/bin` and making it executable:

```
sudo curl -L -o /usr/local/bin/ginstall.sh https://github.com/whalehub/ginstall.sh/releases/download/v3.4.1/ginstall.sh
sudo chmod +x /usr/local/bin/ginstall.sh
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
| ali                         | static              | https://github.com/nakabonne/ali |
| amass                       | static              | https://github.com/OWASP/Amass |
| annie                       | static              | https://github.com/iawia002/annie |
| arc                         | static              | https://github.com/mholt/archiver |
| bat                         | dynamic             | https://github.com/sharkdp/bat |
| bed                         | static              | https://github.com/itchyny/bed |
| bombardier                  | static              | https://github.com/codesenberg/bombardier |
| borg                        | dynamic             | https://github.com/borgbackup/borg |
| cavif                       | static              | https://github.com/kornelski/cavif-rs |
| chroma                      | dynamic             | https://github.com/alecthomas/chroma |
| cobalt                      | dynamic             | https://github.com/cobalt-org/cobalt.rs |
| comics-downloader           | static              | https://github.com/Girbons/comics-downloader |
| composer                    | dynamic             | https://github.com/composer/composer |
| croc                        | static              | https://github.com/schollz/croc |
| ctop                        | dynamic             | https://github.com/bcicen/ctop |
| ddgr                        | dynamic             | https://github.com/jarun/ddgr |
| delta                       | dynamic             | https://github.com/dandavison/delta |
| discord-console             | static              | https://github.com/discordconsole-team/DiscordConsole |
| discord-delete              | dynamic             | https://github.com/adversarialtools/discord-delete |
| diskonaut                   | static              | https://github.com/imsnif/diskonaut |
| diskus                      | dynamic             | https://github.com/sharkdp/diskus |
| dive                        | static              | https://github.com/wagoodman/dive |
| docker-credential-pass      | static              | https://github.com/docker/docker-credential-helpers |
| drone                       | static              | https://github.com/drone/drone-cli |
| dstask                      | static              | https://github.com/naggie/dstask |
| duplicacy                   | static              | https://github.com/gilbertchen/duplicacy |
| edgedns                     | dynamic             | https://github.com/jedisct1/edgedns |
| eksctl                      | static              | https://github.com/weaveworks/eksctl |
| ethr                        | dynamic             | https://github.com/microsoft/ethr |
| eureka                      | static              | https://github.com/mimoo/eureka |
| exa                         | dynamic             | https://github.com/ogham/exa |
| fd                          | dynamic             | https://github.com/sharkdp/fd |
| fetch                       | static              | https://github.com/gruntwork-io/fetch |
| ffsend                      | static              | https://github.com/timvisee/ffsend |
| findomain                   | dynamic             | https://github.com/Edu4rdSHL/findomain |
| fzf                         | static              | https://github.com/junegunn/fzf |
| gau                         | static              | https://github.com/lc/gau |
| gget                        | static              | https://github.com/dpb587/gget |
| git-credential-manager-core | dynamic             | https://github.com/microsoft/Git-Credential-Manager-Core |
| git-rewrite-author          | static              | https://github.com/crazy-max/git-rewrite-author |
| gitbatch                    | static              | https://github.com/isacikgoz/gitbatch |
| gitui                       | static              | https://github.com/extrawurst/gitui |
| gobuster                    | dynamic             | https://github.com/OJ/gobuster |
| golangci-lint               | static              | https://github.com/golangci/golangci-lint |
| gomuks                      | static              | https://github.com/tulir/gomuks |
| googler                     | dynamic             | https://github.com/jarun/googler |
| gopass                      | static              | https://github.com/gopasspw/gopass |
| gotop                       | dynamic             | https://github.com/xxxserxxx/gotop |
| grex                        | static              | https://github.com/pemistahl/grex |
| grv                         | static              | https://github.com/rgburke/grv |
| haste                       | dynamic             | https://github.com/zneix/haste-client |
| hexyl                       | dynamic             | https://github.com/sharkdp/hexyl |
| httprobe                    | dynamic             | https://github.com/tomnomnom/httprobe |
| hugo                        | static              | https://github.com/gohugoio/hugo |
| hugo-extended               | dynamic             | https://github.com/gohugoio/hugo |
| hyperfine                   | dynamic             | https://github.com/sharkdp/hyperfine |
| identity                    | static              | https://github.com/storj/storj |
| imdl                        | static              | https://github.com/casey/intermodal |
| k6                          | static              | https://github.com/loadimpact/k6 |
| kompose                     | static              | https://github.com/kubernetes/kompose |
| lazydocker                  | static              | https://github.com/jesseduffield/lazydocker |
| lazygit                     | static              | https://github.com/jesseduffield/lazygit |
| lego                        | static              | https://github.com/go-acme/lego |
| lsd                         | dynamic             | https://github.com/Peltoche/lsd |
| lucid                       | dynamic             | https://github.com/sharkdp/lucid |
| mcrcon                      | dynamic             | https://github.com/Tiiffi/mcrcon |
| mdbook                      | dynamic             | https://github.com/rust-lang/mdBook |
| minify                      | static              | https://github.com/tdewolff/minify |
| mkcert                      | static              | https://github.com/FiloSottile/mkcert |
| monolith                    | dynamic             | https://github.com/Y2Z/monolith |
| naabu                       | dynamic             | https://github.com/projectdiscovery/naabu |
| nnn                         | static              | https://github.com/jarun/nnn |
| pastel                      | dynamic             | https://github.com/sharkdp/pastel |
| plexdrive                   | dynamic             | https://github.com/plexdrive/plexdrive |
| plik                        | dynamic             | https://github.com/root-gg/plik |
| podman                      | dynamic             | https://github.com/containers/podman |
| qalc                        | dynamic             | https://github.com/Qalculate/libqalculate |
| rage                        | dynamic             | https://github.com/str4d/rage |
| rage-keygen                 | dynamic             | https://github.com/str4d/rage |
| rclone                      | static              | https://github.com/rclone/rclone |
| restic                      | static              | https://github.com/restic/restic |
| rg                          | static              | https://github.com/BurntSushi/ripgrep |
| rga                         | static              | https://github.com/phiresky/ripgrep-all |
| rga-preproc                 | static              | https://github.com/phiresky/ripgrep-all |
| shellcheck                  | static              | https://github.com/koalaman/shellcheck |
| shfmt                       | static              | https://github.com/mvdan/sh |
| slack-term                  | static              | https://github.com/erroneousboat/slack-term |
| ssh-auditor                 | static              | https://github.com/ncsa/ssh-auditor |
| starship                    | dynamic             | https://github.com/starship/starship |
| stegify                     | static              | https://github.com/DimitarPetrov/stegify |
| step                        | static              | https://github.com/smallstep/cli |
| tldr                        | static              | https://github.com/isacikgoz/tldr |
| tmate                       | static              | https://github.com/tmate-io/tmate |
| topgrade                    | dynamic             | https://github.com/r-darwish/topgrade |
| trivy                       | static              | https://github.com/aquasecurity/trivy |
| txeh                        | static              | https://github.com/txn2/txeh |
| upx                         | static              | https://github.com/upx/upx |
| vegeta                      | static              | https://github.com/tsenart/vegeta |
| vivid                       | dynamic             | https://github.com/sharkdp/vivid |
| wuzz                        | static              | https://github.com/asciimoo/wuzz |
| yq                          | static              | https://github.com/mikefarah/yq |
| zenith                      | static              | https://github.com/bvaisvil/zenith |
| zola                        | dynamic             | https://github.com/getzola/zola |
| zoxide                      | dynamic             | https://github.com/ajeetdsouza/zoxide |
</details>
