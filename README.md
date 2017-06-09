# dotvim

This is my vim configuration.

## Window navigation

In normal mode:

- `Shift + arrow-left` and `Shift + arrow-right` cycle focus between splits (back and forth).
- `Tab-key` cycle forward through open tabs
- `Shift + Tab-key` cycle backwards through open tabs

In insert mode:

- `Control + a` moves to the beginning of a line.
- `Control + e` moves to the end of a line.

## Text manipulation

```
    :RW
```

Remove all trailing whitespace from the end of all lines in a file.

```
    :EH
```

Escape HTML. Accepts a range or visual selection. Defaults to the current line.

```
    :UH
```

Unescape HTML. Accepts a range or visual selection. Defaults to the current line.

## Handy system commands

```
    :CF
```

Copies the whole file to the system clipboard.

```
    :SH
```

Open a shell with current user logged in. (Type `exit` to return to vim)

## Finding words/patterns in files

All commands open the results in a quickfix window. Moving to a line and hitting enter opens the file and places the cursor at the result.

```
    :FCF
```

Find the word under the cursor in the current file.

```
    :FCD
```

Find the word under the cursor in the current working directory.

```
    :FSF
```

Find the word from the system clipboard in the current file.

```
    :FSD
```

Find the word from the system clipboard in the current working directory.

```
    :FYF
```

Find the word in the default register in the current file.

```
    :FYD
```

Find the word in the default register in the current working directory.

```
    :FFF needle ./path/to/dir/**
```

Find with arguments. `**` the double asteriks is for recursive directory traversing.

```
    :FFF expression\ with\ spaces ./path/to/dir/**
```

To search for expressions with spaces, you can escape the spaces.

```
    :FF filename
```

Find files by filename. Searches through the current working directory.

## Custom commands for plugins

### Shortcuts for NERDTree

```
    :NT
```

Open NERDTree file explorer.

```
    :NTF
```

Aka :NERDTreeFind -> Reveal current file in NERDTree.

See also https://github.com/scrooloose/nerdtree

### Shortcuts for visual split

```
    <line1>,<line2>VS
```

With a some lines visually selected, hit `:` behind `:'<,'>` type `VS`

It creates a horizontal split with the height as high as the number of lines selected.

Also works with numbers. Ex:

```
    :5,15VS
```

If you want to resize an existing horizontal split use `VR`.

```
    <line1>,<line2>VR
```

See also https://github.com/wellle/visual-split.vim

## Other usefull vim things not specific for this configuration

- `Control-w gf` opens the filepath that is under the cursor in a new tab
- `:%bd` closes all buffers

## Installation

### Optional terminal settings

~~For the correct solarized theme terminal colors on OS X i use https://github.com/tomislav/osx-terminal.app-colors-solarized~~

For my osx terminal color profile i use https://github.com/Quinten/flatlite-osx-terminal-profile

As terminal font that can render some fancy triangles i use a font from https://github.com/powerline/fonts

### Install latest vim

It is completly optional, but if you are using OS X you can install the latest vim with homebrew.

```
    brew install vim
```

After you did this you must restart Terminal.

I did this beacuase it gives me acces to the `*` register, which is the system clipboard. The vim that ships with OS X doesn't have this.

More info about installing vim with homebrew can be found at http://stackoverflow.com/questions/21694327/installing-vim-with-homebrew

### Install with git

To install this configuration on a new machine:
Make sure you have backed up the .vimrc file and .vim folder, because these will be overridden.
Then run the following commands:

```
    cd
    git clone git@github.com:Quinten/dotvim.git .vim
    echo "runtime vimrc" > .vimrc
```

This repository has submodules. You still need to run:

```
    cd .vim
    git submodule init
    git submodule update
```

The idea to structure my vim configuration like this was taken from http://stackoverflow.com/a/18203545

Similar to this repo i also have created https://github.com/Quinten/dottmux for my tmux configuration.
