
"""_____________GENERAL________________"""
set shell=/bin/fish 
"set the side numbers
:set number
"set relstiv numbers
":set relativenumber
"for the sidecolumn next n to the numbers
set signcolumn=yes

"enable mouse
set mouse=a

"use system clipboard with p and y 
set clipboard=unnamedplus


"for complition like IDE
set completeopt=noinsert,menuone,noselect
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Turn syntax highlighting on.
syntax on

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=8

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

"encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"for shorter delays
set updatetime=100

" disable vi compatibility
:set nocompatible

" highlight search
:set hlsearch

"tap=4
":set tabstop=4

"indent a new line the same as the line befor
:set autoindent
":set cc=80

" highlight cursorline
:set cursorline

"faster scrolling
:set ttyfast

"split window right
:set splitright
":set splitbelow

"for 256 color support
set t_Co=256

"set the vim theme
colorscheme molokai
"for transparensy.
"hi Normal guibg=NONE ctermbg=NONE
set termguicolors

"""_____________TERMINAL________________"""

"open a terminal window below
:nnoremap <leader>t :wincmd b  bel terminal<CR>



"""_____________MOVEMENT________________"""
" move split panes to left/bottom/top/right
 nnoremap <A-h> <C-W>H
 nnoremap <A-j> <C-W>J
 nnoremap <A-k> <C-W>K
 nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

"""_____________AIRLINE_________________"""

"airline theme (status bar).
let g:airline_theme='jellybeans'




"""______________NERDTRE________________"""

" nerdtree :
" ctrl+t nerdtree toggle.
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
" ctrl+f to focus
nnoremap <silent> <C-f> :NERDTreeFocus<CR>

"for hidden files
let NERDTreeShowHidden=1

"expand and collapse 
"let g:NERDTreeDirArrowCollapsible = '📂'
"let g:NERDTreeDirArrowExpandable = '📁'

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif






"""________________TAGBAR__________________"""
" ctrl+b to toggle
nnoremap <silent> <C-b> :TagbarToggle<CR>

"lua(require'lspconfig'.pyls.setup{})
"open the nerdtree window when opening up Nvim, but put the cursor in the file-editing window.
"augroup nerdtree_open
 "   autocmd!
  "  autocmd VimEnter * NERDTree | wincmd p
"augroup END
"
"
"
"
call plug#begin()


		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'ap/vim-css-color' 								"for color preview 
		Plug 'ryanoasis/vim-devicons'
call plug#end()




"""_______________coc_____________________"""


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



