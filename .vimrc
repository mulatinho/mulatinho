" pathogen
call pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible
set noundofile
set number
set showmatch
set encoding=utf-8
set mouse=c
set viminfo='20,<1000,s1000

" omnifunc
set omnifunc=syntaxcomplete#Complete
set completeopt+=menuone,noinsert,noselect

" nerdtree
nnoremap <leader>g :NERDTreeFocus<CR>
" nnoremap <C-g> :NERDTree<CR>
nnoremap <C-g> :NERDTreeToggle<CR>
" nnoremap <C-2> :NERDTreeFind<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <S-Left> :bp<CR>
nmap <S-Right> :bn<CR>

" personal stuff
iab mltmail Alexandre Mulatinho <alex@mulatinho.net>
iab mltlivre Alexandre Mulatinho <alex@livredigital.com>

" golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" completion
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = "2"
let g:jedi#auto_vim_configuration = 1

" individual files
au BufRead,BufNewFile Makefile*,Dockerfil,*config set noexpandtab
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.go,*.py,*.pyw,*.c,*.h,*.yml,*.yaml,*.js,*.cc,*.hh match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.go,*.py,*.pyw,*.c,*.h,*.yml,*.yaml,*.js,*.cc,*.hh set textwidth=79 fileformat=unix
au BufNewFile,BufRead *.yml,*.yaml set expandtab ts=2 sw=2
au BufNewFile,BufRead *.json,*.js set expandtab ts=2 sw=2 sts=0 smarttab
au BufRead,BufNewFile *.py,.*pyw set expandtab tabstop=4 softtabstop=4 expandtab shiftwidth=4 autoindent
au BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp,*.hh,*.cxx set tabstop=8 softtabstop=0 shiftwidth=8 smarttab
au filetype go inoremap <buffer> . .<C-x><C-o>
au filetype go inoremap <S-Tab> <C-x><C-o>
autocmd BufWritePre *.{c,cpp,cc,h,hpp,py,m,mm,yml,yaml} :%s/\s\+$//e
