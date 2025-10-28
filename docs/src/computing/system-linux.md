# Working on Linux

## Gnome 3

Several recent Linux distributions use Gnome 3 as the default desktop manager. A few *innovations* introduced by this environment are not really interesting and falling back to classical modes is useful:

- [Add minimize/maximize buttons to the corner of windows](https://askubuntu.com/questions/651347)
- [Include a permanent configurable dock for applications](https://micheleg.github.io/dash-to-dock/)

## Creating an AppImage installer

An *AppImage* application is a bundle intended to be portable across many distributions. Its main inconvenient is that you manually need to give execution permissions and launch it from command line every time.

The following snippet is aimed to automating an *AppImage* installation under Gnome 3. Simply replace the fields marked by `<something>` with the required names and run the script (requires admin rights).

```bash
#!/usr/bin/env bash
set -euo pipefail

NAME="<application-name>"
ICON="<application-icon>"

SOURCE_ICO="${ICON}.png"
SOURCE_APP="<application-image-name>.AppImage"

TARGET_DIR="/opt/${NAME}"
PIXMAPS="/usr/share/pixmaps"
APPLICATIONS="${HOME}/.local/share/applications"

sudo mkdir --parents ${TARGET_DIR}

sudo cp ${SOURCE_APP} ${TARGET_DIR}
sudo chmod u+x ${TARGET_DIR}/${SOURCE_APP}

sudo cp ${SOURCE_ICO} ${TARGET_DIR}
sudo ln -s ${TARGET_DIR}/${SOURCE_ICO} ${PIXMAPS}

echo "[Desktop Entry]
Type=Application
Name=${NAME}
Exec=${TARGET_DIR}/${SOURCE_APP}
Icon=${ICON}
Terminal=false" > ${APPLICATIONS}/${NAME}.desktop

update-desktop-database ~/.local/share/applications
echo "install ok"
```

## FTPS server configuration

```bash
sudo dnf install -y vsftpd
```

```bash
sudo vim /etc/vsftpd/vsftpd.conf
```

```ini
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/certs/vsftpd.pem                  \
	-out /etc/ssl/certs/vsftpd.pem
```

```ini
rsa_cert_file=/etc/ssl/certs/vsftpd.pem
rsa_private_key_file=/etc/ssl/certs/vsftpd.pem
```

```ini
chroot_local_user=YES
allow_writeable_chroot=YES
```

```bash
sudo systemctl enable vsftpd
sudo systemctl restart vsftpd
sudo systemctl status vsftpd
```

```bash
sudo firewall-cmd --permanent --add-service=ftp
sudo firewall-cmd --permanent --add-port=990/tcp
sudo firewall-cmd --reload
```


## Limiting CPU frequency

Management of CPU frequency can be done through `cpufrequtils`; sometimes it will only work if cores are set individually (with flag `-c` to specify the zero-based core number).

```bash
# Check before:
cpufreq-info

# Modify bounds:
cpufreq-set -c <i> -u 2.5GHz
...

# Check after:
cpufreq-info
```

## Fresh Ubuntu

This document provides the basic steps to setup a working Ubuntu system for scientific computing. It includes the general setup and customization steps. For more on #linux, please check the dedicated section.

### Getting started

First of all, become a password-less *sudoer*, run `sudo visudo` by adding the following lines to the end of the file (by replacing `walter` by your own user name):

```text
walter  ALL=(ALL:ALL) ALL
Defaults:walter !authenticate
```

Then update the system:

```bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
```

Install a temperature monitor cause scientific computing can burn:

```bash
sudo apt install lm-sensors xfce4-sensors-plugin
```

### Mount a NTFS drive

Add permanent mount points to external (NTFS) drives; use this section with care because this evolves between different versions of the packages. Tested and validated under Xubuntu 24.04.

```bash
# Install the required packages:
sudo apt install ntfs-3g

# Identify the disk to be mounted:
sudo parted -l

# Identify the UUID of the disk:
ls -alt /dev/disk/by-uuid/

# Test if mounting works:
sudo mount -t ntfs3 /dev/<drive> /home/<mountpoint>/

# Open fstab for edition:
sudo vim /etc/fstab

# Add a single line with the following:
# /dev/disk/by-uuid/<UUID> /home/<mountpoint>/ ntfs  defaults,uid=1000,gid=1000,umask=0022 0 0

# Check fstab for errors:
sudo findmnt --verify

# Maybe
sudo systemctl daemon-reload
```

### Version control

Install `git` (and `gh` if using GitHub) and configure credentials:

```bash
sudo apt install git gh

git config --global user.email "walter.dalmazsilva@gmail.com"
git config --global user.name "Walter Dal'Maz Silva"

# (optional)
gh auth login
```

### Scientific computing

- Install a good editor such as [Zed](https://zed.dev/download) or [VS Code](https://code.visualstudio.com/download).

- Minimum set for editing, retrieving data, and containerizing:

```bash
sudo apt install btop neovim curl terminator podman
```

- Minimum set for using system's built-in Python useful:

```bash
sudo apt install python3-pip python3-venv
```

- Install Octave programming language:

```bash
sudo apt install octave
```

- Install [Julia](https://julialang.org/downloads/) programming language:

```bash
curl -fsSL https://install.julialang.org | sh
```

- Install [Rust](https://www.rust-lang.org/tools/install) programming language:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

- Install the whole of TeXLive and pandoc:

```bash
sudo apt install texlive-full pandoc
```

- For containers (`podman`, `apptainer`), consider checking the dedicated section.

### Personal configuration

1. Add a secondary panel on the bottom with a few launchers for office work.
2. Modify file explorer default view mode to show detailed lists.
3. Edit `~/.config/users-dirs.dirs` to remove (some) of the default home directories.

```text
XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/.Templates"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/"
XDG_MUSIC_DIR="$HOME/"
XDG_PICTURES_DIR="$HOME/"
XDG_VIDEOS_DIR="$HOME/"
```

4. Download `.deb` packages of Edge, Chrome, Obsidian and Zettlr.
5. Once Edge and/or Chrome is available, `sudo apt remove snapd`.
6. Productivity tools I use in graphical environments:

```bash
sudo apt install texstudio jabref
```

7. Add user applications folder to `.bashrc`:

```bash
function extra_sources() {
    source "$HOME/.cargo/env"
}

function extra_paths() {
    export PATH=$HOME/.local/bin:$PATH

    if [ -d ~/Applications ]; then
        for extrapath in ~/Applications/*; do
            export PATH="$extrapath:$PATH"
        done
    fi

    unset extrapath
}

extra_sources
extra_paths
```

8. Other `.bashrc` customization:

```bash
function build_image() {
    podman build -t $1 -f $2 .
}

function run_container() {
    podman run -it $1 /bin/bash
}

function openfoam12() {
	FOAM_NAME=$HOME/Applications/openfoam12-rockylinux9
	apptainer run --cleanenv --env-file ${FOAM}.env ${FOAM}.sif
}
```
