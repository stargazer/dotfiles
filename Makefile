setup: \
	init \
	setup-profile \
	setup-bashrc \
	setup-git \
	setup-source-code-pro-fonts \
	setup-kitty \
	setup-zsh \
	setup-antibody \
	setup-tmux \
	setup-vim

init:
	sudo apt-get update

setup-profile:
	ln -sf `pwd`/.profile ${HOME}/.

setup-bashrc:
	ln -sf `pwd`/.bashrc ${HOME}/.

setup-git:
	sudo apt-get install git

setup-source-code-pro-fonts:
	rm -rf ${HOME}/.fonts/adobe-fonts
	git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ${HOME}/.fonts/adobe-fonts/source-code-pro
	fc-cache -f -v ${HOME}/.fonts/adobe-fonts/source-code-pro

setup-kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	ln -sf ${HOME}/.local/kitty.app/bin/kitty ${HOME}/.local/bin/.
	ln -sf `pwd`/kitty/kitty.desktop ${HOME}/.local/share/applications/.

	ln -sf `pwd`/kitty/kitty.conf ${HOME}/.config/kitty/.
	ln -sf `pwd`/kitty/kitty.startup_session ${HOME}/.config/kitty/.

setup-zsh:
	sudo apt-get install -y zsh fonts-powerline
	ln -sf `pwd`/zsh/.zshrc ${HOME}/.
	ln -sf `pwd`/zsh/.zsh_plugins.txt ${HOME}/.

setup-antibody:
	curl -sL git.io/antibody | sh -s

setup-tmux:
	sudo apt-get install tmux
	ln -sf `pwd`/tmux/.tmux ${HOME}/.
	ln -sf `pwd`/tmux/.tmux.conf ${HOME}/.
	ln -sf `pwd`/scripts/tmux-smartpr.sh ${HOME}/.

setup-vim:
	sudo apt-get install vim
	ln -sf `pwd`/vim/.vim ${HOME}/.
	ln -sf `pwd`/vim/.vimrc  ${HOME}/.


