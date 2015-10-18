set nocompatible
set nu
set nobackup
set noswapfile
set cursorline
set cursorcolumn
set showmatch
set hlsearch
set ignorecase
set expandtab
set t_Co=256
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set background=dark
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

syn on
filetype on
filetype plugin on
filetype plugin indent on

" map 映射汇总
" \         open 正在编辑的文件
" <Left>    左编辑区
" <Right>   右编辑区
" D-c       copy
" D-x       cut
" D-v       paste
" D-s       save
" <Space-m> 选中单词高亮
" <Space-j> 自动高亮光标下单词
" <BS>      切换注释
" <F2>      文件浏览NERDTree
" <F3>      搜索窗口
" <F4>      tag窗口
" <F5>      Gundo窗口
" <F6>      语法检查
" <F7>      
" <F8>      
" <F9>      
" <F10>     EasyMotion j,b,w
" <F11>     MiniBuf Pre
" <F12>     MiniBuf Nxt
" <C-n>     从自动补全菜单中选择
" <C-a>     
" <C-b>     
" <C-c>     
" <C-d>     
" <C-e>     自动扩展
" <C-f>     
" <C-g>     
" <C-h>     
" <C-i>     
" <C-j>     
" <C-k>     
" <C-l>     
" <C-m>     
" <C-n>     
" <C-o>     
" <C-p>     
" <C-q>     
" <C-r>     
" <C-s>     
" <C-t>     
" <C-u>     
" <C-v>     进入列模式
" <C-w>     窗口操作
" <C-x>     
" <C-y>     
" <C-z>     
 






" 粘贴时不置换“剪贴板”1
xnoremap p pgvy

nmap <TAB> V>
nmap <S-TAB> V<
" vmap <TAB> ><ESC>
" vmap <S-TAB> <<ESC>

" 使用 \ 键打开当前编辑的文件
nnoremap \ :!open <C-R>%<CR><CR>

" 使用左右光标键切换 buffer
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

"加号寄存器-copy 
map <D-c> "+y 
"加号寄存器-paste
map <D-v> "+p 
"加号寄存器-cut
map <D-x> "+x   
" Ctrl-S Save
map <D-s> :w<CR>

" 把每个插件单独放入一个目录
call pathogen#infect()

" 载入特定目录插件
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()
call vundle#rc()

" plugin management tool
Bundle 'gmarik/vundle'

" Git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" visualize your Vim undo tree.
Bundle 'sjl/gundo.vim'
" F5打开git undo log
nnoremap <F5> :GundoToggle<CR>
" CVS/SVN/SVK/git/hg/bzr integration plugin
"Bundle 'vcscommand.vim'

" Perform all your vim insert mode completions with Tab
Plugin 'SuperTab'
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" toggling the display of the quickfix list and the location-list.
Bundle 'Valloric/ListToggle'

" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nmap <F6> :SyntasticCheck<CR>

" Fast and Easy Find and Replace Across Multiple Files
Bundle 'EasyGrep'
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 0 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"

Bundle 'klen/python-mode'

" "------------------------------------------------------------------------------
" The ultimate snippet solution for Vim
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"------------------------------------------------------------------------------

" combination of the php indent file and the html indent file
Bundle 'php.vim-html-enhanced'

" Dark and light color scheme (GUI and 256 color terminal)
Bundle 'Lucius'
colorscheme lucius
LuciusBlack

" json color
Bundle 'elzr/vim-json'

" powerlines replace
Bundle 'bling/vim-airline'
set laststatus=2

" taglist replace
Bundle 'majutsushi/tagbar'
" ctags程序的路径
let g:tagbar_ctags_bin='ctags'
" 窗口宽度的设置
let g:tagbar_width=30
" 定义F4打开tag窗口
map <F4> :Tagbar<CR>
" 定义以下扩展名文件打开时自动打开tag窗口
autocmd BufReadPost *.cpp,*.hpp,*.mm,*.c,*.h,*.html,*.js,*.css,*.py,*.php,*.rb,*.erl,*.ex,*.rt,*.java,*.clj,*.lsp call tagbar#autoopen()

" file explorer
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 定义F2打开文件浏览窗口
map <F2> :NERDTreeToggle<CR>

" opening file tag bar
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=1
map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

" Vim motions on speed!
Plugin 'Lokaltog/vim-easymotion'
"F10激活，F10j跳转，F10b，F10w
let g:EasyMotion_leader_key='<F10>'

" A parser for a condensed HTML format
"insert模式下Ctrl-E自动扩展"
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" 包围操作
"   cs"' - change surround " to '
" cs"<p> - change surround " to <p>
"    ds" - delete surround "
Bundle "tpope/vim-surround"

" Vim-script library
Plugin 'L9'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"F3开启搜索
map <F3> : CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" This plugin for Vim enable an auto-close chars feature for you.
Bundle 'Townk/vim-autoclose'

" Vim plugin that allows you to visually select increasingly larger regions of
" text using the same key combination.
" +自动扩展选择
Bundle 'terryma/vim-expand-region'

Bundle 'sukima/xmledit'

" normal模式下BackSpace自动注释
Bundle 'tpope/vim-commentary'
nmap <BS> gcc
vmap <BS> gc

" ins/del brackets, parens, quotes in pair
"自动添加删除成对的{}[]()''
Bundle 'jiangmiao/auto-pairs'

" quickly highlight <cword> or visually selected word
"快速高亮，SPACE+m，SPACE+j
Bundle 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>j <Plug>(quickhl-cword-toggle)

" Maintains a history of previous yanks, changes and deletes
"     yy - Adds the current line to the yankring.
"     dd - Adds the current line to the yankring and deletes it.
"    5yw - Adds 5 words to the yankring.
"   "ade - Deletes the word, and puts it into both the yankring and
"          the "a register.
"     cw - Changes the word and stores the previous value in the yankring.
" 10"zyy - Places 10 lines into both the yankring and the "z register.
" :YRShow
Bundle 'YankRing.vim'

" Highlights the matching pair surrounding the current cursor location.
Bundle 'ShowPairs'

" Vim Outliner of Markers -- two-pane outliner and related utilities
"   :Voom markdown
"   :Voom latex1
Bundle 'VOoM'

call vundle#end()
