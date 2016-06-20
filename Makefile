export VIM_DIR ?= dist

configure:
	@bin/generate.sh

reconfigure:
	@bin/generate.sh -f

install: configure
	vim +'call dein#install()'

clean:
	rm -rf ${VIM_DIR}/dein

reinstall: clean generate
	vim

update:
	vim +'call dein#update()'

.PHONY: configure reconfigure install clean reinstall update

YCM_DIR = ${VIM_DIR}/dein/repos/github.com/Valloric/YouCompleteMe

${YCM_DIR}:
	mkdir -p ${VIM_DIR}/dein/repos/github.com/Valloric:
	cd ${VIM_DIR}/dein/repos/github.com/Valloric
	git clone https://github.com/Valloric/YouCompleteMe.git YouCompleteMe

ycm-git: ${YCM_DIR}
	cd $<
	git submodule update --init --recursive

ycm-install: ycm-git
	cd ${YCM_DIR} && ./install.py --clang-completer

completion: ycm-install

.PHONY: ycm-git ycm-install completion
