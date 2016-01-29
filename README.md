# dotvim

This is my vim configuration.



## Custom commands

### Custom plugin shortcuts

```
    :NT
```

Open NERDTree file explorer.

See also https://github.com/scrooloose/nerdtree



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

### Install with git

To install on a new machine:
Make sure you have backed up the .vimrc file and .vim folder, because these will be overridden.
Then run the following commands:

    cd
    git clone https://github.com/Quinten/dotvim.git .vim
    echo "runtime vimrc" > .vimrc

This repository has submodules. You still need to run:

    cd .vim
    git submodule init
    git submodule update

The idea to structure my vim configuration like this was taken from http://stackoverflow.com/a/18203545

Similar to this repo i also have created https://github.com/Quinten/dottmux for my tmux configuration.




