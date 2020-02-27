function! s:isAnsibleTask()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filepath =~ '\v/(tasks|roles|handlers)/.*\.ya?ml$' | return 1 | en

  return 0
endfunction

au BufNewFile,BufRead * if s:isAnsibleTask() | set ft=ansible_task | en
