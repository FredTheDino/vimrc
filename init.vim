" True color
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has('patch-7.4.1778')
  set guicolors
endif

if &compatible
	set nocompatible
endif

let g:flatcolor_termcolors = 16

" Include the plugin manager
set runtimepath+=/home/ed/.config/nvim/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('/home/ed/.config/nvim/')
	call dein#begin('/home/ed/.config/nvim/')

	" Let dein manage dein
	" Required:
	call dein#add('/home/ed/.config/nvim/repos/github.com/Shougo/dein.vim')
	" Ctrl-P
	call dein#add(expand('ctrlpvim/ctrlp.vim'))
	call dein#add(expand('itchyny/lightline.vim'))
	call dein#add(expand('MaxSt/FlatColor'))
	call dein#add(expand('jiangmiao/auto-pairs'))
	call dein#add(expand('octol/vim-cpp-enhanced-highlight'))
	call dein#add(expand('tikhomirov/vim-glsl'))
	call dein#add(expand('jeffkreeftmeijer/vim-numbertoggle'))
	call dein#add(expand('rust-lang/rust.vim'))
	call dein#add(expand('tbastos/vim-lua'))
	call dein#add(expand('vim-syntastic/syntastic'))
	call dein#add(expand('mattn/emmet-vim'))

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
colorscheme flatcolor

" Autoload!
autocmd bufwritepost .vimrc source $MYVIMRC

" Awesome line numbers!
set number

" Need 'em syntax checkers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ["go"]

" Emmet
let g:user_emmet_expandabbr_key = '<c-e>'

let g:use_emmet_complete_tag = 1

" Lightline
let g:lightline = { 'colorscheme' : 'flatcolor' }

" Ctrl P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <c-b> :CtrlPBuffer<CR>
let g:ctrlp_rexexp = 1
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'
let g:ctrlp_switch_buffer = 'ETVH'
let g:ctrlp_tabpage_position = 'bf'
let g:ctrlp_line_prefix = '  '
let g:ctrlp_open_single_match = ['buffer tags', 'buffer']



" Tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" System clipboard
set clipboard=unnamed

" Ctrl-S
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Escape to exit terminal
tnoremap <Esc> <C-\><C-n>

" Jumping between header and source
source ~/.config/nvim/headersource.vim
noremap <C-t> :w <bar> A <CR>

" Allow saving when I foreget to start as sudo
cmap w!! w !sudo tee > /dev/null %
