""""""""""""""
"NeoBundle
""""""""""""""
set nocompatible
filetype off 

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/vimproc'


"""""""""""""""
"Vim Rubocop
"""""""""""""""
NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_quiet_messages = {'level': 'warnings'}

"""""""""""""""
"NerdTree
"""""""""""""""
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'fholgado/minibufexpl.vim'

let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
let NERDTreeShowHidden = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

""""""""""""""""""
"Unite
""""""""""""""""""
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
nnoremap [unite] <Nop>
nmap <Space>u [unite]
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>

""""""""""""""
"VimShell
""""""""""""""
"NeoBundle 'Shougo/vimshell'

""""""""""""""""""
"NeoCompleteCache
""""""""""""""""""
NeoBundle 'Shougo/neocomplcache'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
   return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


""""""""""""""""""
" setting
""""""""""""""""""
"行番号を表示する
set number
"新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent
"検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set wrapscan
"タブ文字、行末など不可視文字を表示する
"set list
"自動インデントの各段階に使われる空白の数
set shiftwidth=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
"小文字の検索でも大文字も見つかるようにする
set ignorecase

filetype on
filetype indent on      "NeoBundle required
filetype plugin on
filetype plugin indent on

""""""""""""""""
"My key map
""""""""""""""""
noremap <Space>h ^
noremap <Space>l $
noremap <Space>/ *


