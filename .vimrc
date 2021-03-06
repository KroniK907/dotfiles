
"-------------Header--------------"
set nocompatible              			" be iMproved, required
syntax enable
so ~/.vim/plugins.vim





"----------------Functions---------------"

"Insert with indent
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction





"-------------General Settings--------------"
set backspace=indent,eol,start			"Make backspace behave like every other editor.
let mapleader = ';' 				"The default leader is \, but a comma is much better.
set splitbelow
set splitright
set autowriteall				"Auto Write the file when switching buffers
set tabstop=8					"Set tab character to standard width
set expandtab					"Indent using spaces
set shiftwidth=4				"indents should be 4 columns
set softtabstop=4                               "^^
"set autoindent                                  "Turns on Auto Indent
"set smartindent                                 "Turns on smart indent

set guifont=Lucida\ Console\ 11                  "Sets font 
set linespace=8

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar





"-------------Visual Customizations--------------"
colorscheme jellybeans
set t_CO=256					"Force 256 Colors
set number					"Activate line numbers.

"Set split border colors
hi vertsplit ctermbg=bg ctermfg=fg 

"Always show status line
:set laststatus=2





"-------------Search--------------"
set hlsearch
set incsearch





"-------------Mappings--------------"

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Make it easy to edit the .bash_profile file
nmap <Leader>eb :tabedit ~/.bash_profile<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"remap the insert mode key
nmap i <Insert>

"make Ctrl+s save in all situations.
nmap <C-s> :w<cr>
vmap <C-s> <C-C>:w<cr>
imap <C-s> <C-O>:w<cr>

"shortcut for buffer previous
nmap <Leader>b <C-^>

"Quicker way to the command line
nmap <Leader><Leader> :

"Close buffer with Ctrl-Q
nmap <C-q> :bd<c>

"alias :Delete to delete current file
nmap <Leader>ddd :call delete(expand('%')) \| bdelete! 

"Make paste command auto indent
nmap p [p

"use jj as escape. Easier way to exit insert mode
inoremap jj <ESC>

"use jw to exit insert mode and imediately save 
inoremap jw <ESC>:w<cr> 

"auto indent when entering insert mode
nnoremap <expr> i IndentWithI()





"-------------Screen Management--------------"
"Map Cursor Movement
nmap h <Left>
nmap j <Down>
nmap k <Up>
nmap l <Right>
vmap h <Left>
vmap j <Down>
vmap k <Up>
vmap l <Right>


"remap screen split navigation
nmap <C-J> <C-W><C-J>
nmap <C-L> <C-W><C-L>
nmap <C-K> <C-W><C-K>
nmap <C-h> <C-W><C-H>





"-------------Plugins--------------"

"/
"/ Nerd Tree
"/

"Quick Toggle Nerd Tree
nmap <Leader>tn :NERDTreeToggle<cr>

"Search within file
nmap <C-R> :CtrlPBufTag<cr>

"Set the folder icon
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'

"Stop Nerdtree from Hijacking Vinegar
let g:NERDTreeHijackNetrw = 0

"Auto close on open file
let NERDTreeQuitOnOpen = 1

"/
"/ CtrlP
"/

"Allow ;ee to open CtrlP
nmap <Leader>ee <C-p>

"Set up the CtrlP window to be on top and sort top to bottom
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"Ignore folders for CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|public\|vendor'

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
	
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

"/
"/ Ctags
"/

"Ctags shortcut
nmap <Leader>f <C-]>

"Reindex project
nmap <Leader>tr :!ctags -R --exclude=vendor --exclude=node_modules<cr>

"Tell vim where to find tags file
set tags=tags;$HOME

"/
"/ Airline
"/

let g:airline_inactive_collapse=0
let g:airline#extensions#tabline#enabled = 1

"/
"/ Greplace
"/

set grepprg=airlineg

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ Fugitive
"/

"Quick leader mappings for common git commands
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gm :Gmerge<cr>
nmap <Leader>gf :Gfetch<cr>
nmap <Leader>gp :Gpush<cr>
nmap <Leader>gl :Glog<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gr :Gremove
nmap <Leader>gca :Gcommit -a<cr>

"/
"/ Php Namespace
"/

function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
	call PhpExpandClass()
	call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"/
"/ Indent Guides
"/

"Highlight colors
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=238

"set width of highlight
let g:indent_guides_guide_size = 1

"start guides on second indent
let g:indent_guides_start_level = 2

"Auto start with vim
let g:indent_guides_enable_on_vim_startup = 1

"indent guides toggle
nmap <Leader>tg :IndentGuidesToggle<cr>

"/
"/ youcompleteme
"/

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"/
"/ UtiliSnips
"/

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"/
"/ vim-snippets
"/

"Set Author Name
let g:snips_author="Daniel Kranich"

"/
"/ Cosco
"/

"Always run cosco
let g:auto_comma_or_semicolon = 1

"Make it ignore comment lines
let g:cosco_ignore_comment_lines = 1

"Filetype whitelist
let g:cosco_filetype_whitelist = ['php', 'javascript']

"run cosco when making a newline
imap <cr> <cr><Esc>:CommaOrSemiColonPrevious<cr>i





"------------Laravel-Specific--------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:




"-------------Filetype Maping--------------"
"Use html highlighting with blade.php
au BufReadPost *.blade.php set syntax=html
au BufReadPost *.vue set syntax=javascript
au BufReadPost *.js set syntax=javascript





"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"make vim think blade.php files are html files
autocmd BufNewFile,BufRead *.blade.php setlocal ft=html

"make vim think .inc files are php files
autocmd BufNewFile,BufRead *.inc setlocal ft=php

"--------------Random Shit---------------"
