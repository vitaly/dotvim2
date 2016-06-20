
*   <a name=tmux-navigator>[tmux-navigator](http://github.com/christoomey/vim-tmux-navigator) ([top](#top))

    tmux + vim = love

    to change default mappings define:

        let g:tmux_navigator_no_mappings = 1

    The default mappings are:

        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
        nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

    TBD: make this configurable through ask.sh
