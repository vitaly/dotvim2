function init_git()
{
  git init
  git add .
  git -c user.name=dotvim -c user.email=vitaly@astrails.com commit -m initial
}

if [ ! -d "$VIM_DIR/.git" ]; then
  (cd "$VIM_DIR"; init_git)
fi
