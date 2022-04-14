# texrun.vim
A runner for lualatex.

## Requirement

- ``lualatex``


- ``zsh``


## Install

### vim-plug

```vim
Plug 'Cassin01/texrun.vim'
let g:texrun#file_name = 'l02.tex'
```

### packer

```fennel
(use {1 :Cassin01/texrun.vim
      :config (λ [] (tset vim.g :texrun#file_name :l02.tex))})
```

## Usage

The file is automatically compiled when you save it.

## A shell code carried out in internal.

texrun.vim using sub shell.

```sh
(cd `%:h` && lualatex --halt-on-error `%:r`)
```

## Affinity
[vim-autosave](https://github.com/907th/vim-auto-save)
