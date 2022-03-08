set nocompatible " be iMproved, required
filetype off " required

call plug#begin('~/.vim/plugged')


" Load
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'eiginn/netrw'
Plug 'dyng/ctrlsf.vim'
Plug 'dense-analysis/ale'

" Themes
" Plug 'jacoborus/tender.vim'
Plug 'lifepillar/vim-solarized8'
" Plug 'sonph/onehalf', { 'rtp': 'vim/' }
" Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'vim-scripts/TaskList.vim', { 'on': 'TaskList' }
Plug 'vim-latex/vim-latex', { 'for':  'tex' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

call plug#end()

let g:plug_timeout = 10000

syntax enable
filetype plugin indent on

" Only for MacVim
" let $PATH=$PATH . ':/usr/local/bin:/usr/bin'

" work with windows
noremap <C-Left>  :wincmd h<CR>
noremap <C-Down>  :wincmd j<CR>
noremap <C-Up>    :wincmd k<CR>
noremap <C-Right> :wincmd l<CR>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" work with buffers
nnoremap <C-TAB>   :bn<CR>
nnoremap <C-S-TAB> :bp<CR>

let mapleader = ","

" map sort function to a key
vnoremap <leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" gundo
map <leader>g :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 40
let g:gundo_right = 0

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

nnoremap d "_d
nnoremap D "_D

nnoremap "*d "*d
nnoremap "*D "*D

" noremap <C-c> "+y
" noremap <C-p> "+p
" noremap <C-x> "+x

" copy and paste
" vmap <C-y> "+yi
" vmap <C-x> "+c
" vmap <C-p> c<ESC>"+p
" imap <C-p> <ESC>"+pa


" lightline
" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'FugitiveHead'
"       \ },
"       \ 'mode_map': {
"         \ 'n' : 'N',
"         \ 'i' : 'I',
"         \ 'R' : 'R',
"         \ 'v' : 'V',
"         \ 'V' : 'VL',
"         \ "\<C-v>": 'VB',
"         \ 'c' : 'C',
"         \ 's' : 'S',
"         \ 'S' : 'SL',
"         \ "\<C-s>": 'SB',
"         \ 't': 'T',
"         \ },
"       \ }

" airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' C:'
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.readonly = '⊘'
let g:airline_symbols.crypt = ''
let g:airline_symbols.dirty = ' *'

let g:bufferline_echo = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ }

let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#left_sep = '\ue0b0 '
" let g:airline#extensions#tabline#left_alt_sep = '\ue0b1'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#ale#enabled = 0

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>ds :call TrimWhiteSpace()<CR>

" Pretty-Print JSON
function! PrettyPrintJSON()
    %!python -m json.tool
endfunction

nnoremap <silent> <Leader>pj :call PrettyPrintJSON()<CR>


"" NERDTREE
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.sw[po]$', '^\.git$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
" Prevents VIM to close the whole window
nnoremap \d :bp<cr>:bd #<cr>


" Start automatically if no files specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Start if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close vim if only NERDtree left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" ACK (fuzzy search)
" nmap <leader>a <Esc>:Ack!
" let g:ackprg = 'ag --vimgrep'

" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set shortmess=at
set t_Co=256
"" older stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wrap
" set textwidth=120
set formatoptions=lv
set colorcolumn=80
"set list
set smartindent
set expandtab
set mouse=ar

set hidden
set ruler
set title

"set title titlestring=%{strftime('%c',getftime(expand('%')))}
set nocp
set modelines=0

set scrolloff=4

set backspace=indent,eol,start

set number

set guioptions=

set clipboard=unnamed

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set diffopt+=vertical

"" Toggle relative line number
function! NumberToggle()
    if(&relativenumber)
        set norelativenumber
        set number
    else
        "" uncomment the following to display a '0' instead of the line number
        "set nonumber
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


"This is necessary to allow pasting from outside vim. It turns off
"auto stuff.
""You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>
""Usually I don't care about case when searching
set ignorecase
"Only ignore case when we type lower case when searching
set smartcase
""I hate noise. The t_vb bit removes any delay also
"set visualbell t_vb=
set novisualbell t_vb=
"Show menu with possible tab completions
set wildmenu
"set wildmode=list:longest
""Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,CMakeFiles,*.beam,.hg

"if has("gui_running")
set cursorline   "highlight current line
    "set cursorcolumn "highlight current column
"endif

if &diff
    "I'm only interested in diff colours
    syntax off
endif

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1

set shell=/bin/zsh

set undofile
set undodir=$HOME/.vim-undos/

set shellslash

"" LATEX
let g:tex_flavor='latex'
let g:tex_indent_items = 1

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,dvi'

let g:Tex_CompileRule_dvi = '/usr/local/texlive/2021/bin/universal-darwin/latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = ' /usr/local/texlive/2021/bin/universal-darwin/dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = '/usr/local/texlive/2021/bin/universal-darwin/pdflatex -synctex=1 --interaction=nonstopmode $*'

let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = '/usr/local/texlive/2021/bin/universal-darwin/dvipdfm $*.dvi'

let g:Tex_FormatDependency_pdf  = 'pdf'
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'

let g:Tex_BibtexFlavor = 'bibtex'

let g:Tex_IgnoredWarnings ='
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\n".
      \"You have requested\n".
      \"Missing number, treated as zero.\n".
      \"There were undefined references\n".
      \"Citation %.%# undefined\n".
      \"\oval, \circle, or \line size unavailable\n".
      \"Text page %# contains only floats\n"'
let g:Tex_IgnoreLevel = 9

"" MOLOKAI
" let g:molokai_original = 0

"" SOLARIZED
if (has("termguicolors"))
    set termguicolors
endif

" let g:solarized_visibility = 'high'
" let g:solarized_diffmode = 'high'
if (has("gui_running"))
    " colorscheme onehalfdark
    " let g:airline_theme='onehalfdark'
    let g:sonokai_style = 'atlantis'
    let g:sonokai_enable_italic = 1
    colorscheme sonokai
    let g:airline_theme='sonokai'
    " let g:lightline.colorscheme = 'sonokai'
else
    colorscheme solarized8
    let g:solarized_term_italics = 1
    let g:airline_theme='solarized'
    " let g:lightline.colorscheme = 'solarized'
    " let &t_8f = '\<Esc>[38;2;%lu;%lu;%lum'
    " let &t_8b = '\<Esc>[48;2;%lu;%lu;%lum'
    " let &t_Co = 16
endif


set background=dark
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
highlight link pythonDot White

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight ExtraWhitespace term=standout ctermbg=17 guibg=#001d30
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set incsearch "For fast terminals can highlight search string as you type
set nohlsearch

" Makes tab switching between matching brakets
nnoremap <tab> %
vnoremap <tab> %

" let g:DeleteTrailingWhitespace = 0
" let g:DeleteTrailingWhitespace_Action = 'delete'
"let g:DeleteTrailingWhitespace_Action = 'ask'
"let g:DeleteTrailingWhitespace_ChoiceAffectsHighlighting = 0

"use :set list! to toggle visible whitespace on/off
" Shortcut to rapidly toggle `set list`

nnoremap <C-l> :set list!<cr>
vnoremap <C-l> :set list!<cr>

set listchars=tab:▸\ ,eol:¬,extends:>,precedes:>,trail:.

" GUI RELATED STUFF
if has("gui_running")
    " On Mac OS
    set guifont=Hack:h12
    " On Ubuntu
    " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    set columns=125
    set lines=50
    set antialias
    set guioptions-=T
else
    set guifont=Hack\ 12
    " If you don't have powerline font in the terminal
    " let g:airline_powerline_fonts = 0
endif



" set pdev=cups-pdf
set printoptions=paper:A4,syntax:y,wrap:y,header:0

" set printexpr=PrintFile(v:fname_in)

" function PrintFile(fname)
"   call system("cupsfilter " . a:fname)
"   call delete(a:fname)
"   return v:shell_error
" endfunc

" NERDCommenter
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
let NERDCompactSexyComs = 1

" ALE
" let g:ale_linters = {}
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0
let g:ale_completion_max_suggestions = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1


" netrw
let g:netrw_altv           = 1
let g:netrw_fastbrowse     = 2
let g:netrw_keepdir        = 0
let g:netrw_liststyle      = 1
let g:netrw_retmap         = 1
let g:netrw_silent         = 1
let g:netrw_special_syntax = 1

" YCM
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_disable_signature_help = 1
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_global_extra_conf.py'
let g:ycm_auto_hover = ''
nmap <leader>h <plug>(YCMHover)
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1

"" PYTHON
au FileType python set nosmartindent autoindent

"" RUBY
au Filetype ruby set softtabstop=2
au Filetype ruby set sw=2
au Filetype ruby set ts=2

"" PERL
au Filetype perl set softtabstop=2
au Filetype perl set sw=2
au Filetype perl set ts=2

"" VUE
au Filetype vue set softtabstop=2
au Filetype vue set sw=2
au Filetype vue set ts=2

"" JAVASCRIPT
au Filetype javascript set softtabstop=2
au Filetype javascript set sw=2
au Filetype javascript set ts=2

"" ERUBY
au Filetype eruby set softtabstop=2
au Filetype eruby set sw=2
au Filetype eruby set ts=2

"" YAML
au Filetype yaml set softtabstop=2
au Filetype yaml set sw=2
au Filetype yaml set ts=2

"" GITGUTTER
set updatetime=1000  " Global vim update time
let g:gitgutter_grep_command = 'ag'
let g:gitgutter_sign_removed = '-'

" molokai colors
"highlight GitGutterAdd    guifg=#009900 guibg=#232526 ctermfg=2 ctermbg=0
"highlight GitGutterChange guifg=#bbbb00 guibg=#232526 ctermfg=3 ctermbg=0
"highlight GitGutterDelete guifg=#ff2222 guibg=#232526 ctermfg=1 ctermbg=0


"" Unite
map <C-p> [unite]p

"" Gutentags
let g:gutentags_ctags_tagfile = '.tags'

"" FZF
" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1
"nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
"nnoremap <silent> <Leader>t :call fzf#vim#tags(expand('<cword>'))<CR>

"" Vue
let g:vue_disable_pre_processors=1


" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" CtrlSF
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_auto_close =
\ { "normal" : 0,
  \ "compact": 1 }

nmap     <leader>af <Plug>CtrlSFPrompt
vmap     <leader>af <Plug>CtrlSFVwordPath
nmap     <leader>ag <Plug>CtrlSFCwordPath<CR>
nnoremap <leader>ao :CtrlSFOpen<CR>
nnoremap <leader>at :CtrlSFToggle<CR>
nnoremap <leader>at <Esc>:CtrlSFToggle<CR>

" AutoPairs
let g:AutoPairsShortcutToggle = '<C-a>p'
let g:AutoPairsShortcutFastWrap = '<C-w>'
let g:AutoPairsShortcutJump = '<C-j>'
let g:AutoPairsShortcutBackInsert = '<C-b>'

