let g:loaded_2html_plugin       = v:true
let g:loaded_gzip               = v:true
let g:loaded_tar                = v:true
let g:loaded_tarPlugin          = v:true
let g:loaded_zip                = v:true
let g:loaded_zipPlugin          = v:true
let g:loaded_vimball            = v:true
let g:loaded_vimballPlugin      = v:true
let g:loaded_netrw              = v:true
let g:loaded_netrwPlugin        = v:true
let g:loaded_netrwSettings      = v:true
let g:loaded_netrwFileHandlers  = v:true
let g:loaded_getscript          = v:true
let g:loaded_getscriptPlugin    = v:true
let g:loaded_man                = v:true
let g:loaded_matchit            = v:true
let g:loaded_matchparen         = v:true
let g:loaded_shada_plugin       = v:true
let g:loaded_spellfile_plugin   = v:true
let g:loaded_tutor_mode_plugin  = v:true
let g:did_install_default_menus = v:true
let g:did_install_syntax_menu   = v:true
let g:skip_loading_mswin        = v:true
let g:did_indent_on             = v:true
let g:did_load_ftplugin         = v:true
let g:loaded_rrhelper           = v:true

const rc_root = '<sfile>'->expand()->fnamemodify(':h')

" options 
" {{{
set nocompatible
set mouse=
set autoindent
set wrap
set number relativenumber
set shortmess=aTIcFoOsSW showtabline=0 laststatus=0
set noruler noshowcmd noshowmode
set shiftwidth=2 tabstop=2 expandtab
set splitright splitbelow
set helplang=ja,en
set cmdheight=1
set spelllang=en_us,cjk
execute 'set' 'spellfile=' . rc_root . '/spell/en.utf-8.add'
set termguicolors
" }}}

" keymap
" {{{
let g:mapleader = '\<Space>'

" j, k for wrap and relativenumber
nnoremap <expr> j v:count1 == 1 ? 'gj' : 'j'
nnoremap <expr> k v:count1 == 1 ? 'gk' : 'k'
nnoremap gj j
nnoremap gk k

" Escape replace to Ctrl+c
nnoremap <C-[> <C-c>
cnoremap <ESC> <C-c>
cnoremap <C-[> <C-c>

" enable shell bind
inoremap <C-h> <Bs>
inoremap <C-d> <Del>
cnoremap <C-h> <Bs>
cnoremap <C-d> <Del>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Moving in insert without devide dot repeat
inoremap <C-b> <C-g>U<Left>
inoremap <C-f> <C-g>U<Right>
inoremap <expr> <C-a> col('.') == match(getline('.'), '\S') + 1 ?
                       \ repeat('<C-G>U<Left>', col('.') - 1) :
                       \ (col('.') < match(getline('.'), '\S') ?
                       \     repeat('<C-G>U<Right>', match(getline('.'), '\S') + 0) :
                       \     repeat('<C-G>U<Left>', col('.') - 1 - match(getline('.'), '\S')))
inoremap <expr> <C-e> repeat('<C-G>U<Right>', col('$') - col('.'))

" The shortcuts of split window and open terminal
nnoremap <C-w>T <C-w>v<Cmd>term<CR>
nnoremap <C-w>t <C-w>s<C-w>j<Cmd>term<CR>

" / -> case
" Ctrl+/ -> ignorecase
nnoremap / <Cmd>set noignorecase<CR>/
nnoremap <C-/> <Cmd>set ignorecase<CR>/

tnoremap <C-[> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
" }}}

colorscheme icecream

" plugins 
let $BASE_DIR = rc_root
const g:dpp_repo = '~/.cache/dpp'->expand()

function! s:git_use(repo) abort
" {{{
  let dir = g:dpp_repo . '/github.com/'->expand() .. a:repo
  if !(dir->isdirectory())
    execute '!git clone https://github.com/' .. a:repo dir
  endif
  execute 'set runtimepath^=' .. dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endfunction
" }}}

" Vime
" {{{
if $VIME
  call s:git_use('vim-denops/denops.vim')
  call s:git_use('Shougo/pum.vim')
    inoremap <C-i> <Cmd>call pum#map#insert_relative(+1)<CR>
    inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
    inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
    inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
    cnoremap <expr> <C-i>
          \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
          \ ddc#map#manual_complete()
    " <Tab>が置き換えられるため、防止
    inoremap <Tab> <Tab>
  call s:git_use('Shougo/ddc-ui-pum')
  call s:git_use('Shougo/ddc-source-around')
  call s:git_use('kei-s16/skkeleton-azik-kanatable')
  call s:git_use('vim-skk/skkeleton')
    function! s:skkeleton_init() abort
      call skkeleton#azik#add_table('us')
      call skkeleton#config({'kanaTable': 'azik',})
      call skkeleton#config(#{
        \ eggLikeNewline: v:true,
        \ globalDictionaries: ["~/repos/github.com/skk-dev/dict/SKK-JISYO.L",
        \                      "~/repos/github.com/skk-dev/dict/SKK-JISYO.jinmei",
        \                      "~/repos/github.com/skk-dev/dict/SKK-JISYO.geo",
        \                      "~/repos/github.com/skk-dev/dict/SKK-JISYO.station",
        \                      "~/repos/github.com/skk-dev/dict/SKK-JISYO.propernoun"],
        \ })
      call skkeleton#register_kanatable('rom', {
        \ "z\<Space>": ["\u3000", ''],
        \ })
    endfunction
    augroup skkeleton-initialize-pre
      autocmd!
      autocmd User skkeleton-initialize-pre call s:skkeleton_init()
    augroup END

    imap <C-j> <Plug>(skkeleton-enable)
    cmap <C-j> <Plug>(skkeleton-enable)
    imap <C-l> <Plug>(skkeleton-disable)
    cmap <C-l> <Plug>(skkeleton-disable)
  call s:git_use('tani/ddc-fuzzy')
  call s:git_use('Shougo/ddc.vim')
    call ddc#custom#load_config(rc_root . '/conf/ddc_vime.ts'->expand())
    call ddc#enable()
  finish
endif
" }}}

" dpp
" {{{
filetype plugin indent on " Enable ftplugin
call s:git_use('Shougo/dpp.vim')
call s:git_use('Shougo/dpp-ext-lazy')
call s:git_use('Shougo/dpp-ext-toml')
call s:git_use('Shougo/dpp-ext-installer')
call s:git_use('Shougo/dpp-protocol-git')
call s:git_use('vim-denops/denops.vim')

if g:dpp_repo->dpp#min#load_state()
  autocmd User DenopsReady call dpp#make_state(g:dpp_repo, '$BASE_DIR/conf/dpp.ts'->expand())
endif
" }}}

" autocmd
" {{{
augroup ToggleRelativeNumber
  autocmd!
  autocmd CmdlineEnter * if &number |
        \   set norelativenumber | redraw |
        \ endif
  autocmd CmdlineLeave * if &number |
        \   set relativenumber |
        \ endif
augroup END
" }}}

" enable :Man
runtime ftplugin/man.vim
"
" Easy to read runtimepath
command! DebugRuntimepath echo debug#runtimepath()
