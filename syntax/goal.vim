" Vim syntax file
" Language: GOAL agent programming
" Maintainer: No one
" Created: 29 april 2017
" Latest Change: 21 may 2018
" Files: .mod2g, .mas2g, .act2g, .test2g

if exists("b:current_syntax")
    finish
endif

"""""""""""""""""
" GOAL Keywords
"""""""""""""""""
syntax keyword goalStatementKeywords    pre in post
syntax keyword goalStatementKeywords    launchpolicy
syntax keyword goalStatementKeywords    contained type launch
syntax keyword cond contained if then when
syntax keyword rep contained forall do
syntax keyword goalBaseKeywords         contained percept bel goal not
syntax keyword goalActionKeywords       contained adopt drop insert delete
syntax keyword goalActionKeywords       contained send sent allother all someother some
syntax keyword goalActionKeywords       contained subscribe unsubscribe
syntax keyword goalTestKeywords         contained eventually leadsto never always until done
syntax keyword goalBoolean              containedin=goalBraceBlock true false
syntax keyword goalPreProcKeywords      order exit focus test timeout define use as with
syntax keyword goalPreProcKeywords      actionspec knowledge goals mas
syntax keyword goalPreProcKeywords      never nogoals select
syntax keyword goalPreProcKeywords      linear linearrandom linearall linearallrandom random randomall

syntax keyword goalCommentKeywords      contained TODO FIXME NOTE NB

" Some Prolog keywords
syntax keyword goalPrologPredicates     contained member findall bagof setof count length
syntax keyword goalPrologPredicates     contained select nth0 append permutation aggregate_all

" Starcraft keywords
syntax keyword sc contained base chokepoint enemyPlayer map ownRace region
syntax keyword sc contained attacking constructionSite enemy friendly gameframe mineralField nuke resources underConstruction vespeneGeyser winner
syntax keyword sc contained self status order
syntax keyword sc contained defensiveMatrix queueSize researching unitLoaded
syntax keyword sc contained cancel debugdraw forfeit morph startNewManager
syntax keyword sc contained buildAddon cancel land lift load research train unload unloadAll
syntax keyword sc contained ability attack follow hold move patrol stop
syntax keyword sc contained build gather repair
syntax keyword sc contained unit upgrade costs stats metrics combat


"""""""""""""""""
" GOAL Matchings
"""""""""""""""""
" structures
syntax match goalModuleStructure "\vmodule \w* \{"he=s+7,me=e-1

" special goal terms
syntax match goalBaseKeywords "a-goal" contained
syntax match goalBaseKeywords "goal-a" contained

" comments
syntax match goalComment "\v\%.*$" containedin=goalBraceBlock contains=goalCommentKeywords
syntax region goalLongComment start="\/\*"  end="\*/" containedin=goalBraceBlock contains=goalCommentKeywords

" GOAL Operators
syntax match goalOperator "\v\+" containedin=goalBraceBlock
syntax match goalOperator "\v-" containedin=goalBraceBlock
syntax match goalOperator "\v/" containedin=goalBraceBlock
syntax match goalOperator "\v\*" containedin=goalBraceBlock
syntax match goalOperator "\v\=" containedin=goalBraceBlock
syntax match goalOperator "\v\\\=" containedin=goalBraceBlock
syntax match goalOperator "\v is " containedin=goalBraceBlock

syntax match goalOperator "\v\<" containedin=goalBraceBlock
syntax match goalOperator "\v\>" containedin=goalBraceBlock
syntax match goalOperator "\v\<\=" containedin=goalBraceBlock
syntax match goalOperator "\v\>\=" containedin=goalBraceBlock

" numbers
syntax match goalNumber "\v\d" containedin=goalBraceBlock
syntax match goalNumber "\v[+-]\d" containedin=goalBraceBlock

" variables
syntax match goalVariable "\v<(_|\u)\w*>" contained

" Errornous characters
syntax match goalMissingVariable "\v, *(\)|,)" containedin=goalBraceBlock
syntax region goalErrorTerm start="\v<(_|\u)\w*>\(" end=")"


"""""""""""""""""
" GOAL Clusters
"""""""""""""""""
syntax cluster goalModuleContent contains=goalStatementKeywords,goalBaseKeywords,goalActionKeywords,goalPrologPredicates,goalVariable,goalPrologPredicates,goalTestKeywords,goalErrorVariable,goalErrorTerm,sc,cond,rep


"""""""""""""""""
" GOAL Regions
"""""""""""""""""
syntax region goalString start='\v"' skip="\v\\." end='\v"' containedin=goalBraceBlock
syntax region goalString start="\v'" skip="\v\\." end="\v'" containedin=goalBraceBlock

syntax region goalBraceBlock start="{" end="}" fold transparent contains=@goalModuleContent


"""""""""""""""""
" Higlighting
"""""""""""""""""
hi def link goalStatementKeywords   Statement
hi def link goalBaseKeywords        Function
hi def link goalActionKeywords      Function
hi def link goalTestKeywords        Statement
hi def link goalPrologPredicates    Keyword
hi def link goalModuleStructure     Structure
hi def link goalBoolean             Constant
hi def link goalPreProcKeywords     PreProc
hi def link goalOperator            Operator
hi def link goalNumber              Number
hi def link goalVariable            Identifier
hi def link goalComment             Comment
hi def link goalCommentKeywords     Todo
hi def link goalString              String
hi def link goalMissingVariable     Error
hi def link goalErrorTerm           Error
hi def link sc                      Function
hi def link goalLongComment         Comment
hi def link cond                    Conditional
hi def link rep                     Repeat

syntax sync fromstart

" the syntax is called goal :)
let b:current_syntax="goal"

