# dotvim

This is my (basic) vim configuration.

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




