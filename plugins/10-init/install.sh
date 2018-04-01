function install_plug() {
  local plug_dir="${VIM_DIR}/autoload/plug.vim"
  [ -d "$plug_dir" ]  && return
  echo installing plug
  curl -fLo ${VIM_DIR}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_plug
