" ------------------------------------------------------------------------------------------  DUNDO  ---------------------------------------------------------------------------------------------------

function! DundoDiff()
  let g:dundobufname = 'dundo-diff'

  " Set up the buffer (this makes it hidden)
  let g:dundobuf = bufnr(g:dundobufname, 1)
  call setbufvar(g:dundobuf, "&buftype", "nofile")

  let g:undofile = undofile(expand("%"))

  " TODO: mention in help that Dundo doesn't support more than one
  " undodir value. It'll always look in the first one.
  if !filereadable(g:undofile)
    echo 'No undo file found for ' . expand("%")
    return
  endif

  let g:filecontent = systemlist("cat " . expand("%"))

  " setbufline only works on loaded buffers
  call bufload(g:dundobufname)
  let lnum = 0
  for line in g:filecontent
    let lnum = lnum + 1
    call setbufline(g:dundobuf, lnum, line)
  endfor

  au! BufLeave dundo-diff execute "diffoff! | " . g:dundobuf . " bwipeout"

  execute "vert diffsplit " . g:dundobufname
  silent execute 'rundo ' . fnameescape(g:undofile)
  norm zR

  map <buffer> > :diffput<cr>
  map <buffer> < :diffget<cr>
endfunc

" Dundo!
noremap <leader>dv :call DundoDiff()<cr>
command Dundo call DundoDiff()

