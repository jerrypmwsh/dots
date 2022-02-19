" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" File tree explorer
Plug 'preservim/nerdtree'

" file search
" Plug 'ctrlpvim/ctrlp.vim'

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

" terraform
Plug 'hashivim/vim-terraform'
Plug 'yorinasub17/vim-terragrunt'

" Javascript
Plug 'yuezk/vim-js'

" Typescript
Plug 'leafgarland/typescript-vim'

" React
Plug 'maxmellon/vim-jsx-pretty'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" remap leader key to space
let mapleader = " " " map leader to Space
map <leader>t :GoTest<CR>

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

" terraformat on save
let g:terraform_fmt_on_save=1


" ######### Editor Settings

" set the ctags file
set tags=./tags,tags;$HOME

" sets a line for the max line length
au BufRead,BufNewFile *.py setlocal colorcolumn=79
au BufRead,BufNewFile *.py setlocal textwidth=79


autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
if exists($VIRTUAL_ENV)
    call coc#config('python', {
    \   'pythonPath': $VIRTUAL_ENV . '/bin/python'
    \ })
endif

nnoremap <leader>H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" Go
"
" Run goimports instead of gofmt on save
let g:go_fmt_command = "goimports"

" fzf
set rtp+=/opt/homebrew/opt/fzf

map <C-p> :GFiles<CR>

" Prettier for js
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Code stuff
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
