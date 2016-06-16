function install_dein()
{
  mkdir -p ${VIM_DIR}/dein/repos

  local d=${VIM_DIR}/dein/repos/github.com/Shougo/dein.vim
  [ -d $d ] && return

  mkdir -p $d

  echo installing dein
  git clone https://github.com/Shougo/dein.vim $d
}

install_dein
