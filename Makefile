install:
	ln -fs $(CURDIR)/bash/bashrc $(HOME)/.bashrc
	ln -fs $(CURDIR)/bash/bash_profile $(HOME)/.bash_profile
	ln -fs $(CURDIR)/git/gitconfig $(HOME)/.gitconfig
	ln -fs $(CURDIR)/git/gitignore $(HOME)/.gitignore
	ln -fs $(CURDIR)/ruby/gemrc $(HOME)/.gemrc
	ln -fs $(CURDIR)/vim/vimrc $(HOME)/.vimrc
