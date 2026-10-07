# scratch.vim

Throwaway buffers (`buftype=nofile`, wiped when hidden), empty or filled from a
shell command or another buffer, that can be saved to a file later.

| Command | What it does |
| --- | --- |
| `:Scratch[!]` | New scratch buffer in a vertical split (`!`: in the current window). |
| `:ScratchFrom {cmd}` | Scratch buffer in the current window with the output of a shell command. |
| `:[range]ScratchBuf[!] [buffer]` | Copy a buffer (or the range of the current one) into a new scratch buffer, keeping its filetype. |
| `:ScratchSave[!] [path]` | Turn the scratch buffer into a file: `path`, or a timestamped `.txt` in `g:scratch_dir`. |

`:ScratchFrom` pairs well with the quickfix list: `:ScratchFrom rg --vimgrep pattern`,
trim the lines, then `:cgetbuffer`.

## Options

| Variable | Default |
| --- | --- |
| `g:scratch_dir` | `~/scratch` |

## Install

```vim
Plug 'roumail/scratch.vim'
```
