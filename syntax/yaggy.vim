scriptencoding utf-8
" Vim syntax file
" Language: Yaggy
" Maintainer: Yuri Egorov <ysegorov at gmail dot com>
" License: Vim License

if exists("b:current_syntax")
  finish
endif

syn match ygReference "\<@[-/[:alnum:]_]\+\(.stdout\)\?"
syn match ygVar "\${[/[:alpha:]]\+[.:/[:alnum:]_]\+}"

syn region ygComment start="#" end="\n"

syn region ygEcho
  \ matchgroup=ygEchoCmd
  \ start="\<ECHO"
  \ skip="\\$"
  \ matchgroup=NONE
  \ end="\n"
  \ contains=ygVar

syn region ygLocal
  \ matchgroup=ygLocalCmd
  \ start="\<LRUN!\?\|LFAILED?\|LSUCCEED?"
  \ skip="\\$"
  \ matchgroup=NONE
  \ end="\n"
  \ contains=ygVar,ygReference

syn region ygInclude
  \ matchgroup=ygIncludeCmd
  \ start="\<VARS\|SECRETS\|INCLUDE"
  \ matchgroup=NONE
  \ end="\n"

syn region ygRemote
  \ matchgroup=ygRemoteCmd
  \ start="\<RUN!\?\|FAILED?\|SUCCEED?\|SYNC\|FETCH\|CONNECT\|RECONNECT\|DISCONNECT"
  \ matchgroup=NONE
  \ skip="\\$"
  \ end="\n"
  \ contains=ygVar,ygReference

syn region ygTag
  \ matchgroup=ygTagCmd
  \ start="\<TAG\|UNTAG"
  \ matchgroup=NONE
  \ end="\n"

hi def link ygEchoCmd                   Macro
hi def link ygEcho                      String
hi def link ygIncludeCmd                Identifier
hi def link ygInclude                   Normal
hi def link ygLocalCmd                  Macro
hi def link ygLocal                     Normal
hi def link ygRemoteCmd                 Keyword
hi def link ygRemote                    Normal
hi def link ygTagCmd                    Tag
hi def link ygTag                       SpecialChar
hi def link ygReference                 Include
hi def link ygVar                       Include
hi def link ygComment                   Comment

let b:current_syntax = "yaggy"
