" Vim syntax file
"
" Maintainer: Jake Zimmerman <jake@zimmerman.io
"
" TODO(jez): Highlight commit messages the way hub puts them in

syn case match
syn sync minlines=50

if has("spell")
  syn spell toplevel
endif

" Try to find the current comment character (not perfect)
function! s:getCommentChar()
  let line = getline(search('\v(Creating issue|Requesting a pull)', 'nw'))
  if strlen(line) > 0
    return line[0]
  endif
endfunction

let s:commentChar = s:getCommentChar()

exe "syn match ghhubComment '" .s:commentChar .".*'"
syn match   ghhubFirstLine '\%^.*' skipnl
syn match   ghhubTitle     '^.\{0,50\}' contained containedin=ghhubFirstLine contains=@Spell

hi def link ghhubComment Comment
hi def link ghhubTitle   Keyword
