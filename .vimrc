syntax enable 
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set laststatus=2
:set number
:set nocompatible
:set nobackup
:set nowrap
:set wildmenu
:set guioptions-=m
:set guioptions-=T
:set makeprg=php\ -l\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l
":colo twilight256
:set autoindent
:set encoding=UTF-8
:set fileencoding=UTF-8
:set termencoding=UTF-8
:set showtabline=0

":set gfn=~/fonts/LiberationMono-Regular\ 8
:set guifont=Liberation\ Mono\ 10
:set backupdir=~/.vim/.backups
:set directory=~/.vim/.backups
:set nobackup
:set nowritebackup
:set noswapfile


" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

:map! ___ echo "</pre>";<Esc>yyPf/xoprint_r();<Esc>F(a

:nmap ,D :set noic<CR>
:nmap ,d :set ic<CR>

:map <M-h> <C-w>>
:map <M-t> <C-w>-
:map <M-n> <C-w>+
:map <M-s> <C-w><
:map <M-r> <C-w><C-w>
:map <M-c> <C-w><S-w>
:map <M-p> "+p
:map <M-P> "+P


:noremap e s
:noremap E S
:noremap S E
:noremap l n
:noremap t j
:noremap n k
:noremap s l
:noremap - ^
:noremap _ $
:noremap L N
:noremap j t
:noremap J T
:map N 8<up>
:map T 8<down>
:noremap K J


function ToggleWrap()
	if &wrap
		set nowrap
	else
		set wrap
	endif
endfunction
nmap <silent> ,w <Esc>:call ToggleWrap()<CR>

function ToggleHLSearch()
	if &hls
		set nohls
		exe "echo 'Highlight OFF'"
	else
		set hls
		exe "echo 'Highlight ON'"
	endif
endfunction
nmap <silent> ,n <Esc>:call ToggleHLSearch()<CR>

" Bloc phpdoc
inoremap <C-E> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-E> :call PhpDocSingle()<CR>
vnoremap <C-E> :call PhpDocRange()<CR>

"encodage & statusline
if has("statusline")
	set statusline=%{GuiTabLabel()}\ %<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
noremap <C-u> :e ++enc=latin1 %:p<CR>

let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" ouvre un onglet dans firefox sur php.net avec le mot selectionné
vmap ,p :<C-U>!firefox "http://fr.php.net/<cword>" >& /dev/null<CR><CR>
 
