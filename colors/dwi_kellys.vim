" Description:	a colour scheme bassed on Kellys ColorScheme (http://vimcolorschemetest.googlecode.com/svn/colors/kellys.vim) by kamil.stachowski@gmail.com
"  Maintainer:	dwiasharialdy@gmail.com
"     License:	gpl 3+
"     Version:	0.1 (2011.02.20)

" changelog:
"         0.1:	2011.02.20
"       		initial version, forking from Kellys ColorScheme
"       		Change several elements


set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "dwi_kellys"

hi Comment		guifg=#303133	guibg=#030408	gui=italic ctermfg=236
hi LineNr		guifg=#47484b	guibg=#111215	gui=none ctermfg=238
hi Cursor 		guifg=#2a2b2f	guibg=#e1e0e5	gui=none ctermfg=236
hi Constant 	guifg=#d1c79e	guibg=#030408	gui=none ctermfg=187
hi CursorLine		          	guibg=#0a0b0f	gui=none ctermbg=233
hi DiffAdd		guifg=#2a2b2f	guibg=#9ab2c8	gui=none ctermfg=236
hi DiffChange	guifg=#2a2b2f	guibg=#d1c79e	gui=none ctermfg=236
hi DiffDelete	guifg=#67686b	guibg=#030408	gui=none ctermfg=242
hi DiffText		guifg=#9d0e15	guibg=#d1c79e	gui=none ctermfg=124
hi Folded 		guifg=#000000	guibg=#212225	gui=none ctermfg=0
hi MatchParen	guifg=#030408	guibg=#FF5500	gui=bold ctermfg=0
hi ModeMsg		guifg=#e1e0e5	guibg=#030408	gui=bold ctermfg=7
hi Normal 		guifg=#e1e0e5	guibg=#030408	gui=none ctermfg=7
hi NonText		guifg=#030408	guibg=#030408	gui=none ctermfg=0
hi Pmenu		guifg=#2a2b2f	guibg=#9ab2c8	gui=none ctermfg=236
hi PmenuSel		guifg=#2a2b2f	guibg=#62acce	gui=bold ctermfg=236
hi PmenuSbar	guifg=#2a2b2f	guibg=#030408	gui=none ctermfg=236
hi PmenuThumb	guifg=#2a2b2f	guibg=#62acce	gui=none ctermfg=236
hi PreProc		guifg=#d1d435	guibg=#030408	gui=none ctermfg=185
hi Search		guifg=#2a2b2f	guibg=#e1e0e5	gui=none ctermfg=236
hi Special		guifg=#9ab2c8	guibg=#030408	gui=none ctermfg=110
hi Statement	guifg=#62acce	guibg=#030408	gui=bold ctermfg=74
hi StatusLine 	guifg=#000000	guibg=#62acce	gui=bold ctermfg=0
hi StatusLineNC guifg=#2a2b2f	guibg=#e1e0e5	gui=none ctermfg=236
hi String		guifg=#d1c79e	guibg=#0a0b0f ctermfg=187   gui=none
hi Todo 		guifg=#e1e0e5	guibg=#9d0e15	gui=bold ctermfg=7
hi Type 		guifg=#e6ac32	guibg=#030408	gui=none ctermfg=179
hi Underlined	guifg=#e1e0e5	guibg=#030408	gui=underline ctermfg=7
hi VertSplit	guifg=#616065	guibg=#616065	gui=none ctermfg=241
hi Visual		guibg=#445566	gui=none ctermbg=240
hi Wildmenu		guifg=#62acce	guibg=#030408	gui=bold ctermfg=74


hi! link Boolean		Constant
hi! link Character		Constant
hi! link Conditional	Statement
hi! link CursorColumn	CursorLine
hi! link Debug			Special	
hi! link Define			PreProc
hi! link Delimiter		Special
hi! link Directory		Type
hi! link Error			Todo
hi! link ErrorMsg		Error
hi! link Exception		Statement
hi! link Float			Constant
hi! link FoldColumn		Folded
hi! link Function		Normal
hi! link Identifier		Special
hi! link Ignore			Comment
hi! link IncSearch		Search
hi! link Include		PreProc
hi! link Keyword		Statement
hi! link Label			Statement
hi! link Macro			PreProc
hi! link MoreMsg		ModeMsg
hi! link Number			Constant
hi! link Operator		Special
hi! link PreCondit		PreProc
hi! link Question		MoreMsg
hi! link Repeat			Statement
hi! link SignColumn		FoldColumn
hi! link SpecialChar	Special
hi! link SpecialComment	Special
hi! link SpecialKey		Special
hi! link SpellBad		Error
hi! link SpellCap		Error
hi! link SpellLocal		Error
hi! link SpellRare		Error
hi! link StorageClass	Type
hi! link Structure		Type
hi! link Tag			Special
hi! link Title			ModeMsg
hi! link Typedef		Type
hi! link WarningMsg		Error

" ada
hi! link adaBegin			Type
hi! link adaEnd				Type
hi! link adaKeyword			Special
" c++
hi! link cppAccess			Type
hi! link cppStatement		Special
" hs
hi! link ConId				Type
hi! link hsPragma			PreProc
hi! link hsConSym			Operator
" html
hi! link htmlArg			Statement
hi! link htmlEndTag			Special
hi! link htmlLink			Underlined
hi! link htmlSpecialTagName	PreProc
hi! link htmlTag			Special
hi! link htmlTagName		Type
" java
hi! link javaTypeDef		Special
" lisp
hi! link lispAtom			Constant
hi! link lispAtomMark		Constant
hi! link lispConcat			Special
hi! link lispDecl			Type
hi! link lispFunc			Special
hi! link lispKey			PreProc
" pas
hi! link pascalAsmKey		Statement
hi! link pascalDirective	PreProc
hi! link pascalModifier		PreProc
hi! link pascalPredefined	Special
hi! link pascalStatement	Type
hi! link pascalStruct		Type
" php
hi! link phpComparison		Special
hi! link phpDefine			Normal
hi! link phpIdentifier		Normal
hi! link phpMemberSelector	Special
hi! link phpRegion			Special
hi! link phpVarSelector		Special
" py
hi! link pythonStatement	Type
" rb
hi! link rubyConstant		Special
hi! link rubyDefine			Type
hi! link rubyRegexp			Special
" scm
hi! link schemeSyntax		Special
" sh
hi! link shArithRegion		Normal
hi! link shDerefSimple		Normal
hi! link shDerefVar			Normal
hi! link shFunction			Type
hi! link shLoop				Statement
hi! link shStatement		Special
hi! link shVariable			Normal
" sql
hi! link sqlKeyword			Statement
" vim
hi! link vimCommand			Statement
hi! link vimCommentTitle	Normal
hi! link vimEnvVar			Special
hi! link vimFuncKey			Type
hi! link vimGroup			Special
hi! link vimHiAttrib		Constant
hi! link vimHiCTerm			Special
hi! link vimHiCtermFgBg		Special
hi! link vimHighlight		Special
hi! link vimHiGui			Special
hi! link vimHiGuiFgBg		Special
hi! link vimOption			Special
hi! link vimSyntax			Special
hi! link vimSynType			Special
hi! link vimUserAttrb		Special
" xml
hi! link xmlAttrib			Special
hi! link xmlCdata			Normal
hi! link xmlCdataCdata		Statement
hi! link xmlCdataEnd		PreProc
hi! link xmlCdataStart		PreProc
hi! link xmlDocType			PreProc
hi! link xmlDocTypeDecl		PreProc
hi! link xmlDocTypeKeyword	PreProc
hi! link xmlEndTag			Statement
hi! link xmlProcessingDelim	PreProc
hi! link xmlNamespace		PreProc
hi! link xmlTagName			Statement
hi User1 guibg=#aa0000 ctermbg=124 guifg=#ffffff ctermfg=15

