"
" personal preference .vimrc file
" maintained by Jupiter Redback <jupiter.redback@gmail.com>
"
"
" to start vim without using this .vimrc file, use:
"     vim -u NORC
"
" to start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"

" pathogen for all our plugin requirements
" most standard settings come from vim-sensible plugin
call pathogen#infect()
call pathogen#helptags()

" use vim settings, rather then vi settings (much better!)
set nocompatible

" set flavour-of-the-moment colour scheme
colorscheme vividchalk

" ignore cases in searches except when search contains uppercase characters
" use \C{string} to force case-sensitive searches
set ignorecase
set smartcase

" set sensible wrapping
set wrap
set linebreak
set showbreak=…

" rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" show mapped keys
nmap <leader>m :map<CR>

" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸-,eol:¬

" default is to set tabbing to python style of 4 characters + use spaces to tab
set ts=4 sts=4 sw=4 expandtab

" but if we have autocommand support, set tab processing accordingly
if has("autocmd")
  " syntax of these languages is fussy over tabs vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif
" shortcut to edit .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" source (i.e auto-reload) the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" make it easier to work with hidden buffers
set hidden

" assign function keys within vim
" F2  - make it easier to work with window operations
" F7 - toggle auto-indentation
" F8 - toggle line numbering
" F9  - switch between current and elternate buffers
map <F2> <C-w>
map <F7> :set noautoindent!<CR>
map <F8> :set nonumber!<CR>
map <F9> <C-^>

" useful shortcuts to work with files at the same level as the current file
" ew = open in window, eh = open in split, ev = open in vert split, et = open in tab
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>eh :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" text bubbling
" single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" visually select the text that was last edited/pasted
nmap gV `[v`]

