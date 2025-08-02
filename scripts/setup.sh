#!/usr/bin/env bash

dotfiles() {
	mv -nv ~/.bashrc ~/.config/.backup.bashrc

	ln -sv ~/Projects/dotfiles/configs/.gitconfig     -t ~/
	ln -sv ~/Projects/dotfiles/configs/.bashrc        -t ~/
}

packages() {
    flatpak install flathub \
    org.gnome.meld \
    io.github.celluloid_player.Celluloid \
    com.github.PintaProject.Pinta \
    org.qbittorrent.qBittorrent \
    com.valvesoftware.Steam \
    io.missioncenter.MissionCenter \
    org.localsend.localsend_app \
    app.zen_browser.zen \
    com.mattjakeman.ExtensionManager \
    org.torproject.torbrowser-launcher \
    com.usebruno.Bruno \
    com.usebottles.bottles

    sudo dnf install go direnv just php composer nodejs pnpm zig
}

dconf() {
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
}

dotfiles
packages
dconf

exec bash
