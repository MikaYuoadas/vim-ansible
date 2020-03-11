if !exists("main_syntax")
  let main_syntax = 'yaml'
endif

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif

syntax include @Jinja syntax/jinja2.vim

if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
endif

syn match  yamlDocumentStart /^---\ze\%(\s\|$\)/
syn match  yamlDocumentEnd   /^\.\.\.\ze\%(\s\|$\)/

syn keyword yamlTodo    contained TODO FIXME XXX NOTE
syn region  yamlComment display oneline start='\%(^\|\s\)#' end='$' contains=yamlTodo

syn match yamlKeyValueDelimiter /\s*:/ contained nextgroup=yamlValue skipnl


syn region ansibleTask start=/^-\s/ end=/^\ze-/ contains=yamlComment
syn region ansibleTaskKeyValue start=/^\zs\%(\s\|-\)\s[^ \t"'#]\+\s*:/ end=/^\ze\%(\s\s[^ \t"'#]\+\s*:\|-\)/ contained containedin=ansibleTask contains=yamlComment
syn match  ansibleTaskKey /^\%(\s\s\zs\|-\s\)[^ \t"'#]\+\ze\s*:/ contained containedin=ansibleTaskKeyValue nextgroup=yamlKeyValueDelimiter
syn match  ansibleTaskStart /^-\s/ contained containedin=ansibleTaskKey

syn region yamlValue start=// end=/^\ze\%(-\|\s\s\S\)/ contained contains=yamlString,@Jinja,yamlComment
syn region yamlString matchgroup=yamlStringDelimiter start=/"/ skip=/\\"/ end=/"/ oneline contained contains=@Jinja
syn region yamlString matchgroup=yamlStringDelimiter start=/'/ skip=/\\'/ end=/'/ oneline contained contains=@Jinja
syn match yamlItemStart /^\s*\zs-/ contained containedin=yamlValue

syn match ansibleModuleAttribute /\w\+=/ containedin=yamlValue
syn match ansibleModuleAttribute /^\s*[^ \t"'#]\+\ze\s*:/ containedin=yamlValue nextgroup=yamlKeyValueDelimiter

syn region yamlComment oneline start='\%\(^\|\s\)#' end='$' contains=yamlTodo


syn keyword ansibleTaskKeyword action contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword any_errors_fatal contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword args contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword async contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword become contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword become_exe contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword become_flags contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword become_method contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword become_user contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword changed_when contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword check_mode contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword collections contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword connection contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword debugger contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword delay contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword delegate_facts contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword delegate_to contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword diff contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword environment contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword failed_when contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword ignore_errors contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword ignore_unreachable contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword local_action contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword loop contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword loop_control contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword module_defaults contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword name contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword no_log contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword notify contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword poll contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword port contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword register contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword remote_user contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword retries contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword run_once contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword tags contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword throttle contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword until contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword vars contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword when contained containedin=ansibleTaskKey
syn keyword ansibleTaskKeyword with_<lookup_plugin> contained containedin=ansibleTaskKey


syn keyword ansibleModule authorized_key contained containedin=ansibleTaskKey
syn keyword ansibleModule command contained containedin=ansibleTaskKey
syn keyword ansibleModule copy contained containedin=ansibleTaskKey
syn keyword ansibleModule expect contained containedin=ansibleTaskKey
syn keyword ansibleModule file contained containedin=ansibleTaskKey
syn keyword ansibleModule get_url contained containedin=ansibleTaskKey
syn keyword ansibleModule git contained containedin=ansibleTaskKey
syn keyword ansibleModule group contained containedin=ansibleTaskKey
syn keyword ansibleModule hg contained containedin=ansibleTaskKey
syn keyword ansibleModule known_hosts contained containedin=ansibleTaskKey
syn keyword ansibleModule lineinfile contained containedin=ansibleTaskKey
syn keyword ansibleModule mysql_db contained containedin=ansibleTaskKey
syn keyword ansibleModule mysql_user contained containedin=ansibleTaskKey
syn keyword ansibleModule pacman contained containedin=ansibleTaskKey
syn keyword ansibleModule pause contained containedin=ansibleTaskKey
syn keyword ansibleModule replace contained containedin=ansibleTaskKey
syn keyword ansibleModule service contained containedin=ansibleTaskKey
syn keyword ansibleModule set_fact contained containedin=ansibleTaskKey
syn keyword ansibleModule shell contained containedin=ansibleTaskKey
syn keyword ansibleModule slurp contained containedin=ansibleTaskKey
syn keyword ansibleModule stat contained containedin=ansibleTaskKey
syn keyword ansibleModule systemd contained containedin=ansibleTaskKey
syn keyword ansibleModule template contained containedin=ansibleTaskKey
syn keyword ansibleModule unarchive contained containedin=ansibleTaskKey
syn keyword ansibleModule user contained containedin=ansibleTaskKey
syn keyword ansibleModule yaourt contained containedin=ansibleTaskKey

hi link yamlDocumentStart      PreProc
hi link yamlDocumentEnd        PreProc
hi link yamlKeyValueDelimiter  Special
hi link yamlStringDelimiter    Delimiter
hi link yamlItemStart          Label

hi link ansibleTaskStart       yamlItemStart
hi link ansibleTaskKey         Error
hi link ansibleTaskKeyword     Identifier
hi link ansibleModule          Function
hi link ansibleModuleAttribute Comment

hi link jinjaVariable Constant
hi link jinjaVarDelim Delimiter

let b:current_syntax = "ansible"
