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
:set autoindent
:set encoding=UTF-8
:set fileencoding=UTF-8
:set termencoding=UTF-8
:set showtabline=0

:set nobackup
:set nowritebackup
:set noswapfile

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" toggle wrap line in normal mode :  ,w
function ToggleWrap()
	if &wrap
		set nowrap
	else
		set wrap
	endif
endfunction
nmap <silent> ,w <Esc>:call ToggleWrap()<CR>

" toggle keyboard mapping in normal mode : ,.
function ToggleKeymap(keymap)
    let keymap = a:keymap
    if keymap == "dvorak"
        echom "Switch -> default"
        :source ~\AppData\Local\nvim\neovim.default.vim
        return "default"
    else
        echom "Switch -> dvorak"
        :source ~\AppData\Local\nvim\neovim.dvorak.vim
        return "dvorak"
    endif
endfunction

let FnToggleKeymapReference = function("ToggleKeymap")
nmap <silent> ,. <Esc>:let keymap = call(FnToggleKeymapReference, [keymap])<CR>

" dvorak layout default
let keymap = "dvorak"
:source ~\AppData\Local\nvim\neovim.dvorak.vim
