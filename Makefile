export VIM_DIR ?= ..

generate:
	@bin/generate.sh

reconfigure:
	@bin/generate.sh -f

clean:
	rm -rf ${VIM_DIR}/dein

reinstall: clean generate
	vim

update:
	vim +'call dein#update()'
