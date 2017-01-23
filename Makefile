install:
	git submodule init
	ln -fs $(CURDIR)/home/profile $(HOME)/.profile
	ln -fs $(CURDIR)/home/bashrc $(HOME)/.bashrc
	ln -fs $(CURDIR)/home/bash_profile $(HOME)/.bash_profile
	ln -fs $(CURDIR)/home/gitconfig $(HOME)/.gitconfig
	ln -fs $(CURDIR)/home/gitignore $(HOME)/.gitignore
	ln -fs $(CURDIR)/home/gemrc $(HOME)/.gemrc
	ln -fs $(CURDIR)/home/vimrc $(HOME)/.vimrc
	rm -rf $(HOME)/.vim && ln -fs $(CURDIR)/home/vim $(HOME)/.vim
	rm -rf $(HOME)/.nodenv && ln -fs $(CURDIR)/home/nodenv $(HOME)/.nodenv
	rm -rf $(HOME)/.rbenv && ln -fs $(CURDIR)/home/rbenv $(HOME)/.rbenv
