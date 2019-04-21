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
	setup-xrandr

init:
	sudo apt-get update
	sudo apt-get install -y git unzip curl

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

setup-xrandr:
	ln -sf `pwd`/.xprofile ${HOME}/.
