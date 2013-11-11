colorscheme desert
set vb t_vb=
set autoindent
set autoread

set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set backspace=eol,indent,start
syntax on

set tags=tags;
set incsearch
set hlsearch
set nowrap

set list
set listchars=trail:.

function TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

function TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
endfunction

" Toggle header and source
source $HOME/tools/a.vim

source $HOME/tools/quickopen/plugin/quickopen.vim

"Toggle search highlighting
nmap ,t :set hlsearch!<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

function! CodeSearch()
  execute "!google-chrome \"https://code.google.com/p/chromium/codesearch/\\#chromium/%:p:s?.*./src/?src/?&l=" . line(".") . "\""
endfunction

" Open current file in code search
nmap ,cs :call CodeSearch()<cr><cr>
" Switch to alternate file
map <A-.> :bnext<cr>
map <A-,> :bprevious<cr>

map <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>

map <A-Left> :execute TabLeft()<CR>
map <A-Right> :execute TabRight()<CR>

" Toggle line numbers
map <F2> :set number!<CR>

" Quickopen Dialog
map <F3> :O<CR>

" Toggle Source and Header 
map <F4> :A<CR>

" Resource vimrc file
map <F5> :source $MYVIMRC<CR>


