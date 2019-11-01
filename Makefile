setup: \
	init \
	setup-profile \
	setup-bashrc \
	setup-git \
	setup-fonts \
	setup-terminator \
	setup-kitty \
	setup-antibody \
	setup-zsh \
	setup-tmux \
	setup-vim \
	setup-gnome-shell-extensions \
	setup-ubuntu-dock \
	setup-gtk-themes \
	setup-vagrant \
	setup-ansible \
	setup-xrandr

init:
	sudo apt-get update
	sudo apt-get install -y git unzip curl python-pip

setup-profile:
	ln -sf `pwd`/.profile ${HOME}/.

setup-bashrc:
	ln -sf `pwd`/.bashrc ${HOME}/.

setup-git:
	git config --global core.editor "vim"

setup-fonts:
	rm -rf ${HOME}/.fonts/adobe-fonts ${HOME}/.fonts/roboto-mono

	sudo apt-get install -y fonts-roboto fonts-inconsolata fonts-powerline

	git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ${HOME}/.fonts/adobe-fonts/source-code-pro

	wget https://www.1001freefonts.com/d/16849/roboto-mono.zip
	unzip roboto-mono.zip -d ${HOME}/.fonts/roboto-mono
	rm -f roboto-mono.zip*

	fc-cache -f -v ${HOME}/.fonts/adobe-fonts/source-code-pro

	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu 8'
	gsettings set org.gnome.desktop.interface font-name 'Ubuntu 10'
	gsettings set org.gnome.desktop.interface document-font-name 'Sans 9'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 9'

	gsettings set org.gnome.desktop.interface text-scaling-factor 1
	gsettings set org.gnome.settings-daemon.plugins.xsettings hinting slight
	gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing grayscale
	gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order vrgb
	gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/ShellShowsAppMenu': <1>, 'Xft/DPI': <82944>}"

setup-terminator:
	sudo apt-get install -y terminator
	mkdir -p ${HOME}/.config/terminator
	ln -sf `pwd`/terminator/config ${HOME}/.config/terminator/.

setup-kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	mkdir -p ${HOME}/.local/bin
	mkdir -p ${HOME}/.config/kitty

	ln -sf ${HOME}/.local/kitty.app/bin/kitty ${HOME}/.local/bin/.
	ln -sf `pwd`/kitty/kitty.desktop ${HOME}/.local/share/applications/.

	ln -sf `pwd`/kitty/kitty.conf ${HOME}/.config/kitty/.
	ln -sf `pwd`/kitty/kitty.startup_session ${HOME}/.config/kitty/.

setup-antibody:
	curl -sL git.io/antibody | sh -s

setup-zsh:
	sudo apt-get install -y zsh
	ln -sf `pwd`/zsh/.zshrc ${HOME}/.
	ln -sf `pwd`/zsh/.zsh_plugins.txt ${HOME}/.

setup-tmux:
	sudo apt-get install -y tmux
	ln -sf `pwd`/tmux/.tmux ${HOME}/.
	ln -sf `pwd`/tmux/.tmux.conf ${HOME}/.
	ln -sf `pwd`/scripts/tmux-smartpr.sh ${HOME}/.

setup-vim:
	sudo apt-get install -y vim ctags

	ln -sf `pwd`/vim/.vim ${HOME}/.
	ln -sf `pwd`/vim/.vimrc  ${HOME}/.

setup-gnome-shell-extensions:
	sudo apt-get install -y gnome-tweaks

	rm -rf ${HOME}/.local/share/gnome-shell/extensions/*
	mkdir -p ${HOME}/.local/share/gnome-shell/extensions
	git clone https://github.com/gTile/gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou

setup-ubuntu-dock:
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
	gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
	gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
	gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.2
	gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
	gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

setup-gtk-themes:
	sudo add-apt-repository -y ppa:snwh/pulp
	sudo apt-get update

	sudo apt-get install -y paper-icon-theme
	sudo apt-get install -y arc-theme

	rm -rf ${HOME}/.themes/*
	git clone https://github.com/paullinuxthemer/Nextwaita
	mv Nextwaita/Nextwaita-SCALE ${HOME}/.themes
	rm -rf Nextwaita

	gsettings set org.gnome.desktop.interface gtk-theme Nextwaita-SCALE
	gsettings set org.gnome.desktop.interface icon-theme Paper

setup-vagrant:
	sudo apt-get remove -y vagrant
	wget https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb
	sudo dpkg -i vagrant_2.2.4_x86_64.deb
	rm vagrant_2.2.4_x86_64.deb

	sudo apt-get install nfs-kernel-server

setup-ansible:
	pip install ansible==2.7.*

setup-xrandr:
	ln -sf `pwd`/.xprofile ${HOME}/.
