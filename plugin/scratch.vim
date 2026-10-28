" scratch.vim: throwaway buffers, empty or filled from a shell command or another
" buffer, that can be saved to a file later.
if exists('g:loaded_scratch')
  finish
endif
let g:loaded_scratch = 1

" Where :ScratchSave writes when no path is given
let g:scratch_dir = get(g:, 'scratch_dir', expand('~/scratch'))

" New scratch buffer in a vertical split (!: in the current window)
command! -bang Scratch call scratch#new(<bang>0)

" Scratch buffer in the current window with the output of a shell command
command! -nargs=+ -complete=customlist,scratch#complete_from ScratchFrom call scratch#from(<q-args>)

" Copy a buffer into a new scratch buffer, keeping its filetype.
" No argument or %: current buffer, limited to the range if one is given.
" Otherwise: that whole buffer (name, number or #), or else that file, read
" without opening it (<Tab> completes both).
command! -bang -range=% -nargs=? -complete=customlist,scratch#complete_buf ScratchBuf
      \ call scratch#buf(<bang>0, <line1>, <line2>, <q-args>)

" Turn the scratch buffer into a file: the given path, or a timestamped file in
" g:scratch_dir
command! -bang -nargs=? -complete=file ScratchSave call scratch#save(<bang>0, <q-args>)
