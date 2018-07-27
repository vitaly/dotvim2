" Description:	k indenter
" Author:	simon garland <simon_garland@gmx.net>
" URL:		http://271828.net/vim/indent/k.vim
" Last Change:	$Date: 2001/09/11 05:33:24 $

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" [-- local settings (must come before aborting the script) --]
setlocal indentexpr=KIndentGet(v:lnum)
setlocal indentkeys=o,O,*<Return>,<Bs>,!^F,<{>,<}>,<[>,<]>

" [-- count indent-increasing '{[' of k line a:lnum --]
fun! <SID>KIndentOpen(lnum)
    return strlen(substitute(getline(a:lnum), '[^{[]\+', '', 'g'))
endfun

" [-- count indent-decreasing ']}' of k line a:lnum --]
fun! <SID>KIndentClose(lnum)
    return strlen(substitute(getline(a:lnum), '[^}\]]\+', '', 'g'))
endfun

" [-- return the sum of indents respecting the syntax of a:lnum --]
fun! <SID>KIndentSum(lnum)
	return <SID>KIndentOpen(a:lnum) - <SID>KIndentClose(a:lnum)
endfun

fun! KIndentGet(lnum)
    " Find a non-empty line above the current line.
	let lnum = prevnonblank(a:lnum - 1)

	" Hit the start of the file, use zero indent.
    if lnum == 0
		return 0
    endif

    let ind = <SID>KIndentSum(lnum)

    return indent(lnum) + (&sw * ind)
endfun

" [-- EOF <runtime>/indent/k.vim --]
