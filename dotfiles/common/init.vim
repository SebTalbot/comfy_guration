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
Plug 'brentyi/vim-nerdtree-syntax-highlight'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " Needs golang
Plug 'flrnd/plastic.vim'
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arzg/vim-colors-xcode'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'arcticicestudio/nord-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

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
Plug 'AndrewRadev/splitjoin.vim'

" AUTOCOMP, SNIPPETS AND LANGUAGE SPECIFIC
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neco-vim'
" Plug 'neoclide/coc-neco',
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'xavierchow/vim-swagger-preview'

"" Javascript
" Plug 'jelera/vim-javascript-syntax'
""" React / JSX
" Plug 'mxw/vim-jsx'
" Plug 'epilande/vim-react-snippets'
" Plug 'mattn/emmet-vim'
" Plug 'Valloric/MatchTagAlways'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
""" Typescript
" Plug 'SebTalbot/yats.vim'
""" GraphQL
" Plug 'jparise/vim-graphql'
""" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
""" Ruby
" Plug 'vim-ruby/vim-ruby'

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
  highlight NonText guifg=#B73C33
else
  colorscheme spaceduck
  let g:airline_theme = 'spaceduck'
  highlight Visual guibg=#b3a1e6 guifg=#1b1c36
  highlight LineNr guifg=#686f9a
  highlight Comment gui=bold guibg=none guifg=#686f9a 
endif
highlight Normal guibg=none
highlight NonText guifg=#e1e1e1 guibg=none
highlight CocErrorHighlight guifg=#e33400
highlight CocWarningHighlight guifg=#f3aaaa

" - - - - - - - - - - - - - - - - - -
" F E E L S   & &   U T I L I T I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
set autoread
set clipboard+=unnamedplus
set expandtab
set foldenable
set foldlevelstart=20
set foldmethod=syntax
let javaScript_fold=1
set hidden
set ignorecase
set nobackup
set noswapfile
set nowb
set pumblend=20
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

autocmd FileType json set conceallevel=0

" treesitter
lua <<EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = "javascript.jsx"

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {  },
  highlight = {
    enable = true,
    disable = {},
  },
}
EOF

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

" Lens
let g:lens#disabled = 1
let g:lens#disabled_filetypes = ['Mundo', 'MundoDiff', 'GV', 'git']
let g:lens#width_resize_max = 200
let g:lens#width_resize_min = 80

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeMinimalUI=1
" let NERDTreeWinSizeMax= 100
let NERDTreeIgnore=['\.tests\.', '\.test\.']
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:appendArtifactFix = 0
let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*test(s|).ts$'] = 'FE405F'

" CoC
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-eslint',
	\ 'coc-highlight',
	\ 'coc-html',
	\ 'coc-java',
	\ 'coc-json',
	\ 'coc-prettier',
	\ 'coc-python',
  \ 'coc-solargraph',
	\ 'coc-snippets',
	\ 'coc-tsserver'
\ ]

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
function! BuffersToCloseList()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction
com! BCloseMultiple call fzf#run(fzf#wrap({
  \ 'source': BuffersToCloseList(),
  \ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
let g:fzf_layout = { 'down': '~40%' }

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
      \      'init': ['call termopen("zsh", {"detach": 0})'],
      \      'sz': 22,
      \    }
      \  }
      \]

" Hexokinase
let g:Hexokinase_refreshEvents = ['BufWrite', 'BufCreate']
let g:Hexokinase_highlighters = ['foregroundfull']
let g:Hexokinase_highlighters = ['backgroundfull']

" IndentLine
autocmd Filetype json let g:indentLine_setConceal = 0

" MARKDOWN CONCEAL
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
set conceallevel=0

" LaTeX Live Preview
let g:livepreview_previewer = '~/comfy_guration/scripts/mupdf_inotif'
let g:livepreview_engine = 'pdflatex'

" - - - - - - - - - - - - - -
" C U S T O M   M A P P I N G \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
let mapleader = "\<Space>"

" Disable mapping
nnoremap Q <nop>
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
nnoremap <Leader>afp :CocCommand prettier.formatFile<CR>
nnoremap <Leader>afe :CocCommand eslint.executeAutofix<CR>
nnoremap <Leader>ann :NERDTreeFind<CR>
nnoremap <Leader>anq :NERDTreeClose<CR>
nnoremap <Leader>ant :NERDTreeToggle<CR>
nnoremap <Leader>ar :CocCommand workspace.renameCurrentFile<CR>
nnoremap <Leader>at :VwmToggle term<CR>
nnoremap <Leader>au :call lens#toggle()<CR>:MundoToggle<CR>
nnoremap <Leader>asw <Plug>GenerateDiagram

" Search S-
nnoremap <Leader>sa :Ag<CR>
nnoremap <Leader>sb :Buffers<CR>
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
nnoremap <Leader>wrr :call lens#run()<CR>
nnoremap <Leader>wre <C-W>=
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v

" Manipulate tabs T-
" nnoremap <Leader>td :tabclose<CR>
" nnoremap <Leader>tn :tabnew %<CR>
" nnoremap <Leader>tt :tabonly<CR>

" Manipulate buffers B-
nnoremap <Leader>bb :e#<CR>
nnoremap <Leader>bdo :BufOnly<CR>
nnoremap <Leader>bdd :Bclose!<CR>
nnoremap <Leader>bdl :BCloseMultiple<CR>
nnoremap <Leader>bl :Buffers<CR>
nnoremap <Leader>bp :bp<CR>:call lens#run()<CR>
nnoremap <Leader>bn :bn<CR>:call lens#run()<CR>

" CoC
imap <C-l> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <C-Space> coc#refresh()
" nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
" vmap <C-n> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

" - errors E-
nmap <silent> <Leader>eN <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>eP <Plug>(coc-diagnostic-prev-error)
nmap <silent> <Leader>ee <Plug>(coc-diagnostic-info)
nmap <silent> <Leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>ep <Plug>(coc-diagnostic-prev)

" - LSP L-
nmap <Leader>lc <Plug>(coc-rename)
nmap <silent> <Leader>ld :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> <Leader>li :call CocActionAsync('jumpImplementation', v:false)<CR>
nmap <silent> <Leader>ll ea<C-Space>
nmap <silent> <Leader>lr :call CocActionAsync('jumpReferences', v:false)<CR>
nmap <silent> <Leader>lt :call CocActionAsync('jumpTypeDefinition', v:false)<CR>
nmap <silent> <Leader>lw :call CocActionAsync('jumpDeclaration', v:false)<CR>

" Git G-
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
nmap <Leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <Leader>ghs <Plug>(GitGutterStageHunk)
nmap <Leader>ghu <Plug>(GitGutterUndoHunk)
nmap <Leader>gdh :diffget //2 | diffupdate
nmap <Leader>gdl :diffget //3 | diffupdate

" Open important files O-
nnoremap <Leader>ob :e ~/.zshrc<CR>G
nnoremap <Leader>oi :e ~/.config/i3/config<CR>G
nnoremap <Leader>oc :e ~/.config/nvim/coc-settings.json<CR>G
nnoremap <Leader>od :e ~/.config/nvim/init.vim<CR>G
