" - - - - - - - - - - - -
" D E P E N D E N C I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
" You need to run ./scripts/install-nvim-dependencies.sh
"
" Then install every plugins with :PluginInstall or :PluginUpdate
"
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" - - - - - - -
" P L U G I N S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
call plug#begin('~/.config/nvim/plugged')

" THEMES AND UI
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

" APPLICATIONS
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'
Plug 'jreybert/vimagit'
Plug 'jceb/vim-orgmode'

" COMMANDS
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-speeddating'
Plug 'soramugi/auto-ctags.vim'

" AUTOCOMP, SNIPPETS AND LANGUAGE SPECIFIC
Plug 'w0rp/ale'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
"" General
Plug 'honza/vim-snippets'
Plug 'j16180339887/Global.vim'
"" VimScript
Plug 'Shougo/neco-vim'
"" HTML
Plug 'gregsexton/MatchTag'
"" CSS
Plug 'othree/csscomplete.vim'
"" PHP
Plug 'StanAngeloff/php.vim'
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/ncm-flow'
Plug 'jbgutierrez/vim-babel'
Plug 'mattn/webapi-vim'
"" "" - React.js
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'justinj/vim-react-snippets'
"" "" - Angular
Plug 'burnettk/vim-angular'
Plug 'matthewsimo/angular-vim-snippets'
"" TypeScript"
Plug 'leafgarland/typescript-vim'
"" Python
Plug 'davidhalter/jedi-vim'


call plug#end()
filetype plugin indent on

" - - - - - - - - - - - - - - - - - - - - - -
" T H E M E   & &   U S E R I N T E R F A C E \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
syntax enable
set encoding=utf-8
set fileencoding=utf-8
set wildmenu
set relativenumber
set hlsearch
set noerrorbells
set showmatch
set novisualbell
set cursorline
set ttimeoutlen=10
hi Comment cterm=bold
set background=dark
colorscheme space-vim-dark
set colorcolumn=80
highlight ColorColumn ctermbg=234
highlight Normal ctermbg=black

" - - - - - - - - - - - - - - - - - -
" F E E L S   & &   U T I L I T I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
set autoread
set ignorecase
set nobackup
set nowb
set noswapfile
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set foldenable
set foldmethod=indent
set foldlevelstart=20
set splitbelow
set splitright
set scrolloff=2
set clipboard+=unnamedplus
set undofile
set undodir=~/.nvim/undo
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" - - - - - - - - - - - - - - - - -
" L A N G U A G E S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
" General
" -Omnicompletion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

set cot-=preview

" PHP
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php LanguageClientStart
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


" PYTHON
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" JavaScript
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1

" - - - - - - - - - - - - - - -
" P L U G I N S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'

" nvim-completion-manager
let g:cm_refresh_length = 1
let g:cm_matcher_module = "cm_matchers.fuzzy_matcher"

" Ultisnips
let g:UltiSnipsExpandTrigger		= "<C-L>"
let g:UltiSnipsJumpForwardTrigger	= "<C-S-J>"
let g:UltiSnipsJumpBackwardTrigger	= "<C-S-K>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetsDir="~/comfy_guration/dotfiles/custom_snips"
let g:UltiSnipsSnippetsDirectories=["UltiSnips", "~/.config/nvim/UltiSnips"]

" Auto Ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', 'node_modules']
let g:auto_ctags_tags_args = '-R *'

" Ale
highlight ALEError ctermbg=196 ctermfg=232
highlight ALEWarning ctermbg=226 ctermfg=232
let g:ale_linters = {
\  'javascript': ['eslint']
\}


" - - - - - - - - - - - - - -
" C U S T O M   M A P P I N G \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
let mapleader = "\<Space>"

" Disable C-Z
nnoremap <c-z> <nop>

" Hide search highlight
nnoremap <leader>/ :nohlsearch<CR>

" Start help command in vertical split
nnoremap <leader>h :vert h<space>

" Paste global clipboard to another line
nnoremap <leader>p o<ESC>"+p
nnoremap <leader>P O<ESC>"+p

" Move lines
nnoremap <C-K> ddkP
nnoremap <C-J> ddp
vnoremap <C-K> dkP`[V`]
vnoremap <C-J> dp`[V`]

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" Highlight same variable
nnoremap <leader>* *``

" Manipulate terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-D> <c-\><c-n>:Bclose!<CR>
tnoremap <C-A> pwd\|xclip -selection clipboard<CR><C-\><C-n>:cd <C-r>+<CR>

" Applications toggle A-
nnoremap <Leader>au :MundoToggle<CR>
nnoremap <Leader>an :NERDTreeToggle<CR>
nnoremap <Leader>ap :CtrlP<CR>
nnoremap <Leader>ag :Magit<CR>
nnoremap <Leader>att :te<CR>
nnoremap <Leader>ata :e \| lcd %:p:h \| term<CR>

" Manipulate windows W-
nnoremap <leader>wd <C-W>q
nnoremap <leader>wv <C-W>v
nnoremap <leader>ws <C-W>s
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>wJ <C-W><S-J>
nnoremap <leader>wK <C-W><S-K>
nnoremap <leader>wL <C-W><S-L>
nnoremap <leader>wH <C-W><S-H>
nnoremap <leader>wrj :resize +5<CR>
nnoremap <leader>wrk :resize -5<CR>
nnoremap <leader>wrh :vertical resize +5<CR>
nnoremap <leader>wrl :vertical resize -5<CR>
nnoremap <leader>wr= <C-W>=

" Manipulate tabs T-
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tt :tabonly<CR>
nnoremap <leader>tn :tabnew %<CR>

" Manipulate buffers B-
nnoremap <leader>bb :ls<CR>:b<space>
nnoremap <leader>bt <C-^>
nnoremap <leader>bd :Bclose!<CR>
nnoremap <leader>bo :bufdo bd<CR>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" Error E-
nnoremap <leader>ek :ALEPrevious<CR>
nnoremap <leader>ej :ALENext<CR>

" Toggling between languages L-
nnoremap <leader>lh :set ft=html<CR>
nnoremap <leader>lp :set ft=php<CR>
nnoremap <leader>lj :set ft=javascript<CR>

" Open important files O-
nnoremap <leader>od :e ~/comfy_guration/dotfiles/init.vim<CR>
nnoremap <leader>oa :e ~/.agenda.org<CR>
