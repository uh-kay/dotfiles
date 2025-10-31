#!/usr/bin/env bash

dotfiles() {
	ln -sv ~/dotfiles/.gitconfig -t ~/
	ln -sv ~/dotfiles/.bashrc -t ~/
	ln -sv ~/dotfiles/zed/settings.json -t ~/.var/app/dev.zed.Zed/config/zed/
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
    com.usebottles.bottles \
    dev.vencord.Vesktop \
    com.github.tchx84.Flatseal

    sudo dnf install go direnv just nodejs pnpm golangci-lint stow gh goose docker-compose docker-cli
}

dconf() {
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
    gsettings set org.gnome.desktop.interface accent-color green
}

packages
dconf
dotfiles

exec bash
