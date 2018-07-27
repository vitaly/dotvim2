" Vim syntax file
" Language: q
" Maintainer: Simon Garland <simon@kx.com>
" Last Change: 2010.08.21

" Remove any old syntax stuff hanging around
syn clear

if !exists("main_syntax")
 let main_syntax = 'q'
endif

" Read the k syntax to start with
source <sfile>:p:h/k.vim

" all _ in names in q
set iskeyword=@,_,48-57,.

" Identifier tweak to allow _ in identifiers
syn match qIdentifier "\<\a\w*\>"
syn match qGlobal "\<\u[A-Z0-9_]*\>"
" redo qPlaceholder as kPlaceholder may have got zapped 
syn match qPlaceholder "\<[xyz]\>"

syn keyword qFunction  aj
syn keyword qFunction  aj0
syn keyword qFunction  all
syn keyword qFunction  and
syn keyword qFunction  any
syn keyword qFunction  asc
syn keyword qFunction  asof
syn keyword qFunction  attr
syn keyword qFunction  avgs
syn keyword qFunction  ceiling
syn keyword qFunction  cols
syn keyword qFunction  cor
syn keyword qFunction  count
syn keyword qFunction  cov
syn keyword qFunction  cross
syn keyword qFunction  csv
syn keyword qFunction  cut
syn keyword qFunction  deltas
syn keyword qFunction  desc
syn keyword qFunction  dev
syn keyword qFunction  differ
syn keyword qFunction  distinct
syn keyword qFunction  each
syn keyword qFunction  ej
syn keyword qFunction  ema
syn keyword qFunction  enlist
syn keyword qFunction  eval
syn keyword qFunction  except
syn keyword qFunction  fby
syn keyword qFunction  fills
syn keyword qFunction  first
syn keyword qFunction  fkeys
syn keyword qFunction  flip
syn keyword qFunction  floor
syn keyword qFunction  get
syn keyword qFunction  group
syn keyword qFunction  gtime
syn keyword qFunction  hclose
syn keyword qFunction  hcount
syn keyword qFunction  hdel
syn keyword qFunction  hopen
syn keyword qFunction  hsym
syn keyword qFunction  iasc
syn keyword qFunction  idesc
syn keyword qFunction  ij
syn keyword qFunction  inter
syn keyword qFunction  inv
syn keyword qFunction  key
syn keyword qFunction  keys
syn keyword qFunction  lj
syn keyword qFunction  load
syn keyword qFunction  lower
syn keyword qFunction  lsq
syn keyword qFunction  ltime
syn keyword qFunction  ltrim
syn keyword qFunction  mavg
syn keyword qFunction  maxs
syn keyword qFunction  mcount
syn keyword qFunction  md5
syn keyword qFunction  mdev
syn keyword qFunction  med
syn keyword qFunction  meta
syn keyword qFunction  mins
syn keyword qFunction  mmax
syn keyword qFunction  mmin
syn keyword qFunction  mmu
syn keyword qFunction  mod
syn keyword qFunction  msum
syn keyword qFunction  neg
syn keyword qFunction  next
syn keyword qFunction  not
syn keyword qFunction  null
syn keyword qFunction  or
syn keyword qFunction  over
syn keyword qFunction  parse
syn keyword qFunction  peach
syn keyword qFunction  pj
syn keyword qFunction  plist
syn keyword qFunction  prds
syn keyword qFunction  prev
syn keyword qFunction  prior
syn keyword qFunction  rand
syn keyword qFunction  rank
syn keyword qFunction  ratios
syn keyword qFunction  raze
syn keyword qFunction  read0
syn keyword qFunction  read1
syn keyword qFunction  reciprocal
syn keyword qFunction  reval
syn keyword qFunction  reverse
syn keyword qFunction  rload
syn keyword qFunction  rotate
syn keyword qFunction  rsave
syn keyword qFunction  rtrim
syn keyword qFunction  save
syn keyword qFunction  scan
syn keyword qFunction  scov
syn keyword qFunction  sdev
syn keyword qFunction  set
syn keyword qFunction  show
syn keyword qFunction  signum
syn keyword qFunction  svar
syn keyword qFunction  ssr
syn keyword qFunction  string
syn keyword qFunction  sublist
syn keyword qFunction  sums
syn keyword qFunction  sv
syn keyword qFunction  system
syn keyword qFunction  tables
syn keyword qFunction  til
syn keyword qFunction  trim
syn keyword qFunction  txf
syn keyword qFunction  type
syn keyword qFunction  uj
syn keyword qFunction  ungroup
syn keyword qFunction  union
syn keyword qFunction  upper
"syn keyword qFunction  upsert
syn keyword qFunction  value
syn keyword qFunction  var
syn keyword qFunction  view
syn keyword qFunction  views
syn keyword qFunction  vs
syn keyword qFunction  where
syn keyword qFunction  wj
syn keyword qFunction  wj1
syn keyword qFunction  xasc
syn keyword qFunction  xbar
syn keyword qFunction  xcol
syn keyword qFunction  xcols
syn keyword qFunction  xdesc
syn keyword qFunction  xgroup
syn keyword qFunction  xkey
syn keyword qFunction  xlog
syn keyword qFunction  xprev
syn keyword qFunction  xrank

" Include
syn match qLang "^k)"
syn match qError "^q)"

if !exists("did_q_syntax_inits")
 let did_q_syntax_inits = 1
 hi link qError kError
 hi link qFunction kFunction
 hi link qGlobal kGlobal 
 hi link qIdentifier kIdentifier
 hi link qLang kLang
 hi link qPlaceholder kPlaceholder
 endif

let b:current_syntax = "q"

if main_syntax == 'q'
 unlet main_syntax
endif
