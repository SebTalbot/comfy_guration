" - - - - - - - - - - - -
" D E P E N D E N C I E S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" - - - - - - -
" P L U G I N S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"
call plug#begin('~/.config/nvim/plugged')

" THEMES AND UI
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

" APPLICATIONS
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'
Plug 'jreybert/vimagit'

" COMMANDS
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" AUTOCOMP, SNIPPETS AND LANGUAGE SPECIFIC

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
set showmatch
set noerrorbells
set novisualbell
set cursorline
set ttimeoutlen=10
set background=dark
colorscheme gruvbox
set colorcolumn=80
highlight Comment cterm=bold
highlight Normal ctermbg=black
highlight ColorColumn ctermbg=6

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
set shada="NONE"
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" - - - - - - - - - - - - - - - - -
" L A N G U A G E S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" - - - - - - - - - - - - - - -
" P L U G I N S   C O N F I G S \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
"

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='violet'

" CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = 'node_modules\|git'


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

" Toggling between languages L-
nnoremap <leader>lh :set ft=html<CR>
nnoremap <leader>lp :set ft=php<CR>
nnoremap <leader>lj :set ft=javascript<CR>

" Open important files O-
nnoremap <leader>od :e ~/.config/nvim/init.vim<CR>
