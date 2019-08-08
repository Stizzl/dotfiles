" CC Finn Hentai

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="magala"

hi Boolean        ctermfg=167
hi Character      ctermfg=221
hi Number         ctermfg=167
hi String         ctermfg=221 cterm=NONE
hi Conditional    ctermfg=134  cterm=bold
hi Constant       ctermfg=167 cterm=bold
hi Cursor         ctermfg=0   ctermbg=15
hi Debug          ctermfg=131 cterm=bold
hi Define         ctermfg=74
hi Delimiter      ctermfg=245
hi DiffAdd        ctermfg=121 ctermbg=134
hi DiffChange     ctermfg=245 ctermbg=237
hi DiffDelete     ctermfg=167 ctermbg=1
hi DiffText       ctermbg=239 cterm=bold

hi Directory      ctermfg=223 cterm=bold
hi Error          ctermfg=15  ctermbg=1
hi ErrorMsg       ctermfg=134  ctermbg=235 cterm=bold
hi Exception      ctermfg=223 cterm=bold
hi Float          ctermfg=167
hi FoldColumn     ctermfg=241 ctermbg=NONE
hi Folded         ctermfg=241 ctermbg=NONE
hi Function       ctermfg=223
hi Identifier     ctermfg=179 cterm=NONE
hi Ignore         ctermfg=8   ctermbg=0
hi IncSearch      ctermfg=186 ctermbg=0

hi Keyword        ctermfg=134  cterm=bold
hi Label          ctermfg=221 cterm=NONE
hi Macro          ctermfg=186
hi SpecialKey     ctermfg=74

hi MatchParen     ctermbg=238 cterm=bold
hi ModeMsg        ctermfg=221
hi MoreMsg        ctermfg=221
hi Operator       ctermfg=15

" complete menu
hi Pmenu          ctermfg=15 ctermbg=238
hi PmenuSel       ctermfg=235 ctermbg=134
hi PmenuSbar      ctermbg=134
hi PmenuThumb     ctermfg=15

hi PreCondit      ctermfg=223 cterm=bold
hi PreProc        ctermfg=223
hi Question       ctermfg=74
hi Repeat         ctermfg=134  cterm=bold
hi Search         ctermfg=15  ctermbg=238
" marks column
hi SignColumn     ctermfg=223 ctermbg=235
hi SpecialChar    ctermfg=134  ctermbg=235 cterm=bold
hi SpecialComment ctermfg=239 cterm=bold
hi Special        ctermfg=74
hi SpecialKey     ctermfg=245
hi Statement      ctermfg=134  cterm=bold
hi StatusLine     ctermfg=238 ctermbg=15
hi StatusLineNC   ctermfg=243 ctermbg=235
hi StorageClass   ctermfg=179
hi Structure      ctermfg=74
hi Tag            ctermfg=134
hi Title          ctermfg=214
hi Todo           ctermfg=0   ctermbg=74  cterm=bold

hi Typedef        ctermfg=74
hi Type           ctermfg=74  cterm=bold
hi Underlined     ctermfg=8   cterm=underline

hi VertSplit      ctermfg=232 ctermbg=232 cterm=bold
hi VisualNOS      ctermbg=237
hi Visual         ctermbg=237
hi WarningMsg     ctermfg=15  ctermbg=236 cterm=bold
hi WildMenu       ctermfg=74  ctermbg=0

hi Normal         ctermfg=15  ctermbg=NONE
hi Comment        ctermfg=239
hi CursorLine     ctermbg=236 cterm=NONE
hi CursorColumn   ctermbg=236
hi LineNr         ctermfg=243 ctermbg=NONE
hi NonText        ctermfg=235 ctermbg=NONE

set background=dark
