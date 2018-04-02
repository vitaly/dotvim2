function install_plug() {
  local plug_file="${VIM_DIR}/autoload/plug.vim"
  [ -f "$plug_file" ]  && return
  echo installing plug
  curl -fLo ${VIM_DIR}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_plug
