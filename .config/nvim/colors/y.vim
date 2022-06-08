" set colors (Normal, Comment, Constant, Special, Identifier, Statement,
" Preproc, Type, Function, Repeat, Operator, Ignore, Error, Todo, String,
" Character, Number, Boolean, Float, Conditional, Label, Keyword, Exception,
" Include, Define, Macro, PreCondit, StrongeClass, Structure, Typedef, Tag,
" SpecialChar, Delimiter, Specialcomment, Debug, SpellBad)
" hi link <any> <any>
highlight CursorLine cterm=none ctermbg=black ctermfg=none 
highlight LineNrAbove ctermfg=Darkgrey
highlight LineNrBelow ctermfg=Darkgrey
highlight MatchParen cterm=underline ctermfg=green ctermbg=none
highlight Visual ctermbg=black cterm=reverse
highlight Comment ctermfg=darkgrey cterm=NONE gui=NONE guifg=darkGrey
highlight Constant ctermfg=lightGreen cterm=NONE gui=NONE guifg=LightGreen
highlight Cursor cterm=inverse ctermfg=black guifg=bg guibg=fg
highlight SpellBad     ctermfg=red ctermbg=none
highlight SpellCap     ctermfg=brown ctermbg=none
highlight Special	term=bold		ctermfg=LightBlue	guifg=Red
highlight Identifier term=underline	cterm=bold			ctermfg=Cyan guifg=#40ffff
highlight PreProc	term=underline	ctermfg=Blue	guifg=#ff80ff
highlight Type	term=underline		ctermfg=Green	guifg=#60ff60 gui=bold
highlight Function	term=bold		ctermfg=White guifg=White
highlight Repeat	term=underline	ctermfg=White		guifg=white
highlight Operator				ctermfg=Red			guifg=Red
highlight Ignore				ctermfg=black		guifg=bg
highlight Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
highlight Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
highlight link String	Constant
highlight link Character	Constant
highlight link Number	Constant
highlight link Boolean	Constant
highlight link Float		Number
highlight link Conditional	Repeat
highlight link Label		Statement
highlight link Keyword	Statement
highlight link Exception	Statement
highlight link Include	PreProc
highlight link Define	PreProc
highlight link Macro		PreProc
highlight link PreCondit	PreProc
highlight link StorageClass	Type
highlight link Structure	Type
highlight link Tag	Type
highlight link Typedef	Type
highlight link SpecialChar	PreProc
highlight link Delimiter	PreProc
highlight link SpecialComment PreProc
highlight link Debug		PreProc
