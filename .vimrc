set nocompatible
filetype off

" set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set clipboard=unnamed

set background=dark
colorscheme solarized

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mattn/zencoding-vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'neocomplcache'
" Bundle 'gtags'
Bundle 'rails.vim'
Bundle 'template.vim'

filetype plugin indent on
 
" Enable syntax highlight
if &t_Co > 2 || has("gui_running")
  syntax on
endif

nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1 

" Use smartcase.
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_enable_quick_match = 1
let g:neocomplcache_enable_wildcard = 1

nnoremap <silent> ent :NeoComplCacheCachingTags<CR>
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>" 

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup() 
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

set listchars=tab:>.
set list
set backspace=eol,indent,start

" make your own backup files
set nobackup

" if someone edits my files, reopen it
set autoread

" display line number
set number

" default indent settings
set autoindent smartindent

" nice looking tabs
set smarttab
set softtabstop=4 tabstop=4 "shiftwidth=4

set ignorecase smartcase

" incremental
set incsearch
set wrapscan

" display matching parentheses
set showmatch

" show command being entered
set showcmd

set whichwrap=b,s,h,l,<,>,[,]

" display completions
set wildmenu

set splitbelow

nnoremap <C-h> :<C-u>help<space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

noremap ; :
noremap : ;

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" FuzzyFinder
nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

" Tabs
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" filetype
augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END

au BufNewFile,BufRead *.h set filetype=c

" python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd BufWritePre *.py :%s/\s\+$//e

" sql
autocmd FileType sql setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" ruby
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

" perl
autocmd FileType perl setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" tex
autocmd FileType tex setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

" c
autocmd FileType c setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" gtags
nnoremap <C-g> :Gtags -g 
" all methods inside this file 
nnoremap <C-l> :Gtags -f %<CR>
" find the definition of thing under cursor
nnoremap <C-j> :Gtags <C-r><C-w><CR>
" find the usage of the thing under cursor
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
" next search result
nnoremap <C-n> :cn<CR>
" previous search result
nnoremap <C-p> :cp<CR>

