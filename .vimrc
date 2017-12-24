
"General Setting

set nocompatible        " not compatible with the old-fashion vi mode
set bs=2                " allow backspacing over everything in insert mode
set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside
set title               " change the terminal's title
set cm=blowfish2	" set cryptmethod to blowfish2


filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set showcmd             " show current command
set hidden              " hides buffers instead of closing them
set hlsearch            " search highlighting
set autoindent          " auto indentation
set incsearch           " incremental search
set nobackup            " no *~ backup files
set copyindent          " copy the previous indentation on autoindenting
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context
set number              " show line number
set relativenumber	" show relative line number
set foldmethod=indent	" folding basedon indentation
set foldlevel=99	" folding level
set cursorline          " highlight the current line
":hi CursorLine   cterm=NONE 	" highlight current line number without underline
":hi LineNr ctermfg=DarkGrey	" grey out other line numbers

" Highlight the 81th column {
	highlight ColorColumn ctermbg=magenta
	"set colorcolumn=81
	call matchadd('ColorColumn', '\%81v', 100)
"}

" Show tap and space (need 'set list' to show)
set listchars=tab:>-,nbsp:_,trail:.
"set list

" Color Scheme
colorscheme wombat256mod

" Autocomplete Without Plug-in
" <Ctrl-p> to insert previous matching word
" <Ctrl-n> to insert next matching word
set path+=**
set wildmenu

" Spell check
map <F6> :setlocal spell! spelllang=en_us<CR>

" Toggle line number and relative line number
map <F7> :set invnumber<CR>
map <F8> :set invrelativenumber<CR>

" CtrlP Settings
let g:ctrlp_show_hidden = 1             " find dot files


" netrw (vim build-in directory browser) settings {
	let g:netrw_liststyle = 3       " 3 is tree view (use 'i' to cycle through the options)
"	let g:netrw_browse_split = 4    " open file in previous window
"	let g:netrw_altv = 1            " open file to the right
"	let g:netrw_banner = 0          " don't display the directory banner
"	let g:netrw_winsize = 25        " set the width to 25% of the window
"	augroup ProjectDrawer
"	  autocmd!
"	  autocmd VimEnter * :Vexplore
"	augroup END
"}
" :Explore or :Exp - opens netrw in the current window
" :Sexplore or :Sex - opens netrw in a horizontal split window
" :Vexplore or :Vex - opens netrw in a vertial split window

" Windows
" <Ctrl-ww> - switch between windows


" vim-latex and vim-latex-live-preview Settings {
" 	Compiling via latex-suite is simple. Goto normal mode and press \ll (replace \ with whatever mapleader setting you have). 
" 	E.g. type 'eqnarray', escape to Normal mode, press <F5>, press
" 	<Ctrl-j> to jump to next placeholder
" 	Execute :LLPStartPreview to launch the previewer.
	let g:tex_flavor='latex'		" load vim-latex when start an empty .tex file
	let g:Tex_DefaultTargetFormat='pdf'	" produce pdf (not dvi) when compile
	autocmd Filetype tex setl updatetime=2

	" Linux Settings
	let g:Tex_ViewRule_pdf='evince'
	let g:livepreview_previewer = 'evince'

	" Mac Settings
	"let g:Tex_ViewRule_pdf='Skim'
	"let g:livepreview_previewer = 'open -a Skim'
"}


" Airline Status Line {
	set laststatus=2
	let g:airline_powerline_fonts = 1
	let g:airline_theme='bubblegum'
	let g:airline#extensions#tabline#enabled = 1		" show buffers at the top
	"let g:airline#extensions#tabline#left_sep = ' '
	"let g:airline#extensions#tabline#left_alt_sep = '|'
"}

" Key Mapping
let mapleader=','

" Easy-Motion How-To
" <leader-key> <leader-key> w

" Move to next buffer
nnoremap <S-Tab> :bn<CR>
inoremap <S-Tab> <Esc>:bn<CR>
noremap <S-Tab> <Esc>:bn<CR>
" :tabnew - open a new buffer in a new tab
" :new - split window with an unnamed buffer

" Folding
nnoremap <space> za		" folding with spacebar
nnoremap <F9> zr		" reduce folding level
nnoremap <F10> zm		" more folding level

" Make pairs
inoremap <leader>' ''<Esc>i
inoremap <leader>" ""<Esc>i
inoremap <leader>( ()<Esc>i
inoremap <leader>[ []<Esc>i

" Abbreviation
iabbr teh the
iabbr adn and


