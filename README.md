# **`Lucashdml's` Hyprland Dotfiles**

> [!WARNING]
> This is a fork of ``https://github.com/shub39/dotfiles`` , I restructured the directories and files to use it with gnu stow and did some minor changes to my liking, 
## Packages

### Official Repo
Needed
```
ttf-jetbrains-mono ttf-jetbrains-mono-nerd hyprpicker hyprpaper neovim polkit-gnome nwg-look noto-fonts noto-fonts-emoji noto-fonts-extra noto-fonts-cjk swaync waybar hyprlock gnome-terminal chromium cava scrcpy nemo rofi-wayland cmus copyq flatpak fastfetch imagemagick exa stow starship yazi
```

Preferred extras
```
mpv loupe gnome-boxes gnome-disk-utility gnome-system-monitor nemo-fileroller
```

### AUR
```
gruvbox-dark-icons-gtk gruvbox-material-gtk-theme-git hyprshot wlogout zen-browser-bin hyprsunset rofi-bluetooth-git
```

### Flatpak
```
it.mijorus.smile
```

## Installation

- Clone this repo in your home directory (But i do recommend you do a fork so you can start tinkering to your liking)

```bash
git clone https://github.com/Lucashdml/dotfiles
```
- Go into the dotfiles directory on your home with cd and use 
`stow .`

- Make sure you don't have conflicting files/directories ( like already having a ``.config/hypr`` )

- Instead of just deleting it do a backup renaming it ``mv .config/hypr .config/hyprBak``

- Reboot

## Extras

- [Lumi](https://github.com/shub39/lumi) waybar module to display synced lyrics of your current playing song
- [NvChad](https://nvchad.com/) a preconfigured neovim setup
- [Zsh config](https://github.com/pixegami/terminal-profile) for this setup, **edit the scripts according to your package manager first**
