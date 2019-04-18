colorscheme slate
set tabstop=4
set expandtab
set shiftwidth=4
syntax on
set number
set mouse=a "Don't hate
set autoindent
set smartindent
set hlsearch
set incsearch

au BufWritePost *.go !gofmt -w %

map <S-Up> <Up>
map <S-Down> <Down>


" Normal action
set expandtab

if has("autocmd")

    " If the filetype is Makefile then we need to use tabs
    " So do not expand tabs into space.
    autocmd FileType make   set noexpandtab

endif
