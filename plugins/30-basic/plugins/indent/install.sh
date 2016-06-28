desc "What plugin to use to visualize indentation level:"

enum guides "- Indent-Guides"
enum lines " - Yggdroot/indentLine"
enum - "     - none"

ask enum visual_indent "indentation plugin?" 2

_copy_files "$(this_dir)/$visual_indent"
