desc <<END
VIM 'concealing' feature allows hiding stretches of text, based on syntax
highlighting.  It also allows replacing a stretch of text by a character.

If you answer 'yes', we will replace 'function' with 'ƒ', 'NaN' with "ℕ", etc.

You can see the complete configuration in
plugins/60-lang/plugins/javascript/plugins/conceal/files/vimrc.before
END

ask_bool js_conceal "Configure 'concealing' for javascript" n
