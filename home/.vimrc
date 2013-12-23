set runtimepath+=~/.vim/after


" Turn backup off, since most stuff is in SVN, git anyway...
"set backup=false
"set backupdir=~/.vim/backup,.
set directory=./tmp,~/tmp,.
set nobackup
set nowb
set noswapfile


"Místo, aby runé operace (:q, :e) selhaly, protoze není
"ulozen aktuální buffer, VIM se uzivatele zeptá, jestli chce
"soubor ulozit
set confirm

" budou ukládat informace o posledních padesáti souborech, obsahy
" registru se budou uchovávat do velikosti 500 rádku a
" historie príkazu a vyhledávacích výrazu bude omezena
" rovnez na 50
set viminfo='50,\"500
set history=50

" prubezne vyhledavani po /
set incsearch

" doplnovani nazvu
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full

" replace locale keys in command mode
"""set langmap=ě2,š3,č4,ř5,ž6,ý7,á8,í9,é0,§',-/,\":,_?
"set langmap=ě2,š3,č4,ř5,ž6,ý7,á8,í9,é0,§',-/,\":,_?,\:>,?<,!\",=-,ú\[,)\],9\(,0\),;`, 
"set langmap=ě2,š3,č4,ř5,ž6,ý7,á8,í9,é0,§',-/,\">



set whichwrap=<,>,h,l
set guioptions=TgmrL
set history=50
set nowrap
set visualbell
set noerrorbells
set number
set ruler
"set expandtab
set termencoding=utf-8

" bezne je nastaveno na tcq, Naopak twn je pro bullet listy
set formatoptions-=c	" disable wrapping of comments () - nefunguje spravne
set formatoptions+=twn

" Show tabs and trailing characters.
set listchars=tab:»·,trail:·
set list

" Reformat paragraphs and list.
nnoremap R gq}



try
  set cryptmethod=blowfish
catch
endtry 

"nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode




let mapleader = '\'
let g:mapleader = '\'
let maplocalleader = '\'


imap <C-tab> <C-p>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

imap qq <esc>gqap


set autoindent 
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=90
set autowrite
set encoding=utf-8
set fileencodings=utf-8
set fileformat=unix
set history=200
set incsearch
set noexpandtab
set nonumber
set nowrap
set ruler 
set showcmd
set showmatch
set visualbell 		
syntax on
"set expandtab 
"set fileencodings="
"set guioptions=bgmrL
"set nohlsearch
"set termencoding=latin2
"set whichwrap=<,>,h,l 


set display=lastline
set guioptions=agimrtTb
set laststatus=2
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
highlight User1 guibg=white guifg=blue
highlight User2 guibg=white guifg=red

set showcmd

set mousemodel=popup
set scrolloff=5
"set sidescroll=5

set backspace=indent,eol,start
"set backspace=eol,start

set nojoinspaces
set shiftround


vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Es</CR></C-R></CR>

set clipboard=unnamed

"ignore white spaces in diff mode
set diffopt+=iwhite
set diffopt+=vertical
"set diffopt+=icase

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
	  set undodir=~/.vim/undodir
      "set undodir=~/.vim_runtime/undodir
    endif
    set undofile
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

" => MRU plugin
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


" => Command-T
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>

" => Cope
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


" => Vim grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" => Spell checking
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" => bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


" => Minibuffer plugin
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
    exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


" => General Abbrevs
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"automaticky radek po novem otevreni.
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"z." | endif 

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" => Parenthesis/bracket expanding
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"map <A-1> :b1<CR>
"map <A-2> :b2<CR>
"map <A-3> :b3<CR>
"map <A-4> :b4<CR>
"map <A-5> :b5<CR>
"map <A-6> :b6<CR>
"map <A-7> :b7<CR>
"map <A-8> :b8<CR>
"map <A-9> :b9<CR>
"map <A-0> :b10<CR>
map <C-Tab> :bn<CR>
map <S-C-Tab> :bp<CR>

"imap <A-1> <Esc>:b1<CR>
"imap <A-2> <Esc>:b2<CR>
"imap <A-3> <Esc>:b3<CR>
"imap <A-4> <Esc>:b4<CR>
"imap <A-5> <Esc>:b5<CR>
"imap <A-6> <Esc>:b6<CR>
"imap <A-7> <Esc>:b7<CR>
"imap <A-8> <Esc>:b8<CR>
"imap <A-9> <Esc>:b9<CR>
"imap <A-0> <Esc>:b10<CR>
imap <C-Tab> <Esc>:bn<CR>
imap <S-C-Tab> <Esc>:bp<CR>


set grepprg=grep\ -nH\ $*

"source ~/.vim/scripts/dbhelper.vim
"source ~/.vim/ftplugin/xml.vim
"source ~/.vim/ftplugin/xgen.vim

set mousehide           " Hide the mouse when typing text

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).          
"autocmd BufReadPost *                              
"  \ if line("'\"") > 0 && line("'\"") <= line("$") |
"  \   exe "normal g`\"" |                          
"  \ endif
" Make shift-insert work like in Xterm               


"MAP
map Q gq
map QQ gqap
map *  !}par 

" xml, html, etc..
"imap <F5>h </>^[2F<lywf>f/pF<i "DOPLNI PAROVOU ZNACKU HTML
"imap `  
"mapuje backspace na spravnou fci .. viz prob s term
"imap  xa

"map <F4>d !date
map <S-Insert> <MiddleMouse>                         
map! <S-Insert> <MiddleMouse>

" Zavorky a Tagy
imap <F3>k /**/hi
imap <F3>u ()i
imap <F3>v {}i
imap <F3>[ []i

"imap <F3>uu (())hi
"imap <F3>vv {{}}hi
"imap <F3>[[ [[]]hi
"imap <F3>H <></>hi
"imap <F3>h <>i
"imap <F3>hh </>^[2F<lywf>f/pF<i "DOPLNI PAROVOU ZNACKU HTML


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gentoo
"
if (getcwd() =~ 'gentoo-x86\|gentoo-src\|portage')
    set tabstop=4 shiftwidth=4 noexpandtab
endif


""highlight Normal guifg=Black guibg=#ffefd5
set guifont=Courier\ New,Courier,Lucida\ Console,Letter\ Gothic,Sans
"colorscheme delek
"colorscheme inkpot
"colorscheme slate
set guifont=Courier\ New\ 10


if has("gui_running")
  "set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
else
  color zellner
  set background=dark
endif


filetype plugin on
filetype indent on

"Syntax folding
let g:xml_syntax_folding = 1
set foldlevelstart=99
set foldmethod=syntax

" Other
"map U ^df>$dF<x 
"map T ^df>$dF<x^i<title>ldf>$p


"au BufNewFile,BufRead *.html let g:snip_start_tag = "<{"
"au BufNewFile,BufRead *.html let g:snip_end_tag = "}>" 

let g:snip_start_tag = "<{"
let g:snip_end_tag = "}>" 
let g:snip_set_textmate_cp = 1 


map <F6> gg"+yG
"map <F7> [s
"map <F8> ]s


" Scripts folder
"
let $SCRIPTS = '~/.vim/scripts/'
if has("win32")
      let $SCRIPTS = $VIM.'/scripts/'
endif


" Gentoo ebuilds...
au BufRead,BufNewFile *.e{build,class} let is_bash=1|setfiletype sh
au BufRead,BufNewFile *.e{build,class} set ts=4 sw=4 noexpandtab

" Text files
au BufRead,BufNewFile *.xml,*.docbk,*.docbook set filetype=docbk spell spelllang=cs,en spell
au BufRead,BufNewFile *.{txt,text} set spelllang=cs,en spell tw=78
au BufRead,BufNewFile *.report set filetype=rst spell spelllang=en,cs spell

" Rules
autocmd BufRead ~archive/*      set readonly
autocmd BufRead ~bkp/*          set readonly

" Filetypes
autocmd FileType c,cpp,slang set cindent omnifunc=ccomplete#Complete
autocmd FileType css set smartindent omnifunc=csscomplete#CompleteCSS tabstop=2
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType docbk,docbkxml set omnifunc=xmlcomplete#CompleteTags spelllang=cs,en spell
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"au BufNewFile,BufRead *.xml,*.htm,*.html,*.svg  so ~/.vim/scripts/XMLFolding.vim

" Snippets
" django
autocmd FileType html,xhtml set ft=html.django_template formatoptions+=tl omnifunc=htmlcomplete#CompleteTags tabstop=4 noexpandtab

"python my script
""autocmd FileType python set omnifunc=pythoncomplete#Complete
""autocmd FileType python set ft=python.django omnifunc=pythoncomplete#Complete expandtab
autocmd BufRead,BufNewFile *.py source ~/.vim/ftplugin/mypython.vim

"EnhCommentify
let g:EnhCommentifyFirstLineMode = 'yes'

"TagList
noremap <Leader>T :TlistToggle<CR>
let Tlist_Compact_Format = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1

"File browser
noremap <Leader>t :NERDTreeToggle<CR>

"TTags
"noremap <Leader>g. :TTags<cr>
"noremap <Leader>g# :call ttags#List(0, "*", tlib#rx#Escape(expand("<cword>")))<cr>
"noremap <Leader>g* :call ttags#List(0, "*", tlib#rx#Escape(expand("<cword>")) .".*")<cr>
"noremap <Leader>g? :call ttags#List(1, "*", tlib#rx#Escape(expand("<cword>")))<cr>
"for c in split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
"  exec 'noremap <Leader>g'. c .' :TTags '. c .'<cr>'
"endfor


"rst preview
":command Rst  :!rst2html.py --embed-stylesheet --stylesheet-path="/home/epcim/hg2g/tools/rst2html/styles/pmi.css" % > %.html
"noremap <Leader>r :Rst<cr>

"rst generate
":command RstF :!rst2html.py --embed-stylesheet --stylesheet-path="/home/epcim/hg2g/tools/rst2html/styles/pmi.css" % > %.html && firefox -new-tab %.html
"noremap <Leader>R :RstF<cr>

"rst underline heading
let @h = "yypVr"
noremap <Leader>H yypVr
noremap <Leader>h o<ESC>68i-<ESC>Vr

"outlined table of content
noremap <Leader>D :DOT<cr>
noremap <Leader>du :DOTUpdate<cr>

"rst tables 2
noremap <Leader>t :ReformatTable()<CR>
noremap <Leader>f :ReflowTable()<CR>

filetype off                  " required!




"" VUNDLE

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle - required! - done by homeshick
"Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'

