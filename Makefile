export VIM_DIR ?= dist

configure:
	@bin/generate.sh

vconfigure:
	@bin/generate.sh -v

reconfigure:
	@bin/generate.sh -f

edit: ${VIM_DIR}/.config
	@vim ${VIM_DIR}/.config

install: configure
	vim +'PlugInstall'

clean:
	@you can manually remove directory ${VIM_DIR}/bundle

update:
	vim +'PlugUpdate'

upgrade:
	vim +'PlugUpgrade'

.PHONY: configure reconfigure install clean reinstall update

# YCM_DIR = ${VIM_DIR}/dein/repos/github.com/Valloric/YouCompleteMe

# ${YCM_DIR}:
	# mkdir -p ${VIM_DIR}/dein/repos/github.com/Valloric
	# cd ${VIM_DIR}/dein/repos/github.com/Valloric
	# git clone https://github.com/Valloric/YouCompleteMe.git YouCompleteMe

# ycm-git: ${YCM_DIR}
	# cd $< && git submodule update --init --recursive

# ycm-install: ycm-git
	# cd ${YCM_DIR} && ./install.py --clang-completer --tern-completer

# completion: ycm-install

# .PHONY: ycm-git ycm-install completion
