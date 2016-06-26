enum 'guides|lines|-'
desc <<END
What plugin to use to visualize indentation level:

guides : Indent-Guides
lines  : Yggdroot/indentLine
-      : none
END
ask enum visual_indent "Your choice?" lines

case $visual_indent in
  guides|lines)
    copy_files "$(this_dir)/$visual_indent"
    ;;
  *) die "unknown indent option $visual_indent";;
esac
