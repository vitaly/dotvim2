while [ -z "`which fzf`" ]; do
  cat <<END
FZF not found. please install it.
On OSX using brew:
  > brew install fzf
  > /usr/local/opt/fzf/install --all
or manually:
  > git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  > ~/.fzf/install

Press ENTER to retry
END
  read
  hash -r
done

if [ -d ~/.fzf ]; then
  FZF_DIR=~/.fzf
elif [ -d /usr/local/opt/fzf/ ]; then
  FZF_DIR=/usr/local/opt/fzf/
fi

if [ -d "$FZF_DIR" ]; then
  echo "set rtp+=$FZF_DIR" | append_to_file "vimrc.before" "$(this_file)"
fi

if [ -z "$FZF_DEFAULT_COMMAND" -a -n "`which ag`" ]; then
  red
  cat <<END

***********************************************************************

Consider setting FZF_DEFAULT_COMMAND environment variable:

  export FZF_DEFAULT_COMMAND="ag --follow --nocolor --nogroup -g ''"

***********************************************************************

END
  nc
fi
