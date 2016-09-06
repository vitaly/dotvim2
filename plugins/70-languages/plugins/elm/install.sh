desc <<END
I found 2 elm plugins for vim, still hasn't decided which one is the best ;)

This lets you switch easily
END

enum lambdatoast "- use lambdatoast/elm.vim plugin"
enum ElmCast "    - use ElmCast/elm-vim plugin"

ask enum elm_plugin "elm plugin?"

copy_files "$(this_dir)/$elm_plugin"
