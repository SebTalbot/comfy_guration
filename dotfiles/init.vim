" - - - - - - - - - - - -
" D E P E N D E N C I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
let g:python_host_prog = '/usr/bin/python'

" - - - - - - -
" P L U G I N S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
call plug#begin('~/.config/nvim/plugged')

" THEMES AND UI
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/space-vim-dark'
Plug 'chrisbra/Colorizer'

" APPLICATIONS
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SebTalbot/vwm.vim'
Plug 'airblade/vim-gitgutter'

" COMMANDS
Plug 'rbgrouleff/bclose.vim'
Plug 'schickling/vim-bufonly'
Plug 'danro/rename.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" AUTOCOMP, SNIPPETS AND LANGUAGE SPECIFIC
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'python',
    \ 'html' ] }
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pyls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'SirVer/ultisnips'

"" Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
""" React / JSX
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'justinj/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
""" Typescrip
Plug 'ianks/vim-tsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

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
set nu
set hlsearch
set showmatch
set noerrorbells
set novisualbell
set cursorline
set ttimeoutlen=10
set background=dark
set colorcolumn=80
set colorcolumn=80

if $CURRENT_DEVICE == 'laptop'
  colorscheme gruvbox
  highlight Identifier ctermfg=66
  highlight Identifier cterm=bold
else
  colorscheme space-vim-dark
  highlight CursorLine ctermbg=237
  highlight ColorColumn ctermbg=237
  highlight Identifier ctermfg=5
  highlight Identifier cterm=bold
endif

highlight Comment cterm=bold
highlight Normal ctermbg=NONE

" - - - - - - - - - - - - - - - - - -
" F E E L S   & &   U T I L I T I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
set updatetime=100
set autoread
set ignorecase
set smartcase
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
set shada="NONE"
set timeoutlen=5000
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
if has("autocmd")
  autocmd BufWritePre * :silent !mkdir -p %:p:h
end

" - - - - - - - - - - - - - - - - -
" L A N G U A G E S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" Coc
" call coc#add_extension('coc-json', 'coc-tsserver', 'coc-prettier', 'coc-pyls', 'coc-css', 'coc-list', 'coc-emmet')

" Javascript
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1
set path=.,src
set suffixesadd=.js,.jsx

" - - - - - - - - - - - - - - -
" P L U G I N S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=['\.tests\.']

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" Airline
set laststatus=2
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_regexp = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v.(node_modules)',
  \ 'file': '\v.(\.tests\.)',
  \ }

fun! g:CtrlP_set_general_ignore()
  let general_ignore = '\v.(\.tests\.)'
  if g:ctrlp_custom_ignore.file != general_ignore
    let g:ctrlp_custom_ignore.file = general_ignore
    call ctrlp#clr()
  endif
 endfun

fun! g:CtrlP_set_test_ignore()
  let general_ignore = '\v(\.tests\.ts)@<!$'
  if g:ctrlp_custom_ignore.file != general_ignore
    let g:ctrlp_custom_ignore.file = general_ignore
    call ctrlp#clr()
  endif
 endfun

" Bclose
let g:bclose_no_plugin_maps = 1

" FZF
com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right'), <bang>0)

" GitGutter
let g:gitgutter_map_keys = 0

" Rainbow Pairs
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" UltiSnip
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" VWM
let g:vwm#layouts = [
      \  {
      \    'name': 'term',
      \    'bot':
      \    {
      \      'init': ['call termopen("bash", {"detach": 0})'],
      \      'sz': 22,
      \    }
      \  }
      \]

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
nnoremap <Leader>ann :NERDTreeFind<CR>
nnoremap <Leader>anq :NERDTreeClose<CR>
nnoremap <Leader>ant :NERDTreeToggle<CR>
nmap <Leader>af <Plug>(PrettierAsync)
nnoremap <Leader>at :VwmToggle term<CR>
nnoremap <leader>ac :ColorToggle<CR>

" Search
nnoremap <Leader>sf :call CtrlP_set_general_ignore()<CR>:CtrlP<CR>
nnoremap <Leader>sb :CtrlPBuffer<CR>
nnoremap <Leader>st :call CtrlP_set_test_ignore()<CR>:CtrlP<CR>
nnoremap <leader>ss :Ag<CR>

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
nnoremap <leader>wrr <C-W>=

" Manipulate tabs T-
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tt :tabonly<CR>
nnoremap <leader>tn :tabnew %<CR>

" Manipulate buffers B-
nnoremap <leader>bb :e#<CR>
nnoremap <leader>bl :ls<CR>:b<space>
nnoremap <leader>bt <C-^>
nnoremap <leader>bd :Bclose!<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" CoC
inoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> <leader>ek <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ej <Plug>(coc-diagnostic-next)
nmap <silent> <leader>le <Plug>(coc-diagnostic-info)
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>ly <Plug>(coc-type-definition)
nmap <silent> <leader>lw <Plug>(coc-declaration)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <leader>lc <Plug>(coc-rename)
nmap <leader>lff  <Plug>(coc-format-selected)
nmap <leader>lff  <Plug>(coc-format-selected)
nmap <leader>lfb  <Plug>(coc-format)
nmap <silent> <leader>ll ea<C-Space>

" Open important files O-
nnoremap <leader>od :e ~/comfy_guration/dotfiles/init.vim<CR>G
noremap <leader>ob :e ~/.bashrc<CR>G
