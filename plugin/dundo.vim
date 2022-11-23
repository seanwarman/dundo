" ------------------------------------------------------------------------------------------  DUNDO  ---------------------------------------------------------------------------------------------------

function! DundoDiff()
  let s:dundobufname = 'dundo-diff'

  " Set up the buffer (this makes it hidden)
  let s:dundobuf = bufnr(s:dundobufname, 1)
  call setbufvar(s:dundobuf, "&buftype", "nofile")

  let s:undofile = undofile(expand("%"))

  " TODO: mention in help that Dundo doesn't support more than one
  " undodir value. It'll always look in the first one.
  if !filereadable(s:undofile)
    echo 'No undo file found for ' . expand("%")
    return
  endif

  let s:filecontent = systemlist("cat " . expand("%"))

  " setbufline only works on loaded buffers
  call bufload(s:dundobufname)
  let lnum = 0
  for line in s:filecontent
    let lnum = lnum + 1
    call setbufline(s:dundobuf, lnum, line)
  endfor

  au! BufLeave dundo-diff execute "diffoff! | " . s:dundobuf . " bwipeout"

  execute "vert diffsplit " . s:dundobufname
  silent execute 'rundo ' . fnameescape(s:undofile)
  norm zR

  map <buffer> > :diffput<cr>
  map <buffer> < :diffget<cr>
endfunc

" Dundo!
noremap <leader>dv :call DundoDiff()<cr>
command! Dundo call DundoDiff()
