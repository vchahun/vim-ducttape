" Vim syntax file
" Language:	Ducttape
" Maintainer:	Victor Chahuneau
" Last Change:	2012 December 3
"

" TODO
" - options X: y=z (highlight ":") (note:conflicts with dtVarDefinition)
" - definitions :: x=y (hightlight "=") (note: can have multiple definitions)

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword dtStatement global group func using branchpoint baseline branch switch default
syn keyword dtStatement task package summary scheduler plan versioner action of nextgroup=dtDefinition skipwhite
syn keyword dtKeyword while for do reach via contained
syn keyword dtConstant true false contained

syn match dtComment "#.*$"
syn match dtNumber "\<[0-9]\+\>" contained
syn match dtVariable "\$\w\+"
syn match dtVariable "$\w\+@\w\+"
syn match dtVariable "$\w\+@\w\+\[\w\+:\w\+\]"
syn match dtNumber "\<\d\+..\d\+\>"
syn match dtOperator "::"
syn match dtOperator "<" nextgroup=dtVarDefinition skipwhite
syn match dtOperator ">" nextgroup=dtVarDefinition skipwhite
syn match dtVarOperator "=" nextgroup=dtVariable,dtNumber,dtString skipwhite contained

" task my_task ::
syn match dtDefinition "[a-zA-Z]\w*" nextgroup=dtOperator skipwhite contained
" < x=$y
syn match dtVarDefinition "[a-zA-Z]\w*" nextgroup=dtVarOperator skipwhite contained

syn region dtString start=/"/ skip=/\\"/ end=/"/ contains=dtVariable
syn region dtString start=/'/ skip=/\\'/ end=/'/ contains=dtVariable
syn region dtBlock start="{" end="}" contains=dtVariable,dtKeyword,dtConstant,dtNumber,dtComment,dtString,dtBlock,dtStatement
syn region dtOptionBlock start="(" end=")" contains=dtNumber,dtVarDefinition

let b:current_syntax = "ducttape"

hi def link dtStatement    Type
hi def link dtKeyword      Keyword
hi def link dtComment      Comment
hi def link dtNumber       Constant
hi def link dtConstant     Constant
hi def link dtVariable     Identifier
hi def link dtOperator     Operator
hi def link dtString       String
hi def link dtDefinition   PreProc
hi def link dtVarOperator  Operator
hi def link dtOption       PreProc
