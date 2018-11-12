:color desert

set nocompatible                " break away from old vi compatibility
set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files
" Who doesn't like autoindent?
set autoindent
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
"   set spl=en spell
"   set spell
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
