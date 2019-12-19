" - - - - - - - - - - - -
" D E P E N D E N C I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" - - - - - - -
" P L U G I N S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" /!\ ------------------------------------/!\
"     DON'T FORGET TO :UpdateRemotePlugins
" /!\ ------------------------------------/!\

call plug#begin('~/.config/nvim/plugged')

" THEMES AND UI
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " Needs golang
Plug 'flrnd/plastic.vim'


" APPLICATIONS
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SebTalbot/vwm.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" COMMANDS
Plug 'rbgrouleff/bclose.vim'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" AUTOCOMP, SNIPPETS AND LANGUAGE SPECIFIC
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco',
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs'

"" Javascript
Plug 'jelera/vim-javascript-syntax'
""" React / JSX
Plug 'mxw/vim-jsx'
" Broke typescript syntax highlight
Plug 'epilande/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
""" Typescript
Plug 'SebTalbot/yats.vim'
""" GraphQL
Plug 'jparise/vim-graphql'

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
set colorcolumn=80
set termguicolors

if $CURRENT_DEVICE == 'laptop'
  colorscheme gruvbox
  highlight Identifier guifg=#458588
  highlight Identifier gui=bold
  highlight Symbol guifg=#FE8019
  highlight Symbol gui=bold
  let g:terminal_ansi_colors = [
        \ '#182725',
        \ '#B73C33',
        \ '#AD6143',
        \ '#A8A392',
        \ '#C08552',
        \ '#AA632F',
        \ '#5D5E5A',
        \ '#A89984',
        \ '#888A85',
        \ '#B73C33',
        \ '#AD6143',
        \ '#A8A392',
        \ '#C08552',
        \ '#AA632F',
        \ '#5D5E5A',
        \ '#D8C5B8',
     \ ]
else
  colorscheme space-vim-dark
  highlight CursorLine guibg=#131517
  highlight ColorColumn guibg=#131517
  highlight Identifier guifg=#D75F87
  highlight Identifier gui=bold
  highlight Symbol guifg=#4FC7D3
  highlight Symbol gui=bold
  let g:airline_theme='violet'
  let g:terminal_ansi_colors = [
        \ '#1E1E1E',
        \ '#B73C33',
        \ '#20AD80',
        \ '#D75F87',
        \ '#4F97D7',
        \ '#875FAF',
        \ '#4FC7D7',
        \ '#D9E9E7',
        \ '#888A85',
        \ '#B73C33',
        \ '#20AD80',
        \ '#D75F87',
        \ '#4F97D7',
        \ '#875FAF',
        \ '#4FC7D7',
        \ '#D9E9E7',
     \ ]
endif

highlight Comment gui=bold
highlight Normal guibg=none
highlight NonText guibg=none

highlight CocErrorHighlight guifg=#FF0000

for i in range(16)
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
endfor
unlet! g:terminal_ansi_colors

" - - - - - - - - - - - - - - - - - -
" F E E L S   & &   U T I L I T I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
set autoread
set clipboard+=unnamedplus
set expandtab
set foldenable
set foldlevelstart=20
set foldmethod=indent
set hidden
set ignorecase
set nobackup
set noswapfile
set nowb
set scrolloff=2
set shada="NONE"
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=2
set timeoutlen=5000
set undodir=~/.nvim/undo
set undofile
set updatetime=100
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
if has("autocmd")
  autocmd BufWritePre * :silent !mkdir -p %:p:h
end

" - - - - - - - - - - - - - - - - -
" L A N G U A G E S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" Javascript
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1
set path=.,src

" GraphQl
autocmd BufNewFile,BufRead *.prisma   set syntax=graphql

" - - - - - - - - - - - - - - -
" P L U G I N S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeMinimalUI=1
let NERDTreeWinSizeMax= 100
let NERDTreeIgnore=['\.tests\.']

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:appendArtifactFix = 0

let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*tests.ts$'] = 'FE405F'

" CoC
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Airline
set laststatus=2
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
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right'), <bang>0)
com! -bar -bang AgWithoutDir call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right'), <bang>0)
com! -bar -bang FilesPreview call fzf#vim#files(<q-args>, fzf#vim#with_preview('right'), <bang>0)

" GitGutter
let g:gitgutter_map_keys = 0

" UltiSnip
let g:UltiSnipsEditSplit="vertical"

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

" Hexokinase
let g:Hexokinase_refreshEvents = ['BufWrite', 'BufCreate']
let g:Hexokinase_highlighters = ['foregroundfull']
let g:Hexokinase_highlighters = ['backgroundfull']


" - - - - - - - - - - - - - -
" C U S T O M   M A P P I N G \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
let mapleader = "\<Space>"

" Disable mapping
nnoremap <c-z> <nop>
vnoremap u gv

" Hide search highlight
nnoremap <Leader>/ :nohlsearch<CR>

" Start help command in vertical split
nnoremap <Leader>h :vert h<space>

" Move lines
nnoremap <C-J> ddp
nnoremap <C-K> ddkP
vnoremap <C-J> dp`[V`]
vnoremap <C-K> dkP`[V`]

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" Highlight same variable
nnoremap <Leader>* *``

" Manipulate terminal
tnoremap <C-A> pwd\|xclip -selection clipboard<CR><C-\><C-n>:cd <C-r>+<CR>
tnoremap <C-D> <c-\><c-n>:Bclose!<CR>
tnoremap <Esc> <C-\><C-n>

" Yank Y-
nnoremap <Leader>yf :let @+ = expand('%:t:r')<CR>
nnoremap <Leader>yy :let @+ = expand('%:r')<CR>

" Applications toggle A-
nnoremap <Leader>ac :ColorToggle<CR>
nnoremap <Leader>af :CocCommand prettier.formatFile<CR>
nnoremap <Leader>ann :NERDTreeFind<CR>
nnoremap <Leader>anq :NERDTreeClose<CR>
nnoremap <Leader>ant :NERDTreeToggle<CR>
nnoremap <Leader>ar :CocCommand workspace.renameCurrentFile<CR>
nnoremap <Leader>at :VwmToggle term<CR>
nnoremap <Leader>au :MundoToggle<CR>

" Search S-
nnoremap <Leader>sa :Ag<CR>
nnoremap <Leader>sb :CtrlPBuffer<CR>
nnoremap <Leader>sf :FilesPreview<CR>!node_modules !.tests.<Space>
nnoremap <Leader>ss :AgWithoutDir<CR>
nnoremap <Leader>st :FilesPreview<CR>!node_modules '.tests.<Space>

" Manipulate windows W-
nnoremap <Leader>wH <C-W><S-H>
nnoremap <Leader>wJ <C-W><S-J>
nnoremap <Leader>wK <C-W><S-K>
nnoremap <Leader>wL <C-W><S-L>
nnoremap <Leader>wd <C-W>q
nnoremap <Leader>wh <C-W><C-H>
nnoremap <Leader>wj <C-W><C-J>
nnoremap <Leader>wk <C-W><C-K>
nnoremap <Leader>wl <C-W><C-L>
nnoremap <Leader>wrh :vertical resize +5<CR>
nnoremap <Leader>wrj :resize +5<CR>
nnoremap <Leader>wrk :resize -5<CR>
nnoremap <Leader>wrl :vertical resize -5<CR>
nnoremap <Leader>wrr <C-W>=
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v

" Manipulate tabs T-
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>tn :tabnew %<CR>
nnoremap <Leader>tt :tabonly<CR>

" Manipulate buffers B-
nnoremap <Leader>bb :e#<CR>
nnoremap <Leader>bd :Bclose!<CR>
nnoremap <Leader>bl :ls<CR>:b<space>
nnoremap <Leader>bo :BufOnly<CR>
nnoremap <Leader>bt <C-^>
nnoremap gB :bp<CR>
nnoremap gb :bn<CR>

" CoC
imap <C-l> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <C-Space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
" - errors E-
nmap <silent> <Leader>eJ <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>eK <Plug>(coc-diagnostic-prev-error)
nmap <silent> <Leader>ee <Plug>(coc-diagnostic-info)
nmap <silent> <Leader>ej <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>ek <Plug>(coc-diagnostic-prev)
" - LSP L-
nmap <Leader>lc <Plug>(coc-rename)
nmap <silent> <Leader>ld <Plug>(coc-definition)
nmap <silent> <Leader>li <Plug>(coc-implementation)
nmap <silent> <Leader>ll ea<C-Space>
nmap <silent> <Leader>lr <Plug>(coc-references)
nmap <silent> <Leader>lt <Plug>(coc-type-definition)
nmap <silent> <Leader>lw <Plug>(coc-declaration)

" vmap <C-n> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

" Git
" nnoremap <Leader>gg :G<CR>
" nnoremap <Leader>gd :Gdiff<CR>
" nnoremap <Leader>gc :Gcommit<CR>
" nnoremap <Leader>gp :Gpush<CR>
" nnoremap <Leader>gl :Gpull<CR>
" nnoremap <Leader>gf :Gfetch<CR>
" nnoremap <Leader>gs :GitGutterStageHunk<CR>
" nnoremap <Leader>gj :GitGutterNextHunk<CR>
" nnoremap <Leader>gk :GitGutterPrevHunk<CR>
" nnoremap <Leader>gha :GV<CR>
" nnoremap <Leader>ghc :GV!<CR>

" Open important files O-
nnoremap <Leader>ob :e ~/.bashrc<CR>G
nnoremap <Leader>oc :e ~/.config/nvim/coc-settings.json<CR>G
nnoremap <Leader>od :e ~/comfy_guration/dotfiles/init.vim<CR>G
nnoremap <Leader>os :e ~/comfy_guration/dotfiles/custom_snips/
