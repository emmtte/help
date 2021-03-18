set hidden
set number
set mouse=a
set tabstop=2     " Size of a hard tabstop (ts).
set shiftwidth=2  " Size of an indentation (sw).
set expandtab     " Always uses spaces instead of tab characters (et).
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set autoindent    " Copy indent from current line when starting a new line.
set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'majutsushi/tagbar'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'edkolev/tmuxline.vim'
    Plug 'mtdl9/vim-log-highlighting'
"    Plug 'dense-analysis/ale'
call plug#end()

:nmap <C-Right> :tabnext<CR>
:nmap <C-Left> :tabprevious<CR>

:nmap <A-Right> :tabnext<CR>
:nmap <A-Left> :tabprevious<CR>


"Cos-List
:nmap <A-Space> :CocList<CR>
nnoremap <C-Space> :CocList<CR>

"enlève le signe d'erreur dans la colonne
set signcolumn=no

"set eslint.autoFixOnSave=true
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix


set background=dark
colorscheme palenight


"majutsushi/tagbar
"let g:tagbar_ctags_bin = '/usr/bin/ctags'
"set tags=./tags;,tags;
"set tags+=/home/pi/binance/tags
let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▸', '▾']
"autocmd FileType * nested :call tagbar#autoopen(0)

"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 0 
:hi TabLineFill ctermfg=Green ctermbg=235    "Green, Black
:hi TabLine ctermfg=145 ctermbg=237          "White, menu_grey"
:hi TabLineSel ctermfg=235 ctermbg=39         "Black, Blue"
:hi Title ctermfg=235 ctermbg=114       "Black,Green"
"set guitablabel=\[%N\]\ %t\ %M
set guitablabel=%t

"let g:airline_theme = 'palenight'
"let g:airline#extensions#tmuxline#enabled = 0
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#formatter = 'unique_tail'
":TmuxlineSnapshot tmuxtest.conf

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
    \ 'a'      : '#S',
    \ 'win'    : '#W',
    \ 'cwin'   : '#W',
    \ 'y'      : ['%H:%M','%d-%b-%y'],
    \ 'z'      : '#H',
    \ 'options': {'status-justify': 'left'}
    \ }
let g:tmuxline_theme = {
    \   'a'    : [ 235, 114 ],
    \   'b'    : [ 253, 239 ],
    \   'c'    : [ 244, 236 ],
    \   'x'    : [ 244, 236 ],
    \   'y'    : [ 253, 239 ],
    \   'z'    : [ 235, 39 ],
    \   'win'  : [ 253, 239 ],
    \   'cwin' : [ 235, 39 ],
    \   'bg'   : [ 244, 236 ],
    \ }
" values represent: [ FG, BG, ATTR ]
"autocmd Tmuxline
