set nocompatible

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
" overide tab settings
set tabstop=4
set shiftwidth=4

set nowrap
"set tabstop=2
"set shiftwidth=2
set softtabstop=2
"set expandtab
set list listchars=tab:――,trail:·,eol:¬,extends:❯,precedes:❮,nbsp:%

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
let NERDTreeChDirMode=2
map <F9> :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color desert

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


" == CUSTOMIZATION BEGIN ===========================================

set background=dark

" Enable mouse
set mouse=a



" JSON file will be treathened as JavaScript file
au BufRead,BufNewFile *.{json}    set ft=javascript



set foldmethod=marker

hi User1 ctermbg=red ctermfg=white cterm=bold term=bold
	
set statusline=\ %y\ %t\ %{fugitive#statusline()}\ %1*%m%*%=%l/%L,\ %v
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set nuw=5


nmap <Leader>n :tabnew<CR>
nmap <Leader>q :quit<CR>
"set t_Co=256



function MyTabLine()
  let s = ''
  "let s .= '%#TabLineFill#%T'
  for i in range(tabpagenr('$'))
	" select the highlighting
	if i + 1 == tabpagenr()
	  let s .= '%#TabLineSel#'
	else
	  let s .= '%#TabLine#'
	endif

	" set the tab page number (for mouse clicks)
	let s .= '%' . (i + 1) . 'T'

	" the label is made by MyTabLabel()
	let s .= ' %{MyTabLabel(' . (i + 1) . ')} %#TabLineFill# '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 0
	let s .= '%=%#TabLine#%999X close '
  endif

  return s
endfunction


function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let wincount = 0
  for i in buflist
	  let wincount = wincount + 1
  endfor
  let label = ''
  let c = 1
  for item in buflist
	  let bname = bufname(item)
	  let bname = fnamemodify(bname, ":t")
	  let tipe = getbufvar(item, "&filetype")
	  if bname == ''
		  let bname = '░░░░'
	  endif
	  if tipe != 'nerdtree'
		if getbufvar(item, "&modified")
		  let bname = bname.'+'
		endif
		if c < wincount
		  let bname .= ' • '
		endif
		let label .= bname
	  endif
	  let c = c + 1
  endfor
  return label
endfunction

set tabline=%!MyTabLine()



" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set showtabline=2


au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


let g:CommandTMaxHeight=10

call togglebg#map("<F5>")



" GUNDO!!
nnoremap <F4> :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_right = 1
let g:gundo_help = 0




let g:github_user='dwiash'
let g:github_tokken='d5dcb9a3355b999b8b8beb7f37b8cbac'


map <Leader>d :Gdiff<CR>




" EASYMOTION
let g:EasyMotion_leader_key = '<Leader>m'

let g:solarized_visibility="low"
