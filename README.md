<p align="center"><img src="https://i.imgur.com/X5zKxvp.png" width=300px></p>

<p align="center">
  <a href="https://hyprland.org/">
    <img src="https://img.shields.io/static/v1?label=NIRI&message=latest&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5"/>
  </a>
   <a href="https://github.com/zemmsoares/awesome-rices">
    <img src="https://raw.githubusercontent.com/zemmsoares/awesome-rices/main/assets/awesome-rice-badge.svg" alt="awesome-rice-badge">
  </a>
  <a href="https://nixos.wiki/wiki/Flakes">
    <img src="https://img.shields.io/static/v1?label=Nix Flake&message=check&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5">
  </a>
</p>

<p align="center">
<a href="https://nixos.org/"><img src="https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4"></a>

<p align="center"><img src="/assets/1.png" width=600px></p>

<h2 align="center">革 | kaku</h2>

### ⚠ <sup><sub><samp>PLEASE RESPECT THE CREDITS IF YOU USE SOMETHING FROM MY DESKTOP/SETUP.</samp></sub></sup>

---

<pre align="center">
<a href="#seedling--setup">SETUP</a> • <a href="#herb--guides">GUIDES</a> • <a href="#four_leaf_clover--key-bindings">KEYBINDS</a> • <a href="https://linu.dev/kaku">GALLERY</a>
</pre>

---

<a href="#octocat--hi-there-thanks-for-dropping-by">
  <picture>
    <img alt="" align="right" width="400px" src="/assets/6.png"/>
  </picture>
</a>

- **Window Manager** • [Niri](https://github.com/YaLTeR/niri/)🎨 Scrolleable WM!
- **Shell** • [Nu](https://www.nushell.sh/) 🐚 with
  [starship](https://github.com/starship/starship) Cross Shell Platform!
- **Terminal** • [Ghostty](https://ghostty.org/) 💻 A powerful Hyped term
- **Panel** • [Astal](https://aylur.github.io/astal/) 🍧 Astal GTK-shell :3!
- **Notify Daemon** • [Dunst](https://github.com/dunst-project/dunst) 🍃
  Minimalist and functional!
- **Launcher** • [AnyRun](https://github.com/Kirottu/anyrun) 🚀 Fast AnyRunner!
- **File Manager** • [Yazi](https://github.com/sxyazi/yazi) 🔖 Rustacean File
  Manager!
- **GUI Basic-IDE** • [Helix](https://docs.helix-editor.com/) ✴️ Rustacean vim
  version!
- **GTK Theme** • [GTK](https://github.com/linuxmobile/Colloid-gtk-theme) 🐾 My
  Fork of colloid
- **LockScreen** •
  [Hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) 🔒 hyprland
  locker

## 🌼 <samp>INSTALLATION (NixOS)</samp>

> Request:
> [NixOs](https://channels.nixos.org/nixos-24.05/latest-nixos-minimal-x86_64-linux.iso)

- Download ISO.

```bash
wget -O https://channels.nixos.org/nixos-24.05/latest-nixos-minimal-x86_64-linux.iso
```

- Boot Into the Installer.

- Switch to Root: `sudo -i`

- Partitions:

_I prefer to use 1GB on the EFI partition. Specifically because the
'generations' list may become very long, and to avoid overloading the
partition._

```bash
# Replace nvme with your disk partition
gdisk /dev/nvme0n1
```

    - `o` (create new partition table)
    - `n` (add partition, 512M, type ef00 EFI)
    - `n` (add partition, remaining space, type 8300 Linux)
    `w` (write partition table and exit)

- Format Partitions:

```bash
mkfs.fat -F 32 -n EFI /dev/nvme0n1p1
mkfs.xfs -L NIXOS /dev/nvme0n1p2
```

- Mount Partitions:

```bash
mount /dev/disk/by-label/NIXOS /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/EFI /mnt/boot
```

- Enable nixFlakes

```bash
nix-shell -p nixVersions.stable git
```

- Clone my Dotfiles

```bash
git clone --depth 1 https://github.com/linuxmobile/kaku /mnt/etc/nixos
```

- Generate your Own Nix Hardware Settings:

### ⚠ <sup><sub><samp>DON'T FORGET IT</samp></sub></sup>

```bash
sudo nixos-generate-config --dir /mnt/etc/nixos/hosts/aesthetic --force

# Remove configuration.nix
rm -rf /mnt/etc/nixos/hosts/aesthetic/configuration.nix
```

- Install Dotfiles Using Flake

```bash
# Move to folder
cd mnt/etc/nixos/

# Install
nixos-install --flake .#aesthetic
```

- Reboot

### 🐙 <sup><sub><samp>Remember <strong>Default</strong> User & password are: nixos</samp></sub></sup>

- Change Default password for User.

```bash
passwd YourUser
```

- Install w/ Home-Manager the config

```bash
home-manager switch --flake 'github:linuxmobile/kaku#linudev@aesthetic'
```

### 🌸 <samp>SCREENSHOTS</samp>

|                           |                           |
| :-----------------------: | :-----------------------: |
| <img src="/assets/1.png"> | <img src="/assets/2.png"> |
| <img src="/assets/3.png"> | <img src="/assets/4.png"> |
| <img src="/assets/5.png"> | <img src="/assets/6.png"> |

### 🌻 <samp>TODO LIST</samp>

### 🎋 <samp>ADDITIONALS</samp>

## 🍀 <samp>KEY BINDINGS</samp>

## 💐 <samp>ACKNOWLEDGEMENTS</samp>

|           |     | Inspiration and Resources                   |                            |     |
| :-------: | :-: | :------------------------------------------ | :------------------------- | :-: |
|           |  1  | [owl4ce](https://github.com/owl4ce)         |                            |     |
|           |  2  | [Ilham25](https://github.com/ilham25)       |                            |     |
|           |  3  | [Siduck](https://github.com/siduck)         |                            |     |
|           |  4  | [NvChad](https://github.com/NvChad)         |                            |     |
|           |  5  | [Rxyhn](https://github.com/rxyhn)           |                            |     |
|           |  6  | [HeinzDev](https://github.com/HeinzDev)     |                            |     |
|           |  7  | [fufexan](https://github.com/fufexan)       |                            |     |
|           |  8  | [AmitGolden](https://github.com/AmitGolden) |                            |     |
|           |     |                                             |                            |     |
| **Based** |     | **Community**                               | **Membership Status**      |     |
|     🗺     |  3  | [r/unixp*rn](https://reddit.com/r/unixporn) | Not working there anymore. |     |

## 🌳 <samp>CONTRIBUTING</samp>

WIP

## 🎃 <samp>SECURITY POLICY</samp>

<pre align="center">
<a href="#readme">BACK TO TOP</a>
</pre>
