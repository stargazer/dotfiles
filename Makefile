setup: \
	init \
	setup-profile \
	setup-bashrc \
	setup-zsh \
	setup-git \
	setup-fonts \
	setup-terminator \
	setup-tmux \
	setup-vim \
	setup-gnome-shell-extensions \
	setup-ubuntu-dock \
	setup-gtk-themes \
	disable-wayland

init:
	sudo apt-get update
	sudo apt-get install -y git unzip curl python-pip

setup-profile:
	ln -sf `pwd`/.profile ${HOME}/.

setup-bashrc:
	# Why is this relevant, if i'm using zsh?
	# I'm actually only using zsh when running Terminator. When, for example, opening a terminal using Alt-Fn,
	# that terminalI runs the bash shell. And in that base, it does make sense to a sane configuration for bash.
	ln -sf `pwd`/.bashrc ${HOME}/.

setup-zsh:
	sudo apt-get install -y zsh
	curl -sL git.io/antibody | sh -s

	ln -sf `pwd`/zsh/.zshrc ${HOME}/.
	ln -sf `pwd`/zsh/.zsh_plugins.txt ${HOME}/.

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

	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Medium 9'
	gsettings set org.gnome.desktop.interface font-name 'Ubuntu 10'
	gsettings set org.gnome.desktop.interface document-font-name 'Sans 9'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 10'

	gsettings set org.gnome.desktop.interface text-scaling-factor 1
	gsettings set org.gnome.settings-daemon.plugins.xsettings hinting slight

	gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/ShellShowsAppMenu': <1>}"

	# If the monitor is in landscape mode
	gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing rgba
	gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order rgb

	# If the monitor is in portrait mode
	# gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing rgba
	# gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order vrgb

setup-font-rendering:
	# Fix font rendering
	# See https://humdi.net/wiki/tips/how-to-fix-blurry-font-rendering-in-ubuntu
	grep -qxF 'FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:no-stem-darkening=1 autofitter:warping=1"' /etc/environment || echo 'FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:no-stem-darkening=1 autofitter:warping=1"' | sudo tee -a /etc/environment

setup-terminator:
	sudo apt-get install -y terminator
	mkdir -p ${HOME}/.config/terminator
	ln -sf `pwd`/terminator/config ${HOME}/.config/terminator/.

setup-tmux:
	sudo apt-get install -y tmux
	ln -sf `pwd`/tmux/.tmux ${HOME}/.
	ln -sf `pwd`/tmux/.tmux.conf ${HOME}/.

setup-vim:
	sudo apt-get install -y vim ctags

	ln -sf `pwd`/vim/.vim ${HOME}/.
	ln -sf `pwd`/vim/.vimrc  ${HOME}/.

setup-gnome-shell-extensions:
	sudo apt-get install -y gnome-tweaks

	rm -rf ${HOME}/.local/share/gnome-shell/extensions/*
	mkdir -p ${HOME}/.local/share/gnome-shell/extensions
	git clone https://github.com/gTile/gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou

	sudo apt install -y gnome-extension-ubuntu-dock gnome-shell-desktop-icons gnome-shell-extension-appindicator

setup-ubuntu-dock:
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
	gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position TOP
	gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
	gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.8
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

disable-wayland:
	# Disable Wayland in order to enable the X server
	# Tools like `barrier` don't work with Wayland
	sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm3/custom.conf
