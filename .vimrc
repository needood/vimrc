execute pathogen#infect()


set laststatus=2

function UpdateStatus()
	let g:last_bufnr= expand('#:t')."[".bufnr('#')."]"
endfunction

autocmd VimEnter,BufNew,BufEnter * call UpdateStatus()
"autocmd VimEnter,BufNew,BufEnter,BufWritePost,VimResized * call UpdateStatus()

set statusline=\ %<%F[%1*%M%*%n%R%H]\ %{g:last_bufnr}%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

"if has("statusline")
"	set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
"endif


filetype plugin indent on


" žüžÄLeaderÎª","
let g:mapleader = ','

set mouse=a



" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"
"	let g:neocomplcache_disable_auto_complete = 1
"
"
"	" Use smartcase.
"	let g:neocomplcache_enable_smart_case = 1
"	" Set minimum syntax keyword length.
"	let g:neocomplcache_min_syntax_length = 3
"	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"	let g:neocomplcache_enable_auto_select = 0
"	"let g:neocomplcache_enable_quick_match = 1
"
"
"
"
"	"let g:shell_fullscreen_always_on_top = 0
"
"
"	"let g:SuperTabNoCompleteBefore=[]
"	"let g:SuperTabNoCompleteAfter = [',', '\s', ';', '/', '^']
"	"let g:SuperTabDefaultCompletionType = '<c-x><c-u>'
"	"let g:SuperTabMappingForward = '<nul>'
"	"let g:SuperTabMappingBackward = '<s-nul>'
"	"
"	"
"	"
"
"	inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
"	inoremap <expr><s-space> pumvisible() ? "\<c-n>" : neocomplcache#start_manual_complete()
"	inoremap <expr><c-j> pumvisible() ? "\<c-n>":"\<c-j>"
"	inoremap <expr><c-k> pumvisible() ? "\<c-p>":"\<c-k>"


"au BufNewFile,BufRead *.styl	setf stylus
au BufNewFile,BufRead *.less	setf less

au FileType css,less,stylus setlocal omnifunc=csscomplete#CompleteCSS 
au FileType less setlocal syntax=css
au FileType css,stylus,less ColorVAutoPreview
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au Filetype java setlocal omnifunc=javacomplete#Complete

" UTF-8 ±àÂë
let &termencoding = &encoding
set formatoptions+=mM
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

set timeout timeoutlen=500 ttimeoutlen=100

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif



" No compatible with vi
set nocompatible

set hid

"¹²ÏíŒôÌù°å  
set clipboard+=unnamed 


colo railscasts "distinguished

set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


set tabstop=4 
set shiftwidth=4 

" ÏÔÊŸTab·û
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

set showmatch


" ÏÔÊŸÐÐºÅ
"set number


" ÉèÖÃÔÚ×ŽÌ¬ÐÐÏÔÊŸµÄÐÅÏ¢
"set foldenable
set nofoldenable
set foldmethod=syntax " ÉèÖÃÓï·šÕÛµþ
set foldcolumn=0 " ÉèÖÃÕÛµþÇøÓòµÄ¿í¶È
set foldlevel=1 " ÉèÖÃÕÛµþ²ãÊýÎª
set foldnestmax=2


set guioptions-=T           " Òþ²Ø¹€ŸßÀž
set guioptions-=m           " Òþ²Ø²Ëµ¥Àž
let g:indent_guides_guide_size=1



let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'

let g:ctrlp_working_path_mode = 'rc'


set wildignore+=*\\tmp\\*,*/tmp/*,*.so,*.swp,*.exe

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_extensions = ['funky']


nnoremap <Leader>u :Utl<CR>
nnoremap <Leader>c :ColorVEdit<CR>
nnoremap <Leader>n :NERDTreeFromBookmark 
nnoremap <Leader>h :NERDTreeClose<CR>:CtrlPMRUFiles<CR>
nnoremap <S-Tab> :NERDTreeFind<CR>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:lastwin = -1
function s:QuickTab()
	if buflisted(bufnr('#')) != 0
		b#
	else
		bprevious
	endif
endfunction
command QuickTab call s:QuickTab()
nnoremap <tab> :NERDTreeClose<CR>:QuickTab<CR>
function s:QuickMove()
	if bufwinnr('%') == 1
		winc w
	else
		1winc w
	endif
endfunction
command QuickMove call s:QuickMove()
nnoremap ; :QuickMove<CR>
nnoremap \ :TagbarOpenAutoClose<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
inoremap <S-CR> <ESC>o
inoremap <S-BS> <ESC>O
nnoremap <C-J> gj
nnoremap <C-k> gk
nnoremap r viw
nnoremap R ^v$h
nmap <Leader>aj jRdkR<c-y>,a<cr>"0p
nmap <Leader>a RdjR<c-y>,a<cr>"0p


ca wc w<CR>:! coffee -o %:p:h %
ca wl w<CR>:! lessc -compress -include-path=C:\hm\share\F\libs\ %:p > %:p:r.css



" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
echohl ErrorMsg
echomsg a:msg
echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
	if empty(a:buffer)
		let btarget = bufnr('%')
	elseif a:buffer =~ '^\d\+$'
		let btarget = bufnr(str2nr(a:buffer))
	else
		let btarget = bufnr(a:buffer)
	endif
	if btarget < 0
		call s:Warn('No matching buffer for '.a:buffer)
		return
	endif
	if empty(a:bang) && getbufvar(btarget, '&modified')
		call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
		return
	endif
	" Numbers of windows that view target buffer which we will delete.
	let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
	if !g:bclose_multiple && len(wnums) > 1
		call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
		return
	endif
	let wcurrent = winnr()
	for w in wnums
		execute w.'wincmd w'
		let prevbuf = bufnr('#')
		if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
			buffer #
		else
			bprevious
		endif
		if btarget == bufnr('%')
			" Numbers of listed buffers which are not the target to be deleted.
			let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
			" Listed, not target, and not displayed.
			let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
			" Take the first buffer, if any (could be more intelligent).
			let bjump = (bhidden + blisted + [-1])[0]
			if bjump > 0
				execute 'buffer '.bjump
			else
				execute 'enew'.a:bang
			endif
		endif
	endfor
	execute 'bdelete'.a:bang.' '.btarget
	execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
nnoremap <silent> <Leader>bD :Bclose!<CR>
ca bd Bclose
