function init_git()
{
  git init
  git add .
  git -c user.name=dotvim -c user.email=vitaly@astrails.com commit -m initial
}

function check_git()
{
  if ask_bool init_git "initialize git?" y; then
    if [ ! -d "$VIM_DIR/.git" ]; then
      (cd "$VIM_DIR"; init_git)
    fi
  fi
}

check_git
