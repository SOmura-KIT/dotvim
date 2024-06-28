set background=dark

" hi clear
if has('nvim')
  source $VIMRUNTIME/colors/vim.lua " Nvim: revert to Vim default color scheme
endif
let g:colors_name = 'icecream'

let s:t_Co = &t_Co

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#303030', '#870000', '#5fd75f', '#afaf00', '#87afff', '#af00af', '#00afaf', '#6c6c6c', '#444444', '#ff0000', '#00ff00', '#ffff00', '#005fff', '#ff00ff', '#00ffff', '#ffffff']
  " Nvim uses g:terminal_color_{0-15} instead
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif

" bg blue -> #202050
" pink -> ffa8ff
" sky blue -> #00ffff

hi Normal           guifg=#4c4f69 guibg=#eff1f5               gui=NONE      cterm=NONE
hi EndOfBuffer      guifg=#4c4f69 guibg=#eff1f5               gui=NONE      cterm=NONE
hi StatusLine       guifg=#000000 guibg=#dadada               gui=bold      cterm=bold
hi StatusLineNC     guifg=#000000 guibg=#6c6c6c               gui=NONE      cterm=NONE
hi StatusLineTerm   guifg=#000000 guibg=#00ff00               gui=bold      cterm=bold
hi StatusLineTermNC guifg=#000000 guibg=#5fd75f               gui=NONE      cterm=NONE
hi VertSplit        guifg=#ffa8ff guibg=#a0a0a0               gui=NONE      cterm=NONE
hi Pmenu            guifg=#4c4f69 guibg=#ffffff               gui=NONE      cterm=NONE
hi PmenuSel         guifg=#4c4f69 guibg=#00ffff               gui=NONE      cterm=NONE
hi PmenuSbar        guifg=NONE    guibg=#000000               gui=NONE      cterm=NONE
hi PmenuThumb       guifg=NONE    guibg=#6c6c6c               gui=NONE      cterm=NONE
hi TabLine          guifg=#dadada guibg=#444444               gui=NONE      cterm=NONE
hi TabLineFill      guifg=NONE    guibg=#6c6c6c               gui=NONE      cterm=NONE
hi TabLineSel       guifg=#ffffff guibg=#000000               gui=bold      cterm=bold
hi ToolbarButton    guifg=#dadada guibg=#6c6c6c               gui=bold      cterm=bold
hi ToolbarLine      guifg=NONE    guibg=#303030               gui=NONE      cterm=NONE
hi NonText          guifg=#00afaf guibg=NONE                  gui=NONE      cterm=NONE
hi SpecialKey       guifg=#00afaf guibg=NONE                  gui=NONE      cterm=NONE
hi Folded           guifg=#00afaf guibg=#303030               gui=NONE      cterm=NONE
hi Visual           guifg=#0000ff guibg=#ffff00               gui=NONE      cterm=NONE
hi CursorLine       guifg=NONE    guibg=#6c6c6c               gui=NONE      cterm=NONE
hi CursorColumn     guifg=NONE    guibg=#6c6c6c               gui=NONE      cterm=NONE
hi CursorLineNr     guifg=#ffff00 guibg=NONE                  gui=bold      cterm=bold
hi ColorColumn      guifg=NONE    guibg=#444444               gui=NONE      cterm=NONE
hi QuickFixLine     guifg=#000000 guibg=#ff00ff               gui=NONE      cterm=NONE
hi VisualNOS        guifg=#dadada guibg=#6c6c6c               gui=NONE      cterm=NONE
hi LineNr           guifg=#ffa8ff guibg=NONE                  gui=NONE      cterm=NONE
hi FoldColumn       guifg=#00afaf guibg=NONE                  gui=NONE      cterm=NONE
hi SignColumn       guifg=#00afaf guibg=NONE                  gui=NONE      cterm=NONE
hi Underlined       guifg=#87afff guibg=NONE                  gui=underline cterm=underline
hi Error            guifg=#ffffff guibg=#ff0000               gui=NONE      cterm=NONE
hi ErrorMsg         guifg=#ffffff guibg=#ff0000               gui=NONE      cterm=NONE
hi ModeMsg          guifg=#ffffff guibg=NONE                  gui=bold      cterm=bold
hi WarningMsg       guifg=#ff0000 guibg=NONE                  gui=bold      cterm=bold
hi MoreMsg          guifg=#5fd75f guibg=NONE                  gui=bold      cterm=bold
hi Question         guifg=#00ff00 guibg=NONE                  gui=bold      cterm=bold
hi Todo             guifg=#005fff guibg=#ffff00               gui=NONE      cterm=NONE
hi MatchParen       guifg=#303030 guibg=#ffa8ff               gui=NONE      cterm=NONE
hi Search           guifg=#4c4f69 guibg=#ffa8ff               gui=NONE      cterm=NONE
hi IncSearch        guifg=#000000 guibg=#ffa8ff               gui=NONE      cterm=NONE
hi WildMenu         guifg=#000000 guibg=#ffff00               gui=NONE      cterm=NONE
hi Cursor           guifg=#000000 guibg=#dadada               gui=NONE      cterm=NONE
hi lCursor          guifg=#000000 guibg=#ff0000               gui=NONE      cterm=NONE
hi SpellBad         guifg=#ff0000 guibg=NONE    guisp=#ff0000 gui=undercurl cterm=underline
hi SpellCap         guifg=#005fff guibg=NONE    guisp=#005fff gui=undercurl cterm=underline
hi SpellLocal       guifg=#ff00ff guibg=NONE    guisp=#ff00ff gui=undercurl cterm=underline
hi SpellRare        guifg=#00ff00 guibg=NONE    guisp=#00ff00 gui=undercurl cterm=underline
hi Comment          guifg=#00afaf guibg=NONE                  gui=NONE      cterm=NONE
hi Identifier       guifg=#ff00ff guibg=NONE                  gui=NONE      cterm=NONE
hi Function         guifg=#00ff00 guibg=NONE                  gui=NONE      cterm=NONE
hi Statement        guifg=#4c4f69 guibg=NONE                  gui=bold      cterm=bold
hi Constant         guifg=#00ffff guibg=NONE                  gui=NONE      cterm=NONE
hi PreProc          guifg=#ff8c00 guibg=NONE                  gui=NONE      cterm=NONE 
hi Type             guifg=#00ff00 guibg=NONE                  gui=bold      cterm=bold
hi Special          guifg=#ff0000 guibg=NONE                  gui=NONE      cterm=NONE
hi Delimiter        guifg=#ff8c00 guibg=NONE                  gui=NONE      cterm=NONE
hi Directory        guifg=#00ffff guibg=NONE                  gui=NONE      cterm=NONE
hi Conceal          guifg=#6c6c6c guibg=NONE                  gui=NONE      cterm=NONE
hi Ignore           guifg=NONE    guibg=NONE                  gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Title            guifg=#ff00ff guibg=NONE                  gui=bold      cterm=bold
hi! link Terminal Normal
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
hi DiffAdd          guifg=#ffffff guibg=#5f875f gui=NONE cterm=NONE
hi DiffChange       guifg=#ffffff guibg=#5f87af gui=NONE cterm=NONE
hi DiffText         guifg=#000000 guibg=#c6c6c6 gui=NONE cterm=NONE
hi DiffDelete       guifg=#ffffff guibg=#af5faf gui=NONE cterm=NONE
