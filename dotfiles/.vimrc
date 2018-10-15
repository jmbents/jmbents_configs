:color desert

set nocompatible                " break away from old vi compatibility
set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files
" Who doesn't like autoindent?
set autoindent
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable

" Spellcheck if asciidoc or commit message. Otherwise highlight current word and instances
if (expand('%:e') =~ 'asciidoc' || expand('%:F') =~ 'COMMIT_EDITMSG')
  setlocal spell
else
  autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
endif

" Got backspace?
set backspace=2


set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch  " highlight the search
set diffopt=filler,iwhite     " ignore all whitespace and sync
set showmatch           " Show matching brackets.

" highlight current line
set cul
" adjust color
"hi CursorLine term=none cterm=none ctermbg=2
hi CursorLine cterm=NONE,underline guibg=#F4F4F4
" set cursorline cursorcolumn
set cursorline

set cmdheight=1                 " explicitly set the height of the command line
set showcmd                     " Show (partial) command in status line.
"set number                      " yay line numbers
set ruler                       " show current position at bottom
set wrap                        " soft wrap long lines
set list                        " show invisible characters
set listchars =tab:>.,trail:.,extends:#,nbsp:.   " but only show tabs and trailing whitespace

" Show end of line spaces and cleanup on file save.
match Todo /\s\+$/
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" Automatically update copyright notice with current year
"autocmd BufWritePre *
"  \ if &modified |
"    \   exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y") |
"    \ endif


let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 70
map <F4> :TlistToggle<cr>

map <F8> :!/usr/bin/ctags -R --fields=+iaS --extra=+q .<CR>


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

