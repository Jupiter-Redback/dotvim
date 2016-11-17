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
set background=dark
colorscheme zenburn

" ignore cases in searches except when search contains uppercase characters
" use \C{string} to force case-sensitive searches
set ignorecase
set smartcase

" set sensible wrapping
set wrap
set linebreak
set showbreak=…

" should really be using UTF-8 with python
set encoding=utf-8

" python3 for the mode plugin
let g:pymode_python = 'python3'

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
" F3  - toggle NERDtree
" F5  - toggle git gutter
" F6  - toggle undo buffer history
" F7  - toggle auto-indentation
" F8  - toggle line numbering
" F9  - switch between current and elternate buffers
map <F2> <C-w>
map <F3> :NERDTreeToggle<CR>
map <F5> :GitGutterToggle<CR>
map <F6> :GundoToggle<CR>
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

" use ag instead of ack, if we have it
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" NERDcommenter settings
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" airline tweaks
let g:airline#extensions#tabline#enabled = 1

" newbie sttings for syntastic (revisit when newbieness recedes)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" auto-close if NERDtree is last man standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" customisations for PythonMode
let g:pymode_trim_whitespaces = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
nmap <leader>lt :PymodeLint<CR>
nmap <leader>lta :PymodeLintAuto<CR>
