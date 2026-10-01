<div align="right">
<a href="#windows">Windows</a> · <a href="#linux">Linux</a> · <a href="#macos">macOS</a> · <a href="#scripts">Scripts</a>
</div>

# 🚯 Dotfiles

![](https://flat.badgen.net/badge/platform/macOS,Windows,Linux?list=|)

## Overview

🔺 NOTICE: I'm primarily a Windows user, I've used Mac for about 10 years then moved to windows and occasionally used linux(arch and fedora).

Here are my dotfiles. There's no one line install, still working on it.

Still a work in progress
```

git clone --recursive https://github.com/mino29/dotfiles $Env:USERPROFILE\.dotfiles

```

## Common

- neovim [Meovim](https://github.com/mino29/meovim)

### Theme

🔺 NOTICE: I used nord theme wherever possible, if it's too much hassle, I often use dracula instead.
The wallpaper included is what I made using Photoshop for like 5 minutes. Feel free to use it.


#### Wallpaper

![](https://s2.loli.net/2022/09/17/9kiLVhj4ogAyaSN.png)

### Cross-platform programs

I use cross-platform programs whenever possible, so I don't get locked up in a specific ecosystem.
In the common folder are thoese programs configs that shared the same config files across different OSes.

- nushell (blazing fast shell, not supporting conda ATM is a bummer though)
- font: Hack NF

## Windows

**windows terminal**

![](https://s2.loli.net/2022/09/17/js3MVBAFxCO2rcP.png)

**oh-my-posh**

[**polarnord**](https://github.com/mino29/dotfiles/blob/master/windows/oh-my-posh/themes/polarnord.omp.json)
![2022_09_23_20_25_477.png](https://s2.loli.net/2022/09/23/QULRrtF4KkV2lnC.png)

[**pwsh10k_norse**](https://github.com/mino29/dotfiles/blob/master/windows/oh-my-posh/themes/pwsh10k_norse.omp.json)
![image.png](https://s2.loli.net/2022/09/23/lkXoYs5fAhiaIV3.png)

**btop**

![](https://s2.loli.net/2022/09/17/AvoV4OX8tD5UQy3.png)

**lf**

![](https://s2.loli.net/2022/09/17/iky2GgSawBOouKf.png)


<details>

- windows terminal theme: Tokyonight
- oh-my-posh theme: polarnord(I tweaked some color from peru)
- oh-my-posh theme: pwsh10k_norse(Heavily modified powerlevel10k_rainbow)
- Starship theme: default theme
- font: [Hack NF](https://github.com/ryanoasis/nerd-fonts)
- terminal icons: lsd (available on linux )
- task manager: btop4win (available on linux as btop)
- file explore: lf (available on linux)
- fastfetch
- neovim
- everything
- JPEGView
- bat
- btop4win
- lf
- cmd(using clink)
- zoxide
- z.lua
- bash
- zsh on windows (without WSL2)
- autohotkey (with autoreload enabled)

</details>


## Linux

🔺 NOTICE: I use [Arch Linux with GUI installer](https://archlinuxgui.in/), I
know, heresy right? Sometimes Fedora. Mostly with gnome desktop. Haven't
figured out how to use tilling window manager yet. If I'm on windows machine, I
sometimes use Arch for WSL2.

![](https://s2.loli.net/2022/09/17/vPTntKW2ZsJEMwz.png)

<details>

- zsh
- oh-my-zsh
- powerlevel10k
- neofetch
- pfetch
- neovim
- nix

</details>


## macOS

🔺 NOTICE: I don't really use mac these days, might come back to it later.

- zsh
- oh-my-zsh
- powerlevel10k
- neofetch
- brew
- nix
- neovim

## Todo

**Things I still haven't figure out**

[ ] one line install for each system
[ ] downsize all files to < 10 MB in total
[ ] oh-my-posh consistent transient prompt
[ ] more testing to ensure robustness
[ ] smarter auto-completion for meovim
[ ] useful programs that are outside of winget/choco/scoop
[ ] automatically set accent color, wallpaper, lock screen
[ ] remap capslock to escape


## End Goal

[ ] majority of keybinds can be found across platforms
[ ] most application use the same color theme
[ ] dynamic window tiling
[ ] open terminal window instantly

## Special Thanks

- [elenapan/dotfiles](https://github.com/elenapan/dotfiles)
- [spencerwooo/dotfiles](https://github.com/spencerwooo/dotfiles)
- [craftzdog/dotfiles-public/](https://github.com/craftzdog/dotfiles-public/)
- [reddit/r/unixporn](https://www.reddit.com/r/unixporn/)


---

🚯 **Dotfiles** ©Mino Woo. Released under the MIT License.

Authored and maintained by Mino Woo.

[@GitHub](https://github.com/mino29)

