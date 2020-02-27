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


syn keyword ansibleTaskKeyword name when register notify loop contained containedin=ansibleTaskKey
syn keyword ansibleModule unarchive copy stat user group file get_url slurp lineinfile template state contained containedin=ansibleTaskKey
syn region  yamlComment oneline start='\%\(^\|\s\)#' end='$' contains=yamlTodo


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
