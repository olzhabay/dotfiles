### Features:
 - Only depends on GIT
 - It was designed having in mind being forked so that you can freely modify it.
 - As well if you are not going to modify you can just download it.
 - BASH configuration with a cool prompt and a separated file structure to ease distributing your configuratiom accross different machines.
 - VIM configuration and selection of Plugins focussed in C/C++ development.
 - GDB configuration which support C++ standard library data strutures and more fancy things.
 - SCREEN & TMUX configuration to make it more fancy and to support 256 colors with vim.
 - GIT configuration with several shortcuts, extra tools and many colors.
 - Few extras such as fonts and dircolors.
 - More..

## Install it
    
```sh
# First, make sure you have git installed, if not run the next command if you are in ubuntu:
$ sudo apt-get install git

# Then, clone the repository and install the dotfiles:
$ git clone --recursive git@github.com:olzhabay/dotfiles.git .dotfiles && cd .dotfiles && ./bin/dfm install && vim -c 'PluginUpdate'
```

### How to update it
```sh
#It will destroy any change in those files, but not in .bash_independent. Go to dotfiles directory
$ cd ~/.dotfiles && git fetch --all && git reset --hard origin/master

# This will not delete the .bash_independent file.
```

## Thanks to
 - [Vicente Adolfo Bolea Sanchez][vicente].
 - [DFM][dfm]:                    a.k.a Dot Files Manager, made possible having the dotfiles in a separated directory.
 - [mathiasbynens/dotfiles][mat]: Some of the ideas are taking from this repository.

