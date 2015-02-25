    "runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()
call plug#begin('~/.vim/plugged')

" Load
" Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'eiginn/netrw'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/TaskList.vim', { 'on': 'TaskList' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'http://git.code.sf.net/p/vim-latex/vim-latex', { 'for':  'tex' }
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }


call plug#end()


syntax on
filetype plugin indent on

let g:plug_timeout = 10000

" Only for MacVim
let $PATH=$PATH . ':/usr/local/bin:/usr/bin'

" work with windows
noremap <C-Left>  :wincmd h<CR>
noremap <C-Down>  :wincmd j<CR>
noremap <C-Up>    :wincmd k<CR>
noremap <C-Right> :wincmd l<CR>

noremap <C-d> :vertical resize +5<CR>
noremap <C-f> :vertical resize -5<CR>
" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

let mapleader = ","

" map sort function to a key
vnoremap <leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"" minibufexpl stuff
" If you like control + arrow key to navigate windows
" then perform the remapping
"
"noremap <C-Down>  <C-W>j
"noremap <C-Up>    <C-W>k
"noremap <C-Left>  <C-W>h
"noremap <C-Right> <C-W>l

" If you like <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
"
" noremap <C-TAB>   :MBEbn<CR>
" noremap <C-S-TAB> :MBEbp<CR>
"
" Or, in MRU fashion
"
"noremap <C-TAB>   :MBEbf<CR>
"noremap <C-S-TAB> :MBEbb<CR>

"let g:miniBufExplCycleArround = 1

" map <Leader>to :MBEOpen<cr>
" map <Leader>tc :MBEClose<cr>
"map <Leader>tt :MBEToggle<cr>


" tasklist de ambiguate
" map <leader>td <Plug>TaskList

"gundo
map <leader>g :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 40
let g:gundo_right = 0


"let g:pyflakes_use_quickfix = 0

" let g:pep8_map='<leader>8'

"if has('macunix')
"    " Yank text to the OS X clipboard
    noremap <leader>y "*y
    noremap <leader>yy "*Y
"end

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"" PYTHON
au FileType python set omnifunc=pythoncomplete#Complete

au FileType python set nosmartindent autoindent
" au FileType python let &path = &path . "," . substitute($PYTHONPATH, ';', ',', 'g')


"rope
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

" django
" map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"pytest
" Execute the tests
" nmap <silent><Leader>tf <Esc>:Pytest file<CR>
" nmap <silent><Leader>tc <Esc>:Pytest class<CR>
" nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" " cycle through test errors
" nmap <silent><Leader>tn <Esc>:Pytest next<CR>
" nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
" nmap <silent><Leader>te <Esc>:Pytest error<CR>

"" virtualenv
"" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

"" powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
"let g:powerline_theme='short'

"" airline
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme='molokai'
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


" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>dts :call TrimWhiteSpace()<CR>

"" nerdtree
map <leader>n :NERDTreeToggle<CR>

" ack (fuzzy search)
nmap <leader>a <Esc>:Ack!

" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set shortmess=at
set t_Co=256
"" older stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wrap
set textwidth=79
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

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


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

"map <C-L> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
"set tags=~/.vim/stdtags,tags,.tags,../tags
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"if has("autocmd")
"" When editing a file, always jump to the last cursor position
""   autocmd BufReadPost *
""     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"\   exe "normal g'\"" |
"\ endif
"endif

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

if v:version >= 700 && has("gui_running")
    set cursorline   "highlight current line
    "set cursorcolumn "highlight current column
endif

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
    syntax on
    set nohlsearch
    set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
    "I'm only interested in diff colours
    syntax off
endif

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1

set shell=/bin/zsh

if version >= 703
    set undofile
    set undodir=$HOME/.vim-undos/
endif

set shellslash

"" LATEX
let g:tex_flavor='latex'
let g:tex_indent_items = 1

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,dvi'

let g:Tex_CompileRule_dvi = '/usr/texbin/latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = '/usr/texbin/pdflatex -synctex=1 --interaction=nonstopmode $*'

let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = '/usr/texbin/dvipdfm $*.dvi'
"if has('macunix')
"    let g:Tex_ViewRule_dvi = 'texniscope'
"    let g:Tex_ViewRule_ps = 'Preview'
"    let g:Tex_ViewRule_pdf = 'Skim'
"else

"endif
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

"" CLOJURE
"let vimclojure#HighlightBuiltins = 1
"set statusline+=%(%{Tlist_Get_Tagname_By_Line()}%), " Function name
"set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" erlang
" " ERLANG STUFF
"let g:erlangHighlightBif=1
"let g:erlangManPath="/usr/local/Cellar/erlang/R14B03/share/man"

" Gist plugin
"let g:gist_detect_filetype = 1
"let g:gist_open_browser_after_post = 1

let g:molokai_original = 0
colorscheme molokai

"set background=light
"colorscheme solarized

" let g:ShowTrailingWhitespace_FilterFunc = ''
" let g:ShowTrailingWhitespace_FilterFunc = function('MyFunc')

"let g:DeleteTrailingWhitespace_Action = 'ask'
"let g:DeleteTrailingWhitespace_ChoiceAffectsHighlighting = 0


"highlight ShowTrailingWhitespace term=standout ctermbg=Red guibg=Red


"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
" highlight RedundantSpaces term=standout ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

"highlight ShowTrailingWhitespace term=standout ctermbg=Red guibg=Red
" let g:ShowTrailingWhitespace = 0
" let g:ShowTrailingWhitespace_FilterFunc = ''
" let g:ShowTrailingWhitespace_FilterFunc = function('MyFunc')

nnoremap <Leader>d$ :<C-u>%DeleteTrailingWhitespace<CR>
vnoremap <Leader>d$ :DeleteTrailingWhitespace<CR>

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
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    " On Ubuntu
    " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    set columns=110
    set lines=50
    set antialias
    set guioptions-=T
else
    set guifont=DejaVu\ Sans\ Mono\ 10
    let g:airline_powerline_fonts = 0
endif


" delimitMate Stuff
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" set pdev=cups-pdf
set printoptions=paper:A4,syntax:y,wrap:y,header:0

" set printexpr=PrintFile(v:fname_in)

" function PrintFile(fname)
"   call system("cupsfilter " . a:fname)
"   call delete(a:fname)
"   return v:shell_error
" endfunc

" NERDCommenter Stuff
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
let NERDCompactSexyComs = 1

" " Supertab
" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabContextDefaultCompletionType = '<c-p>'
" let g:SuperTabNoCompleteAfter = ['^',',','\s',';',':','{','[','(']
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery =
"     \ ['&completefunc:<c-x><c-u>', '&omnifunc:<c-x><c-o>']
"   autocmd FileType *
"     \ if &omnifunc != '' |
"     \   call SuperTabChain(&omnifunc, '<c-p>') |
"     \   call SuperTabSetDefaultCompletionType("context") |
"     \ endif

" Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_checkers = ['pylint', 'pep8']
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_python_pylint_quiet_messages = { "type":  "style",
                                               \ "regex": '^\[invalid-name\][a-zA-Z\ \-_\"]*' }
" vim-markdown
let g:vim_markdown_folding_disabled = 1


" neocomplete

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 0

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" netrw
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 1
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
