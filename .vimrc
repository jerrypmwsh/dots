" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" File tree explorer
Plug 'preservim/nerdtree'

" file search
Plug 'ctrlpvim/ctrlp.vim'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Git plugin - fugitive
Plug 'tpope/vim-fugitive'

" tagbar
Plug 'majutsushi/tagbar'

" code completion with coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Black python formatter
Plug 'psf/black'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 

" Initialize plugin system
call plug#end()

:set relativenumber

" Autostart NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" NERDTree snap to current file
map <C-o> :NERDTreeToggle %<CR>


" ctrlp show hidden files
:let g:ctrlp_show_hidden = 1

" ctrlp search ctags toggle
nnoremap <leader>. :CtrlPTag<cr>

" yank to clipboard
set clipboard+=unnamedplus

" Black formatter key
nnoremap <ff> :Black<CR>

" Yaml formatting
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>

" Go formatting + imports
let g:go_fmt_command = "goimports"
