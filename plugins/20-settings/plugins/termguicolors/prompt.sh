desc <<END
If your terminal is ISO-8613-3 compatible you can use gui colors, e.g.
guilfg/guilbg of color themes instead of ctermbg/ctermfg.

You can check by running ":echo has('termguicolors')<CR>".

Answer No if you do not want to use gui colors even on a comnpatible terminal.
END

ask_bool set_termguicolors 'use terminal gui colors (on compatible terminals)?' y
