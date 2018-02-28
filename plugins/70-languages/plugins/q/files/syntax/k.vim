" Vim syntax file
" Language: k
" Maintainer: Simon Garland <simon@kx.com>
" Last Change: 2011.04.04

" Remove any old syntax stuff hanging around
syn clear

if !exists("main_syntax")
 let main_syntax = 'k'
endif

" sync, even k functions can ramble..
if main_syntax == 'k'
 if exists("k_minlines")
  exec "syn sync minlines=" . k_minlines
 else
  syn sync minlines=100
 endif
endif   

setlocal comments=:/,://

" exclude _ in names for k
syn case match
set iskeyword=@,^_,48-57,.

" Operator
syn match kOperator /[/\']/
syn match kOperator /[/\']:/

" highlight Todo and friends in comments
syn keyword kTodo TODO FIXME FIX XXX NOTE GOTCHA contained

" Exit
syn match kExit "^\\\\" contained

" Comments, trailing, wholeline and multi-line
syn region kComment start="^\s*/" end="$" keepend excludenl contains=kTodo
syn region kComment start="\s/" end="$" keepend excludenl contains=kTodo
" multiline comment, bare \ means rest of file is comment
syn region kComment start="^\\\\*\s*$" end="\%$" contains=kTodo,kExit
" multiline comment start / .. end \ 
syn region kComment start="^/\s*$" end="^\\\s*$" keepend excludenl contains=kTodo
" do not emphasised comment
" syn region kSpecialComment start="^\s*//" end="$" keepend excludenl contains=kTodo
" syn region kSpecialComment start="\s//" end="$" keepend excludenl contains=kTodo

" Numbers, dates etc 
syn match kNumber "-\=\(\d\+\)\=\.\d*\(e[+-]\=\d\+\)\=[ef]\="
syn match kNumber "-\=\d\+\(e[+-]\=\d\+\)\=[ijhfe]\="
" Timestamp
syn match kNumber "\d\{4}\.[01]\d\.[0123]\dT[012]\d\:[012345]\d:[012345]\d\(\.\d\+\)\="
" Month 
syn match kNumber "\d\{4}\.[01]\dm"
" Time
syn match kNumber "[012]\d:[012345]\d\(:[012345]\d\(\.\d\+\)\=\)\="
" Hex
syn match kNumber "0x\x*"

" special functions 0: 1: 2: 
syn match kFunction "\<[012]:"

" Boolean
syn match kBoolean /[01]\+b/

" generic .?.* match - single letter reserved namespace
" syn match kFunction /\.\a\.\a[a-zA-Z0-9]*/

"Statement separator
syn match kSeparator ";"

" all the nulls and INFs 
syn keyword kSpecial 0N 0W 0n 0w
syn match kSpecial "-0[wW]"
syn match kSpecial "-0W[defhijmnptuvz]"
syn match kSpecial "0[NW][defghijmnptuvz]"
" GUIDs
syn match kSpecial "[-[:xdigit:]]\{36}"

" Identifiers not caught elsewhere 
syn match kGlobal "\<\u[A-Z0-9]*\>"

syn match kIdentifier "\<[a-zA-Z\.][a-zA-Z0-9\.]*\>"

" modified from John Gilmore's original script
" http://www.vim.org/scripts/script.php?script_id=1230

" lowkey initial ([ and {
hi link level16c kIdentifier

if &bg == "dark"
	hi level1c ctermfg=magenta guifg=green1 
	hi level2c ctermfg=red guifg=springgreen1 
	hi level3c ctermfg=yellow guifg=cyan1
	hi level4c ctermfg=green guifg=slateblue1 
	hi level5c ctermfg=cyan guifg=magenta1 
	hi level6c ctermfg=magenta guifg=purple1 
	hi level7c ctermfg=red guifg=red1
	hi level8c ctermfg=yellow guifg=orange1 
	hi level9c ctermfg=green guifg=yellow1 
	hi level10c ctermfg=cyan guifg=greenyellow 
	hi level11c ctermfg=magenta guifg=green1
 	hi level12c ctermfg=cyan guifg=magenta1
	hi level13c ctermfg=yellow guifg=cyan1 
	hi level14c ctermfg=red guifg=springgreen1 
	hi level15c ctermfg=green guifg=slateblue1 
"	hi level16c ctermfg=magenta guifg=purple1 
else
	hi level1c ctermfg=darkmagenta guifg=olivedrab4 
	hi level2c ctermfg=red guifg=green4 
	hi level3c ctermfg=darkyellow guifg=paleturquoise3
	hi level4c ctermfg=darkgreen guifg=deepskyblue4 
	hi level5c ctermfg=blue guifg=darkslateblue 
	hi level6c ctermfg=darkmagenta guifg=darkviolet 
	hi level7c ctermfg=red guifg=red3
	hi level8c ctermfg=darkyellow guifg=orangered3 
	hi level9c ctermfg=darkgreen guifg=orange2 
	hi level10c ctermfg=blue guifg=yellow3 
	hi level11c ctermfg=darkmagenta guifg=olivedrab4
	hi level12c ctermfg=red guifg=green4 
	hi level13c ctermfg=darkyellow guifg=paleturquoise3 
	hi level14c ctermfg=darkgreen guifg=deepskyblue4 
	hi level15c ctermfg=blue guifg=darkslateblue
"	hi level16c ctermfg=darkmagenta guifg=darkviolet 
endif
syn region level1 matchgroup=level1c start=/\[/ end=/\]/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level2 matchgroup=level2c start=/\[/ end=/\]/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level3 matchgroup=level3c start=/\[/ end=/\]/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level4 matchgroup=level4c start=/\[/ end=/\]/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level5 matchgroup=level5c start=/\[/ end=/\]/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level6 matchgroup=level6c start=/\[/ end=/\]/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level7 matchgroup=level7c start=/\[/ end=/\]/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level8 matchgroup=level8c start=/\[/ end=/\]/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level9 matchgroup=level9c start=/\[/ end=/\]/ contains=TOP,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level10 matchgroup=level10c start=/\[/ end=/\]/ contains=TOP,level10,level11,level12,level13,level14,level15,level16,NoInParens
syn region level11 matchgroup=level11c start=/\[/ end=/\]/ contains=TOP,level11,level12,level13,level14,level15,level16,NoInParens
syn region level12 matchgroup=level12c start=/\[/ end=/\]/ contains=TOP,level12,level13,level14,level15,level16,NoInParens
syn region level13 matchgroup=level13c start=/\[/ end=/\]/ contains=TOP,level13,level14,level15,level16,NoInParens
syn region level14 matchgroup=level14c start=/\[/ end=/\]/ contains=TOP,level14,level15,level16,NoInParens
syn region level15 matchgroup=level15c start=/\[/ end=/\]/ contains=TOP,level15,level16,NoInParens
syn region level16 matchgroup=level16c start=/\[/ end=/\]/ contains=TOP,level16,NoInParens

" modified from John Gilmore's original script
" http://www.vim.org/scripts/script.php?script_id=1230
"
" lowkey initial ([ and {
hi link levelp16c kIdentifier

if &bg == "dark"
	hi levelp1c ctermfg=magenta guifg=green1 
	hi levelp2c ctermfg=red guifg=springgreen1 
	hi levelp3c ctermfg=yellow guifg=cyan1
	hi levelp4c ctermfg=green guifg=slateblue1 
	hi levelp5c ctermfg=cyan guifg=magenta1 
	hi levelp6c ctermfg=magenta guifg=purple1 
	hi levelp7c ctermfg=red guifg=red1
	hi levelp8c ctermfg=yellow guifg=orange1 
	hi levelp9c ctermfg=green guifg=yellow1 
	hi levelp10c ctermfg=cyan guifg=greenyellow 
	hi levelp11c ctermfg=magenta guifg=green1
	hi levelp12c ctermfg=red guifg=springgreen1 
	hi levelp13c ctermfg=yellow guifg=cyan1 
	hi levelp14c ctermfg=green guifg=slateblue1 
	hi levelp15c ctermfg=cyan guifg=magenta1
"	hi levelp16c ctermfg=magenta guifg=purple1 
else
	hi levelp1c ctermfg=darkmagenta guifg=olivedrab4 
	hi levelp2c ctermfg=red guifg=green4 
	hi levelp3c ctermfg=darkyellow guifg=paleturquoise3
	hi levelp4c ctermfg=darkgreen guifg=deepskyblue4 
	hi levelp5c ctermfg=blue guifg=darkslateblue 
	hi levelp6c ctermfg=darkmagenta guifg=darkviolet 
	hi levelp7c ctermfg=red guifg=red3
	hi levelp8c ctermfg=darkyellow guifg=orangered3 
	hi levelp9c ctermfg=darkgreen guifg=orange2 
	hi levelp10c ctermfg=blue guifg=yellow3 
	hi levelp11c ctermfg=darkmagenta guifg=olivedrab4
	hi levelp12c ctermfg=red guifg=green4 
	hi levelp13c ctermfg=darkyellow guifg=paleturquoise3 
	hi levelp14c ctermfg=darkgreen guifg=deepskyblue4 
	hi levelp15c ctermfg=blue guifg=darkslateblue
"	hi levelp16c ctermfg=darkmagenta guifg=darkviolet 
endif
syn region levelp1 matchgroup=levelp1c start=/(/ end=/)/ contains=TOP,levelp1,levelp2,levelp3,levelp4,levelp5,levelp6,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp2 matchgroup=levelp2c start=/(/ end=/)/ contains=TOP,levelp2,levelp3,levelp4,levelp5,levelp6,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp3 matchgroup=levelp3c start=/(/ end=/)/ contains=TOP,levelp3,levelp4,levelp5,levelp6,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp4 matchgroup=levelp4c start=/(/ end=/)/ contains=TOP,levelp4,levelp5,levelp6,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp5 matchgroup=levelp5c start=/(/ end=/)/ contains=TOP,levelp5,levelp6,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp6 matchgroup=levelp6c start=/(/ end=/)/ contains=TOP,levelp6,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp7 matchgroup=levelp7c start=/(/ end=/)/ contains=TOP,levelp7,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp8 matchgroup=levelp8c start=/(/ end=/)/ contains=TOP,levelp8,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp9 matchgroup=levelp9c start=/(/ end=/)/ contains=TOP,levelp9,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp10 matchgroup=levelp10c start=/(/ end=/)/ contains=TOP,levelp10,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp11 matchgroup=levelp11c start=/(/ end=/)/ contains=TOP,levelp11,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp12 matchgroup=levelp12c start=/(/ end=/)/ contains=TOP,levelp12,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp13 matchgroup=levelp13c start=/(/ end=/)/ contains=TOP,levelp13,levelp14,levelp15,levelp16,NoInParens
syn region levelp14 matchgroup=levelp14c start=/(/ end=/)/ contains=TOP,levelp14,levelp15,levelp16,NoInParens
syn region levelp15 matchgroup=levelp15c start=/(/ end=/)/ contains=TOP,levelp15,levelp16,NoInParens
syn region levelp16 matchgroup=levelp16c start=/(/ end=/)/ contains=TOP,levelp16,NoInParens

" modified from John Gilmore's original script
" http://www.vim.org/scripts/script.php?script_id=1230
"
" lowkey initial ([ and {
hi link crly16c kIdentifier

if &bg == "dark"
	hi crly1c ctermfg=magenta guifg=green1 
	hi crly2c ctermfg=red guifg=springgreen1 
	hi crly3c ctermfg=yellow guifg=cyan1
	hi crly4c ctermfg=green guifg=slateblue1 
	hi crly5c ctermfg=cyan guifg=magenta1 
	hi crly6c ctermfg=magenta guifg=purple1 
	hi crly7c ctermfg=red guifg=red1
	hi crly8c ctermfg=yellow guifg=orange1 
	hi crly9c ctermfg=green guifg=yellow1 
	hi crly10c ctermfg=cyan guifg=greenyellow 
	hi crly11c ctermfg=magenta guifg=green1
	hi crly12c ctermfg=red guifg=springgreen1 
	hi crly13c ctermfg=yellow guifg=cyan1 
	hi crly14c ctermfg=green guifg=slateblue1 
	hi crly15c ctermfg=cyan guifg=magenta1
"	hi crly16c ctermfg=magenta guifg=purple1 
else
	hi crly1c ctermfg=darkmagenta guifg=olivedrab4 
	hi crly2c ctermfg=red guifg=green4 
	hi crly3c ctermfg=darkyellow guifg=paleturquoise3
	hi crly4c ctermfg=darkgreen guifg=deepskyblue4 
	hi crly5c ctermfg=blue guifg=darkslateblue 
	hi crly6c ctermfg=darkmagenta guifg=darkviolet 
	hi crly7c ctermfg=red guifg=red3
	hi crly8c ctermfg=darkyellow guifg=orangered3 
	hi crly9c ctermfg=darkgreen guifg=orange2 
	hi crly10c ctermfg=blue guifg=yellow3 
	hi crly11c ctermfg=darkmagenta guifg=olivedrab4
	hi crly12c ctermfg=red guifg=green4 
	hi crly13c ctermfg=darkyellow guifg=paleturquoise3 
	hi crly14c ctermfg=darkgreen guifg=deepskyblue4 
	hi crly15c ctermfg=blue guifg=darkslateblue
"	hi crly16c ctermfg=darkmagenta guifg=darkviolet 
endif
syn region crly1 matchgroup=crly1c start=/{/ end=/}/ contains=TOP,crly1,crly2,crly3,crly4,crly5,crly6,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly2 matchgroup=crly2c start=/{/ end=/}/ contains=TOP,crly2,crly3,crly4,crly5,crly6,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly3 matchgroup=crly3c start=/{/ end=/}/ contains=TOP,crly3,crly4,crly5,crly6,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly4 matchgroup=crly4c start=/{/ end=/}/ contains=TOP,crly4,crly5,crly6,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly5 matchgroup=crly5c start=/{/ end=/}/ contains=TOP,crly5,crly6,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly6 matchgroup=crly6c start=/{/ end=/}/ contains=TOP,crly6,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly7 matchgroup=crly7c start=/{/ end=/}/ contains=TOP,crly7,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly8 matchgroup=crly8c start=/{/ end=/}/ contains=TOP,crly8,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly9 matchgroup=crly9c start=/{/ end=/}/ contains=TOP,crly9,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly10 matchgroup=crly10c start=/{/ end=/}/ contains=TOP,crly10,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly11 matchgroup=crly11c start=/{/ end=/}/ contains=TOP,crly11,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly12 matchgroup=crly12c start=/{/ end=/}/ contains=TOP,crly12,crly13,crly14,crly15,crly16,NoInParens
syn region crly13 matchgroup=crly13c start=/{/ end=/}/ contains=TOP,crly13,crly14,crly15,crly16,NoInParens
syn region crly14 matchgroup=crly14c start=/{/ end=/}/ contains=TOP,crly14,crly15,crly16,NoInParens
syn region crly15 matchgroup=crly15c start=/{/ end=/}/ contains=TOP,crly15,crly16,NoInParens
syn region crly16 matchgroup=crly16c start=/{/ end=/}/ contains=TOP,crly16,NoInParens

" my local groups
syn keyword kLocal a
syn keyword kLocal b
syn keyword kLocal c
syn keyword kLocal d
syn keyword kLocal e
syn keyword kLocal f
syn keyword kLocal g
syn keyword kLocal h
syn keyword kLocal i
syn keyword kLocal j
syn keyword kLocal k
syn keyword kLocal l
syn keyword kLocal m
syn keyword kLocal n
syn keyword kLocal o
syn keyword kLocal p
syn keyword kLocal q
syn keyword kLocal r
syn keyword kLocal s
syn keyword kLocal t
syn keyword kLocal u
syn keyword kLocal v
syn keyword kLocal w
syn keyword kLocal x
syn keyword kLocal y
syn keyword kLocal z
syn keyword kLocal aa
syn keyword kLocal ab
syn keyword kLocal ac
syn keyword kLocal ad
syn keyword kLocal ae
syn keyword kLocal af
syn keyword kLocal ag
syn keyword kLocal ah
syn keyword kLocal ai
syn keyword kLocal ak
syn keyword kLocal al
syn keyword kLocal am
syn keyword kLocal an
syn keyword kLocal ao
syn keyword kLocal ap
syn keyword kLocal aq
syn keyword kLocal ar
syn keyword kLocal as
syn keyword kLocal at
syn keyword kLocal au
syn keyword kLocal av
syn keyword kLocal aw
syn keyword kLocal ax
syn keyword kLocal ay
syn keyword kLocal az
syn keyword kLocal ba
syn keyword kLocal bb
syn keyword kLocal bc
syn keyword kLocal bd
syn keyword kLocal be
syn keyword kLocal bf
syn keyword kLocal bg
syn keyword kLocal bh
syn keyword kLocal bi
syn keyword kLocal bj
syn keyword kLocal bk
syn keyword kLocal bl
syn keyword kLocal bm
syn keyword kLocal bn
syn keyword kLocal bo
syn keyword kLocal bp
syn keyword kLocal bq
syn keyword kLocal br
syn keyword kLocal bs
syn keyword kLocal bt
syn keyword kLocal bu
syn keyword kLocal bv
syn keyword kLocal bw
syn keyword kLocal bx
syn keyword kLocal bz
syn keyword kLocal ca
syn keyword kLocal cb
syn keyword kLocal cc
syn keyword kLocal cd
syn keyword kLocal ce
syn keyword kLocal cf
syn keyword kLocal cg
syn keyword kLocal ch
syn keyword kLocal ci
syn keyword kLocal cj
syn keyword kLocal ck
syn keyword kLocal cl
syn keyword kLocal cm
syn keyword kLocal cn
syn keyword kLocal co
syn keyword kLocal cp
syn keyword kLocal cq
syn keyword kLocal cr
syn keyword kLocal cs
syn keyword kLocal ct
syn keyword kLocal cu
syn keyword kLocal cv
syn keyword kLocal cw
syn keyword kLocal cx
syn keyword kLocal cy
syn keyword kLocal cz
syn keyword kLocal da
syn keyword kLocal db
syn keyword kLocal dc
syn keyword kLocal dd
syn keyword kLocal de
syn keyword kLocal df
syn keyword kLocal dg
syn keyword kLocal dh
syn keyword kLocal di
syn keyword kLocal dj
syn keyword kLocal dk
syn keyword kLocal dl
syn keyword kLocal dm
syn keyword kLocal dn
syn keyword kLocal dp
syn keyword kLocal dq
syn keyword kLocal dr
syn keyword kLocal ds
syn keyword kLocal dt
syn keyword kLocal du
syn keyword kLocal dv
syn keyword kLocal dw
syn keyword kLocal dx
syn keyword kLocal dy
syn keyword kLocal dz
syn keyword kLocal ea
syn keyword kLocal eb
syn keyword kLocal ec
syn keyword kLocal ed
syn keyword kLocal ee
syn keyword kLocal ef
syn keyword kLocal eg
syn keyword kLocal eh
syn keyword kLocal ei
syn keyword kLocal ek
syn keyword kLocal el
syn keyword kLocal em
syn keyword kLocal en
syn keyword kLocal eo
syn keyword kLocal ep
syn keyword kLocal eq
syn keyword kLocal er
syn keyword kLocal es
syn keyword kLocal et
syn keyword kLocal eu
syn keyword kLocal ev
syn keyword kLocal ew
syn keyword kLocal ex
syn keyword kLocal ey
syn keyword kLocal ez
syn keyword kLocal fa
syn keyword kLocal fb
syn keyword kLocal fc
syn keyword kLocal fd
syn keyword kLocal fe
syn keyword kLocal ff
syn keyword kLocal fg
syn keyword kLocal fh
syn keyword kLocal fi
syn keyword kLocal fj
syn keyword kLocal fk
syn keyword kLocal fl
syn keyword kLocal fm
syn keyword kLocal fn
syn keyword kLocal fo
syn keyword kLocal fp
syn keyword kLocal fq
syn keyword kLocal fr
syn keyword kLocal fs
syn keyword kLocal ft
syn keyword kLocal fu
syn keyword kLocal fv
syn keyword kLocal fw
syn keyword kLocal fx
syn keyword kLocal fy
syn keyword kLocal fz
syn keyword kLocal ga
syn keyword kLocal gb
syn keyword kLocal gc
syn keyword kLocal gd
syn keyword kLocal ge
syn keyword kLocal gf
syn keyword kLocal gg
syn keyword kLocal gh
syn keyword kLocal gi
syn keyword kLocal gj
syn keyword kLocal gk
syn keyword kLocal gl
syn keyword kLocal gm
syn keyword kLocal gn
syn keyword kLocal go
syn keyword kLocal gp
syn keyword kLocal gq
syn keyword kLocal gr
syn keyword kLocal gs
syn keyword kLocal gt
syn keyword kLocal gu
syn keyword kLocal gv
syn keyword kLocal gw
syn keyword kLocal gx
syn keyword kLocal gy
syn keyword kLocal gz
syn keyword kLocal ha
syn keyword kLocal hb
syn keyword kLocal hc
syn keyword kLocal hd
syn keyword kLocal he
syn keyword kLocal hf
syn keyword kLocal hg
syn keyword kLocal hh
syn keyword kLocal hi
syn keyword kLocal hj
syn keyword kLocal hk
syn keyword kLocal hl
syn keyword kLocal hm
syn keyword kLocal hn
syn keyword kLocal ho
syn keyword kLocal hp
syn keyword kLocal hq
syn keyword kLocal hr
syn keyword kLocal hs
syn keyword kLocal ht
syn keyword kLocal hu
syn keyword kLocal hv
syn keyword kLocal hw
syn keyword kLocal hx
syn keyword kLocal hy
syn keyword kLocal hz
syn keyword kLocal ia
syn keyword kLocal ib
syn keyword kLocal ic
syn keyword kLocal id
syn keyword kLocal ie
syn keyword kLocal ig
syn keyword kLocal ih
syn keyword kLocal ii
syn keyword kLocal ik
syn keyword kLocal il
syn keyword kLocal im
syn keyword kLocal io
syn keyword kLocal ip
syn keyword kLocal iq
syn keyword kLocal ir
syn keyword kLocal is
syn keyword kLocal it
syn keyword kLocal iu
syn keyword kLocal iv
syn keyword kLocal iw
syn keyword kLocal ix
syn keyword kLocal iy
syn keyword kLocal iz
syn keyword kLocal ja
syn keyword kLocal jb
syn keyword kLocal jc
syn keyword kLocal jd
syn keyword kLocal je
syn keyword kLocal jf
syn keyword kLocal jg
syn keyword kLocal jh
syn keyword kLocal ji
syn keyword kLocal jj
syn keyword kLocal kj 
syn keyword kLocal jl
syn keyword kLocal jm
syn keyword kLocal jn
syn keyword kLocal jo
syn keyword kLocal jp
syn keyword kLocal jq
syn keyword kLocal jr
syn keyword kLocal js
syn keyword kLocal jt
syn keyword kLocal ju
syn keyword kLocal jv
syn keyword kLocal jw
syn keyword kLocal jx
syn keyword kLocal jy
syn keyword kLocal jz
syn keyword kLocal ka
syn keyword kLocal kb
syn keyword kLocal kc
syn keyword kLocal kd
syn keyword kLocal ke
syn keyword kLocal kf
syn keyword kLocal kg
syn keyword kLocal kh
syn keyword kLocal ki
syn keyword kLocal kj
syn keyword kLocal kk
syn keyword kLocal kl
syn keyword kLocal km
syn keyword kLocal kn
syn keyword kLocal ko
syn keyword kLocal kp
syn keyword kLocal kq
syn keyword kLocal kr
syn keyword kLocal ks
syn keyword kLocal kt
syn keyword kLocal ku
syn keyword kLocal kv
syn keyword kLocal kw
syn keyword kLocal kx
syn keyword kLocal ky
syn keyword kLocal kz
syn keyword kLocal la
syn keyword kLocal lb
syn keyword kLocal lc
syn keyword kLocal ld
syn keyword kLocal le
syn keyword kLocal lf
syn keyword kLocal lg
syn keyword kLocal lh
syn keyword kLocal li
syn keyword kLocal lk
syn keyword kLocal ll
syn keyword kLocal lm
syn keyword kLocal ln
syn keyword kLocal lo
syn keyword kLocal lp
syn keyword kLocal lq
syn keyword kLocal lr
syn keyword kLocal ls
syn keyword kLocal lt
syn keyword kLocal lu
syn keyword kLocal lv
syn keyword kLocal lw
syn keyword kLocal lx
syn keyword kLocal ly
syn keyword kLocal lz
syn keyword kLocal ma
syn keyword kLocal mb
syn keyword kLocal mc
syn keyword kLocal md
syn keyword kLocal me
syn keyword kLocal mf
syn keyword kLocal mg
syn keyword kLocal mh
syn keyword kLocal mi
syn keyword kLocal mj
syn keyword kLocal mk
syn keyword kLocal ml
syn keyword kLocal mm
syn keyword kLocal mn
syn keyword kLocal mo
syn keyword kLocal mp
syn keyword kLocal mq
syn keyword kLocal mr
syn keyword kLocal ms
syn keyword kLocal mt
syn keyword kLocal mu
syn keyword kLocal mv
syn keyword kLocal mw
syn keyword kLocal mx
syn keyword kLocal my
syn keyword kLocal mz
syn keyword kLocal na
syn keyword kLocal nb
syn keyword kLocal nc
syn keyword kLocal nd
syn keyword kLocal ne
syn keyword kLocal nf
syn keyword kLocal ng
syn keyword kLocal nh
syn keyword kLocal ni
syn keyword kLocal nj
syn keyword kLocal nk
syn keyword kLocal nl
syn keyword kLocal nm
syn keyword kLocal nn
syn keyword kLocal no
syn keyword kLocal np
syn keyword kLocal nq
syn keyword kLocal nr
syn keyword kLocal ns
syn keyword kLocal nt
syn keyword kLocal nu
syn keyword kLocal nv
syn keyword kLocal nw
syn keyword kLocal nx
syn keyword kLocal ny
syn keyword kLocal nz
syn keyword kLocal oa
syn keyword kLocal ob
syn keyword kLocal oc
syn keyword kLocal od
syn keyword kLocal oe
syn keyword kLocal of
syn keyword kLocal og
syn keyword kLocal oh
syn keyword kLocal oi
syn keyword kLocal oj
syn keyword kLocal ok
syn keyword kLocal ol
syn keyword kLocal om
syn keyword kLocal on
syn keyword kLocal oo
syn keyword kLocal op
syn keyword kLocal oq
syn keyword kLocal os
syn keyword kLocal ot
syn keyword kLocal ou
syn keyword kLocal ov
syn keyword kLocal ow
syn keyword kLocal ox
syn keyword kLocal oy
syn keyword kLocal oz
syn keyword kLocal pa
syn keyword kLocal pb
syn keyword kLocal pc
syn keyword kLocal pd
syn keyword kLocal pe
syn keyword kLocal pf
syn keyword kLocal pg
syn keyword kLocal ph
syn keyword kLocal pi
syn keyword kLocal pk
syn keyword kLocal pl
syn keyword kLocal pm
syn keyword kLocal pn
syn keyword kLocal po
syn keyword kLocal pp
syn keyword kLocal pq
syn keyword kLocal pr
syn keyword kLocal ps
syn keyword kLocal pt
syn keyword kLocal pu
syn keyword kLocal pv
syn keyword kLocal pw
syn keyword kLocal px
syn keyword kLocal py
syn keyword kLocal pz
syn keyword kLocal qa
syn keyword kLocal qb
syn keyword kLocal qc
syn keyword kLocal qd
syn keyword kLocal qe
syn keyword kLocal qf
syn keyword kLocal qg
syn keyword kLocal qh
syn keyword kLocal qi
syn keyword kLocal qj
syn keyword kLocal qk
syn keyword kLocal ql
syn keyword kLocal qm
syn keyword kLocal qn
syn keyword kLocal qo
syn keyword kLocal qp
syn keyword kLocal qq
syn keyword kLocal qr
syn keyword kLocal qs
syn keyword kLocal qt
syn keyword kLocal qu
syn keyword kLocal qv
syn keyword kLocal qw
syn keyword kLocal qx
syn keyword kLocal qy
syn keyword kLocal qz
syn keyword kLocal ra
syn keyword kLocal rb
syn keyword kLocal rc
syn keyword kLocal rd
syn keyword kLocal re
syn keyword kLocal rf
syn keyword kLocal rg
syn keyword kLocal rh
syn keyword kLocal ri
syn keyword kLocal rj
syn keyword kLocal rk
syn keyword kLocal rl
syn keyword kLocal rm
syn keyword kLocal rn
syn keyword kLocal ro
syn keyword kLocal rp
syn keyword kLocal rq
syn keyword kLocal rr
syn keyword kLocal rs
syn keyword kLocal rt
syn keyword kLocal ru
syn keyword kLocal rv
syn keyword kLocal rw
syn keyword kLocal rx
syn keyword kLocal ry
syn keyword kLocal rz
syn keyword kLocal sa
syn keyword kLocal sb
syn keyword kLocal sc
syn keyword kLocal sd
syn keyword kLocal se
syn keyword kLocal sf
syn keyword kLocal sg
syn keyword kLocal sh
syn keyword kLocal si
syn keyword kLocal sj
syn keyword kLocal sk
syn keyword kLocal sl
syn keyword kLocal sm
syn keyword kLocal sn
syn keyword kLocal so
syn keyword kLocal sp
syn keyword kLocal sq
syn keyword kLocal sr
syn keyword kLocal st
syn keyword kLocal su
syn keyword kLocal sw
syn keyword kLocal sx
syn keyword kLocal sy
syn keyword kLocal sz
syn keyword kLocal ta
syn keyword kLocal tb
syn keyword kLocal tc
syn keyword kLocal td
syn keyword kLocal te
syn keyword kLocal tf
syn keyword kLocal tg
syn keyword kLocal th
syn keyword kLocal ti
syn keyword kLocal tj
syn keyword kLocal tk
syn keyword kLocal tl
syn keyword kLocal tm
syn keyword kLocal tn
syn keyword kLocal to
syn keyword kLocal tp
syn keyword kLocal tq
syn keyword kLocal tr
syn keyword kLocal ts
syn keyword kLocal tt
syn keyword kLocal tu
syn keyword kLocal tv
syn keyword kLocal tw
syn keyword kLocal tx
syn keyword kLocal ty
syn keyword kLocal tz
syn keyword kLocal ua
syn keyword kLocal ub
syn keyword kLocal uc
syn keyword kLocal ud
syn keyword kLocal ue
syn keyword kLocal uf
syn keyword kLocal ug
syn keyword kLocal uh
syn keyword kLocal ui
syn keyword kLocal uk
syn keyword kLocal ul
syn keyword kLocal um
syn keyword kLocal un
syn keyword kLocal uo
syn keyword kLocal up
syn keyword kLocal uq
syn keyword kLocal ur
syn keyword kLocal us
syn keyword kLocal ut
syn keyword kLocal uu
syn keyword kLocal uv
syn keyword kLocal uw
syn keyword kLocal ux
syn keyword kLocal uy
syn keyword kLocal uz
syn keyword kLocal va
syn keyword kLocal vb
syn keyword kLocal vc
syn keyword kLocal vd
syn keyword kLocal ve
syn keyword kLocal vf
syn keyword kLocal vg
syn keyword kLocal vh
syn keyword kLocal vi
syn keyword kLocal vj
syn keyword kLocal vk
syn keyword kLocal vl
syn keyword kLocal vm
syn keyword kLocal vn
syn keyword kLocal vo
syn keyword kLocal vp
syn keyword kLocal vq
syn keyword kLocal vr
syn keyword kLocal vt
syn keyword kLocal vu
syn keyword kLocal vv
syn keyword kLocal vw
syn keyword kLocal vx
syn keyword kLocal vy
syn keyword kLocal vz
syn keyword kLocal wa
syn keyword kLocal wb
syn keyword kLocal wc
syn keyword kLocal wd
syn keyword kLocal we
syn keyword kLocal wf
syn keyword kLocal wg
syn keyword kLocal wh
syn keyword kLocal wi
syn keyword kLocal wk
syn keyword kLocal wl
syn keyword kLocal wm
syn keyword kLocal wn
syn keyword kLocal wo
syn keyword kLocal wp
syn keyword kLocal wq
syn keyword kLocal wr
syn keyword kLocal ws
syn keyword kLocal wt
syn keyword kLocal wu
syn keyword kLocal wv
syn keyword kLocal ww
syn keyword kLocal wx
syn keyword kLocal wy
syn keyword kLocal wz
syn keyword kLocal xa
syn keyword kLocal xb
syn keyword kLocal xc
syn keyword kLocal xd
syn keyword kLocal xe
syn keyword kLocal xf
syn keyword kLocal xg
syn keyword kLocal xh
syn keyword kLocal xi
syn keyword kLocal xj
syn keyword kLocal xk
syn keyword kLocal xl
syn keyword kLocal xm
syn keyword kLocal xn
syn keyword kLocal xo
syn keyword kLocal xp
syn keyword kLocal xq
syn keyword kLocal xr
syn keyword kLocal xs
syn keyword kLocal xt
syn keyword kLocal xu
syn keyword kLocal xv
syn keyword kLocal xw
syn keyword kLocal xx
syn keyword kLocal xy
syn keyword kLocal xz
syn keyword kLocal ya
syn keyword kLocal yb
syn keyword kLocal yc
syn keyword kLocal yd
syn keyword kLocal ye
syn keyword kLocal yf
syn keyword kLocal yg
syn keyword kLocal yh
syn keyword kLocal yi
syn keyword kLocal yj
syn keyword kLocal yk
syn keyword kLocal yl
syn keyword kLocal ym
syn keyword kLocal yn
syn keyword kLocal yo
syn keyword kLocal yp
syn keyword kLocal yq
syn keyword kLocal yr
syn keyword kLocal ys
syn keyword kLocal yt
syn keyword kLocal yu
syn keyword kLocal yv
syn keyword kLocal yw
syn keyword kLocal yx
syn keyword kLocal yy
syn keyword kLocal yz
syn keyword kLocal za
syn keyword kLocal zb
syn keyword kLocal zc
syn keyword kLocal zd
syn keyword kLocal ze
syn keyword kLocal zf
syn keyword kLocal zg
syn keyword kLocal zh
syn keyword kLocal zi
syn keyword kLocal zj
syn keyword kLocal zk
syn keyword kLocal zl
syn keyword kLocal zm
syn keyword kLocal zn
syn keyword kLocal zo
syn keyword kLocal zp
syn keyword kLocal zq
syn keyword kLocal zr
syn keyword kLocal zs
syn keyword kLocal zt
syn keyword kLocal zu
syn keyword kLocal zv
syn keyword kLocal zw
syn keyword kLocal zx
syn keyword kLocal zy
syn keyword kLocal zz
hi link kLocal Underlined
syn keyword kPrimitive abs
syn keyword kPrimitive acos
syn keyword kPrimitive asin
syn keyword kPrimitive atan
syn keyword kPrimitive avg
syn keyword kPrimitive bin
syn keyword kSpecial by
syn keyword kPrimitive cos
syn keyword kSpecial delete
syn keyword kPrimitive div
syn keyword kPrimitive do
syn keyword kSpecial exec
syn keyword kPrimitive exit
syn keyword kPrimitive exp
syn keyword kSpecial from
syn keyword kPrimitive getenv
syn keyword kPrimitive i
syn keyword kPrimitive if
syn keyword kPrimitive in
syn keyword kSpecial insert
syn keyword kPrimitive last
syn keyword kPrimitive like
syn keyword kPrimitive log
syn keyword kPrimitive max
syn keyword kPrimitive min
syn keyword kPrimitive prd
syn keyword kSpecial select
syn keyword kPrimitive setenv
syn keyword kPrimitive sin
syn keyword kPrimitive sqrt
syn keyword kPrimitive ss
syn keyword kPrimitive sum
syn keyword kPrimitive tan
syn keyword kSpecial update
syn keyword kSpecial upsert
syn keyword kPrimitive wavg
syn keyword kPrimitive while
syn keyword kPrimitive within
syn keyword kPrimitive wsum
syn keyword kPrimitive xexp
syn keyword qLib \.Q\.A
syn keyword qLib \.Q\.Cf
syn keyword qLib \.Q\.IN
syn keyword qLib \.Q\.L
syn keyword qLib \.Q\.M
syn keyword qLib \.Q\.S
syn keyword qLib \.Q\.V
syn keyword qLib \.Q\.a
syn keyword qLib \.Q\.a0
syn keyword qLib \.Q\.a1
syn keyword qLib \.Q\.a2
syn keyword qLib \.Q\.addmonths
syn keyword qLib \.Q\.addr
syn keyword qLib \.Q\.an
syn keyword qLib \.Q\.b6
syn keyword qLib \.Q\.chk
syn keyword qLib \.Q\.cn
syn keyword qLib \.Q\.d0
syn keyword qLib \.Q\.dd
syn keyword qLib \.Q\.def
syn keyword qLib \.Q\.dpft
syn keyword qLib \.Q\.dpt
syn keyword qLib \.Q\.dsftg
syn keyword qLib \.Q\.dt
syn keyword qLib \.Q\.en
syn keyword qLib \.Q\.f
syn keyword qLib \.Q\.fc
syn keyword qLib \.Q\.ff
syn keyword qLib \.Q\.fk
syn keyword qLib \.Q\.fl
syn keyword qLib \.Q\.fmt
syn keyword qLib \.Q\.foo
syn keyword qLib \.Q\.fp
syn keyword qLib \.Q\.fpn
syn keyword qLib \.Q\.fps
syn keyword qLib \.Q\.fs
syn keyword qLib \.Q\.fsn
syn keyword qLib \.Q\.ft
syn keyword qLib \.Q\.fu
syn keyword qLib \.Q\.gc
syn keyword qLib \.Q\.hdpf
syn keyword qLib \.Q\.hg
syn keyword qLib \.Q\.host
syn keyword qLib \.Q\.hp
syn keyword qLib \.Q\.id
syn keyword qLib \.Q\.ind
syn keyword qLib \.Q\.j10
syn keyword qLib \.Q\.j12
syn keyword qLib \.Q\.k
syn keyword qLib \.Q\.l
syn keyword qLib \.Q\.n
syn keyword qLib \.Q\.nA
syn keyword qLib \.Q\.nct
syn keyword qLib \.Q\.opt
syn keyword qLib \.Q\.ord
syn keyword qLib \.Q\.p
syn keyword qLib \.Q\.p1
syn keyword qLib \.Q\.p2
syn keyword qLib \.Q\.par
syn keyword qLib \.Q\.pcnt
syn keyword qLib \.Q\.ps
syn keyword qLib \.Q\.q0
syn keyword qLib \.Q\.qa
syn keyword qLib \.Q\.qb
syn keyword qLib \.Q\.qd
syn keyword qLib \.Q\.qe
syn keyword qLib \.Q\.qm
syn keyword qLib \.Q\.qp
syn keyword qLib \.Q\.qt
syn keyword qLib \.Q\.res
syn keyword qLib \.Q\.s
syn keyword qLib \.Q\.s1
syn keyword qLib \.Q\.s2
syn keyword qLib \.Q\.sw
syn keyword qLib \.Q\.t
syn keyword qLib \.Q\.t0
syn keyword qLib \.Q\.tab
syn keyword qLib \.Q\.tt
syn keyword qLib \.Q\.tx
syn keyword qLib \.Q\.ty
syn keyword qLib \.Q\.ua
syn keyword qLib \.Q\.v
syn keyword qLib \.Q\.view
syn keyword qLib \.Q\.w
syn keyword qLib \.Q\.Xf
syn keyword qLib \.Q\.x0
syn keyword qLib \.Q\.x1
syn keyword qLib \.Q\.x10
syn keyword qLib \.Q\.x12
syn keyword qLib \.Q\.x2
syn keyword qLib \.Q\.xy
syn keyword qLib \.h\.HOME
syn keyword qLib \.h\.br
syn keyword qLib \.h\.c0
syn keyword qLib \.h\.c1
syn keyword qLib \.h\.cd
syn keyword qLib \.h\.code
syn keyword qLib \.h\.data
syn keyword qLib \.h\.eb
syn keyword qLib \.h\.ec
syn keyword qLib \.h\.ed
syn keyword qLib \.h\.edsn
syn keyword qLib \.h\.es
syn keyword qLib \.h\.ex
syn keyword qLib \.h\.fram
syn keyword qLib \.h\.ha
syn keyword qLib \.h\.hb
syn keyword qLib \.h\.hc
syn keyword qLib \.h\.he
syn keyword qLib \.h\.hn
syn keyword qLib \.h\.hp
syn keyword qLib \.h\.hr
syn keyword qLib \.h\.ht
syn keyword qLib \.h\.hta
syn keyword qLib \.h\.htac
syn keyword qLib \.h\.htc
syn keyword qLib \.h\.html
syn keyword qLib \.h\.http
syn keyword qLib \.h\.hu
syn keyword qLib \.h\.hug
syn keyword qLib \.h\.hy
syn keyword qLib \.h\.iso8601
syn keyword qLib \.h\.jx
syn keyword qLib \.h\.logo
syn keyword qLib \.h\.nbr
syn keyword qLib \.h\.pre
syn keyword qLib \.h\.sa
syn keyword qLib \.h\.sb
syn keyword qLib \.h\.sc
syn keyword qLib \.h\.td
syn keyword qLib \.h\.text
syn keyword qLib \.h\.tx
syn keyword qLib \.h\.ty
syn keyword qLib \.h\.uh
syn keyword qLib \.h\.xd
syn keyword qLib \.h\.xmp
syn keyword qLib \.h\.xs
syn keyword qLib \.h\.xt
syn keyword qLib \.o\.B0
syn keyword qLib \.o\.C0
syn keyword qLib \.o\.Cols
syn keyword qLib \.o\.Columns
syn keyword qLib \.o\.FG
syn keyword qLib \.o\.Fkey
syn keyword qLib \.o\.Gkey
syn keyword qLib \.o\.Key
syn keyword qLib \.o\.PS
syn keyword qLib \.o\.Special
syn keyword qLib \.o\.Stats
syn keyword qLib \.o\.T
syn keyword qLib \.o\.T0
syn keyword qLib \.o\.TI
syn keyword qLib \.o\.Tables
syn keyword qLib \.o\.Ts
syn keyword qLib \.o\.TypeInfo
syn keyword qLib \.o\.ex
syn keyword qLib \.o\.o
syn keyword qLib \.o\.t
syn keyword qLib \.q\.aj
syn keyword qLib \.q\.aj0
syn keyword qLib \.q\.all
syn keyword qLib \.q\.and
syn keyword qLib \.q\.any
syn keyword qLib \.q\.asc
syn keyword qLib \.q\.asof
syn keyword qLib \.q\.attr
syn keyword qLib \.q\.avgs
syn keyword qLib \.q\.ceiling
syn keyword qLib \.q\.cols
syn keyword qLib \.q\.cor
syn keyword qLib \.q\.count
syn keyword qLib \.q\.cov
syn keyword qLib \.q\.cross
syn keyword qLib \.q\.csv
syn keyword qLib \.q\.cut
syn keyword qLib \.q\.deltas
syn keyword qLib \.q\.desc
syn keyword qLib \.q\.dev
syn keyword qLib \.q\.differ
syn keyword qLib \.q\.distinct
syn keyword qLib \.q\.each
syn keyword qLib \.q\.ej
syn keyword qLib \.q\.ema
syn keyword qLib \.q\.enlist
syn keyword qLib \.q\.eval
syn keyword qLib \.q\.except
syn keyword qLib \.q\.fby
syn keyword qLib \.q\.fills
syn keyword qLib \.q\.first
syn keyword qLib \.q\.fkeys
syn keyword qLib \.q\.flip
syn keyword qLib \.q\.floor
syn keyword qLib \.q\.get
syn keyword qLib \.q\.group
syn keyword qLib \.q\.gtime
syn keyword qLib \.q\.hclose
syn keyword qLib \.q\.hcount
syn keyword qLib \.q\.hdel
syn keyword qLib \.q\.hopen
syn keyword qLib \.q\.hsym
syn keyword qLib \.q\.iasc
syn keyword qLib \.q\.idesc
syn keyword qLib \.q\.ij
syn keyword qLib \.q\.inter
syn keyword qLib \.q\.inv
syn keyword qLib \.q\.key
syn keyword qLib \.q\.keys
syn keyword qLib \.q\.lj
syn keyword qLib \.q\.load
syn keyword qLib \.q\.lower
syn keyword qLib \.q\.lsq
syn keyword qLib \.q\.ltime
syn keyword qLib \.q\.ltrim
syn keyword qLib \.q\.mavg
syn keyword qLib \.q\.maxs
syn keyword qLib \.q\.mcount
syn keyword qLib \.q\.md5
syn keyword qLib \.q\.mdev
syn keyword qLib \.q\.med
syn keyword qLib \.q\.meta
syn keyword qLib \.q\.mins
syn keyword qLib \.q\.mmax
syn keyword qLib \.q\.mmin
syn keyword qLib \.q\.mmu
syn keyword qLib \.q\.mod
syn keyword qLib \.q\.msum
syn keyword qLib \.q\.neg
syn keyword qLib \.q\.next
syn keyword qLib \.q\.not
syn keyword qLib \.q\.null
syn keyword qLib \.q\.or
syn keyword qLib \.q\.over
syn keyword qLib \.q\.parse
syn keyword qLib \.q\.peach
syn keyword qLib \.q\.pj
syn keyword qLib \.q\.plist
syn keyword qLib \.q\.prds
syn keyword qLib \.q\.prev
syn keyword qLib \.q\.prior
syn keyword qLib \.q\.rand
syn keyword qLib \.q\.rank
syn keyword qLib \.q\.ratios
syn keyword qLib \.q\.raze
syn keyword qLib \.q\.read0
syn keyword qLib \.q\.read1
syn keyword qLib \.q\.reciprocal
syn keyword qLib \.q\.reval
syn keyword qLib \.q\.reverse
syn keyword qLib \.q\.rload
syn keyword qLib \.q\.rotate
syn keyword qLib \.q\.rsave
syn keyword qLib \.q\.rtrim
syn keyword qLib \.q\.save
syn keyword qLib \.q\.scan
syn keyword qLib \.q\.scov
syn keyword qLib \.q\.sdev
syn keyword qLib \.q\.set
syn keyword qLib \.q\.show
syn keyword qLib \.q\.signum
syn keyword qLib \.q\.svar
syn keyword qLib \.q\.ssr
syn keyword qLib \.q\.string
syn keyword qLib \.q\.sublist
syn keyword qLib \.q\.sums
syn keyword qLib \.q\.sv
syn keyword qLib \.q\.system
syn keyword qLib \.q\.tables
syn keyword qLib \.q\.til
syn keyword qLib \.q\.trim
syn keyword qLib \.q\.txf
syn keyword qLib \.q\.type
syn keyword qLib \.q\.uj
syn keyword qLib \.q\.ungroup
syn keyword qLib \.q\.union
syn keyword qLib \.q\.upper
syn keyword kSpecial \.q\.upsert
syn keyword qLib \.q\.value
syn keyword qLib \.q\.var
syn keyword qLib \.q\.view
syn keyword qLib \.q\.views
syn keyword qLib \.q\.vs
syn keyword qLib \.q\.where
syn keyword qLib \.q\.wj
syn keyword qLib \.q\.wj1
syn keyword qLib \.q\.xasc
syn keyword qLib \.q\.xbar
syn keyword qLib \.q\.xcol
syn keyword qLib \.q\.xcols
syn keyword qLib \.q\.xdesc
syn keyword qLib \.q\.xgroup
syn keyword qLib \.q\.xkey
syn keyword qLib \.q\.xlog
syn keyword qLib \.q\.xprev
syn keyword qLib \.q\.xrank

" hardcode the .z. functions (no way to get them automatically)
syn match qLib "\.z\.D"
syn match qLib "\.z\.K"
syn match qLib "\.z\.N"
syn match qLib "\.z\.P"
syn match qLib "\.z\.T"
syn match qLib "\.z\.W"
syn match qLib "\.z\.Z"
syn match qLib "\.z\.a"
syn match qLib "\.z\.ac"
syn match qLib "\.z\.b"
syn match qLib "\.z\.bm"
syn match qLib "\.z\.c"
syn match qLib "\.z\.d"
syn match qLib "\.z\.exit"
syn match qLib "\.z\.f"
syn match qLib "\.z\.h"
syn match qLib "\.z\.i"
syn match qLib "\.z\.k"
syn match qLib "\.z\.l"
syn match qLib "\.z\.n"
syn match qLib "\.z\.o"
syn match qLib "\.z\.p"
syn match qLib "\.z\.pc"
syn match qLib "\.z\.pg"
syn match qLib "\.z\.ph"
syn match qLib "\.z\.pi"
syn match qLib "\.z\.po"
syn match qLib "\.z\.pp"
syn match qLib "\.z\.ps"
syn match qLib "\.z\.pw"
syn match qLib "\.z\.q"
syn match qLib "\.z\.s"
syn match qLib "\.z\.t"
syn match qLib "\.z\.ts"
syn match qLib "\.z\.u"
syn match qLib "\.z\.vs"
syn match qLib "\.z\.w"
syn match qLib "\.z\.ws"
syn match qLib "\.z\.x"
syn match qLib "\.z\.X"
syn match qLib "\.z\.z"
syn match qLib "\.z\.zd"

"syn match kIdentifier "\<\a[a-zA-Z0-9]*\>"
"syn match kIdentifier "\<[a-zA-Z\.][a-zA-Z0-9\.]*\>"
syn match kPlaceholder "\<[xyz]\>" 

" Conditional and similar constructs 
syn keyword kConditional if
syn match kConditional /$\[/me=e-1
syn match kConditional /?\[/me=e-1
syn match kConditional /'\[/me=e-1
syn match kConditional /\.\[/me=e-1
syn match kConditional /@\[/me=e-1

" plist, view, global assign
syn match Function /::/

" Repeat
syn keyword kRepeat do while

" in a k script q) and s) switch to other languages, k) is unnecessary 
syn match kLang "^q)"
syn match kLang "^s)"
syn match kError "^k)"

" symbols and specialcase file+connection handles
syn match kSymbol "\(`\<[a-zA-Z0-9\.][a-zA-Z0-9_\.]*\>\)" 
syn match kHandle "\`:\{1,2}\([0-9a-zA-Z\\/.]\+:\=\)\{1,4}"

" attributes `p#, `g#, `s# and `u#
syn match kPreproc /`[spgu]#/

" highlight all the special names used when `XXX$ casting data 
syn match kCast "\`\(boolean\|byte\|short\|int\|long\|real\|guid\|float\|char\|symbol\|timestamp\|month\|date\|datetime\|timespan\|time\|minute\|second\)\$\s*"
syn match kCast "\`\(year\|week\|mm\|dd\|hh\|ss\|uu\)\$\s*"

" system cmd
syn match kSyscmd "^\\\<\([12abBcCdeflopPrsStTuvwWxz_]\|cd\|ts\)\>"

" String and handle embedded tabs and newlines correctly 
syn region kString start=+"+ skip=+\\\\\|\\"+ end=+"+ keepend excludenl matchgroup=None contains=kSpecialChar 
syn match kSpecialChar "\\[abcfnrtv\\]" contained
" special singlechar string before $ 
syn match kCast /"\a"\$/

if !exists("did_k_syntax_inits")
 let did_k_syntax_inits = 1
 hi link kBoolean Number
 hi link kCast Type
 hi link kComment Comment
 hi link kConditional Conditional
 hi link kContext Directory
 hi link kError Error
 hi link kExit WarningMsg
 hi link kFunction Statement
 hi link kGlobal Constant
 hi link kHandle TabLineSel
 hi link kIdentifier Identifier
 hi link kLang Pmenu
 hi link kNumber Number
 hi link kOperator Operator
 hi link kPlaceholder Special
 hi link kPreproc kCast
 hi link kPrimitive kFunction
 hi link kRepeat kConditional
 hi link kSeparator Separator
 hi link kSpecial Special
 hi link kSpecialChar SpecialChar
 hi link kSpecialComment SpecialComment
 hi link kString String
 hi link kSyscmd PmenuSel
 hi link kSymbol Typedef
 hi link kTodo Todo
 hi link qLib Special
 endif

let b:current_syntax = "k"

if main_syntax == 'k'
 unlet main_syntax
endif
