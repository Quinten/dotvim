# dotvim

This is my vim configuration.

## Window navigation

In normal mode:
 
- `Shift + arrow-left` and `Shift + arrow-right` cycle focus between splits (back and forth).
- `Tab-key` cycle forward through open tabs
- `Shift + Tab-key` cycle backwards through open tabs

## Custom commands for plugins

### Shortcut for NERDTree

```
    :NT
```

Open NERDTree file explorer.

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

## Installation

### Optional terminal settings

For the correct solarized theme terminal colors on OS X i use https://github.com/tomislav/osx-terminal.app-colors-solarized

As terminal font that can render some fancy triangles i use a font from https://github.com/powerline/fonts 

### Install latest vim

It is completly optional, but if you are using OS X you can install the latest vim with homebrew. 

```
    brew install vim
```

(I did this beacuase it gives me acces to the `*` register, which is the system clipboard. The vim that ships with OS X doesn't have this.)

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




