#!/bin/sh

cp .bashrc ~
cp -r .config/VSCodium ~/.config/VSCodium
cp -r .config/qt5ct ~/.config/qt5ct

sudo apt update -y

sudo apt purge -y \
	mintstick* \
	gucharmap* \
	sticky* \
	onboard* \
	redshift* \
	seahorse* \
	gnome-keyring* \
	thingy* \
	xreader* \
	warpinator* \
	gnome-calendar* \
	libreoffice-* \
	simple-scan* \
	drawing* \
	pix* \
	zathura* \
	webapp-manager* \
	thunderbird* \
	hexchat* \
	hypnotix* \
	rhythmbox* \
	system-config-printer* \
	gnome-power-manager* \
	mint-meta-cinnamon* \
	mint-meta-core* \
	mintbackup* \
	mintinstall* \
	mintupdate* \
	mintwelcome* \
	synaptic* \
	gnome-logs* \
	gnome-system-monitor* \
	mintreport* \
	timeshift* \
	mint-backgrounds*

sudo apt upgrade -y

sudo apt install -y \
	build-essential \
	clang \
	openjdk-11-jdk \
	cmake \
	wget \
	curl \
	git \
	git-lfs \
	htop \
	mint-meta-codecs \
	papirus-icon-theme \
	podman

# amd-gpu-fan-daemon
wget https://github.com/Heraclito-Q-Saldanha/amd-gpu-fan-daemon/releases/download/v1.0.0/amd-gpu-fan-daemon_amd64_V1.0.0.deb -O \
	/tmp/amd-gpu-fan-daemon_amd64_V1.0.0.deb \
	&& sudo apt install -y /tmp/amd-gpu-fan-daemon_amd64_V1.0.0.deb; \
	rm /tmp/amd-gpu-fan-daemon_amd64_V1.0.0.deb

# codium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && apt install codium -y

# virtualbox
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
sudo apt update && sudo apt install virtualbox-6.1 -y

# update xpad
sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
sudo dkms install -m xpad -v 0.4

# flatpak
flatpak install flathub -y com.obsproject.Studio org.kde.kdenlive com.github.tchx84.Flatseal org.gimp.GIMP org.blender.Blender com.orama_interactive.Pixelorama

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# grub
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub

# distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
