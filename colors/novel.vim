" White:      #ffffff
" LightGrey:  #a8a8a8
" DarkGrey:   #1c1c1c
" Black:      #000000
" Red:        #ff0000
" Bronze:     #af8700
" Orange:     #ffaf5f
" Yellow:     #ffffaf
" Pink:       #ffafff
" Green:      #5fff5f
" Salmon:     #ff8787
" Blue:       #87ffff

set background=dark

hi clear
let g:colors_name = 'novel'

hi CmpItemAbbrDefault guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi CmpItemAbbrDeprecatedDefault guifg=#ffaf5f guibg=NONE gui=NONE cterm=NONE
hi CmpItemAbbrMatchDefault guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi CmpItemAbbrMatchFuzzyDefault guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi CmpItemKindDefault guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi CmpItemMenuDefault guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi Comment guifg=#a8a8a8 guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#a8a8a8 guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#ffaf5f guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi CursorLineNr guifg=#a8a8a8 guibg=#1c1c1c gui=bold cterm=bold
hi Delimiter guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi DiagnosticDeprecated guifg=#ffffff guibg=NONE guisp=#ffaf5f gui=strikethrough cterm=strikethrough
hi DiagnosticError guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi DiagnosticHint guifg=#5fff5f guibg=NONE gui=NONE cterm=NONE
hi DiagnosticInfo guifg=#87ffff guibg=NONE gui=NONE cterm=NONE
hi DiagnosticOk guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#ff0000 gui=underline cterm=underline
hi DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#5fff5f gui=underline cterm=underline
hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#87ffff gui=underline cterm=underline
hi DiagnosticUnderlineOk guifg=NONE guibg=NONE guisp=#ffffff gui=underline cterm=underline
hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#ffaf5f gui=underline cterm=underline
hi DiagnosticWarn guifg=#ffaf5f guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#000000 guibg=#5fff5f gui=NONE cterm=NONE
hi DiffChange guifg=#000000 guibg=#87ffff gui=NONE cterm=NONE
hi DiffDelete guifg=#000000 guibg=#ff0000 gui=NONE cterm=NONE
hi DiffText guifg=#000000 guibg=#a8a8a8 gui=NONE cterm=NONE
hi Directory guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#a8a8a8 guibg=NONE gui=bold cterm=bold
hi Error guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi FloatShadow guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi FloatShadowThrough guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi FoldColumn guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi Folded guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#ffffaf guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#5fff5f guibg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#000000 guibg=#ffffaf gui=NONE cterm=NONE
hi LineNr guifg=#a8a8a8 guibg=NONE gui=bold cterm=bold
hi MatchParen guifg=#ffffaf guibg=#af8700 gui=NONE cterm=NONE
hi ModeMsg guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#000000 guibg=#ffafff gui=NONE cterm=NONE
hi Normal guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi NvimInternalError guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#1c1c1c gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi PmenuSel guifg=#000000 guibg=#a8a8a8 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#a8a8a8 gui=NONE cterm=NONE
hi PreProc guifg=#ffafff guibg=NONE gui=NONE cterm=NONE
hi Question guifg=#87ffff guibg=NONE gui=bold cterm=bold
hi QuickFixLine guifg=#000000 guibg=#87ffff gui=NONE cterm=NONE
hi RedrawDebugClear guifg=#000000 guibg=#ffffaf gui=NONE cterm=NONE
hi RedrawDebugComposed guifg=#000000 guibg=#5fff5f gui=NONE cterm=NONE
hi RedrawDebugNormal guifg=#000000 guibg=#87ffff gui=NONE cterm=NONE
hi RedrawDebugRecompose guifg=#000000 guibg=#ff0000 gui=NONE cterm=NONE
hi Search guifg=#000000 guibg=#ffffaf gui=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#ffffff guibg=NONE guisp=#ff0000 gui=undercurl cterm=underline
hi SpellCap guifg=#ffffff guibg=NONE guisp=#ffffaf gui=undercurl cterm=underline
hi SpellLocal guifg=#ffffff guibg=NONE guisp=#5fff5f gui=undercurl cterm=underline
hi SpellRare guifg=#ffffff guibg=NONE guisp=#ffaf5f gui=undercurl cterm=underline
hi Statement guifg=#ff8787 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#ffffff guibg=#1c1c1c gui=bold cterm=bold
hi StatusLineNC guifg=#ffffff guibg=#1c1c1c gui=NONE cterm=NONE
hi StatusLineTerm guifg=#ffffff guibg=#1c1c1c gui=bold cterm=bold
hi StatusLineTermNC guifg=#ffffff guibg=#1c1c1c gui=NONE cterm=NONE
hi TabLine guifg=#ffffff guibg=#1c1c1c gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#a8a8a8 gui=NONE cterm=NONE
hi TermCursor guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
hi Title guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#000000 guibg=#87ffff gui=NONE cterm=NONE
hi ToolbarButton guifg=#000000 guibg=#a8a8a8 gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi Type guifg=#87ffff guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#ffffff guibg=NONE gui=underline cterm=underline
hi VertSplit guifg=#1c1c1c guibg=#1c1c1c gui=NONE cterm=NONE
hi Visual guifg=#000000 guibg=#a8a8a8 gui=NONE cterm=NONE
hi VisualNOS guifg=#000000 guibg=#a8a8a8 gui=NONE cterm=NONE
hi WarningMsg guifg=#ffaf5f guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#000000 guibg=#a8a8a8 gui=bold cterm=bold
hi WinBar guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
hi! link Terminal Normal

" vim: et ts=2 sw=2
