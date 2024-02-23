# Mostly Kickstart
Made my own config (Copied Prime for the most part) and ran with that for a bit. That was fun! Recently I've been giving kickstart a try and quite like it. Might even try using the debugger at some point!

# Requirements
1. needs nvim 10.0+ for osc-52 clipboard (only necessary on chromeOS)

# Installation
## Dotfiles
1. clone dotfiles ( `git clone git@github.com:fx-wood/.dotfiles` )
2. ask why he named it `.dotfiles` with a period
3. `ln -s` the files correctly ( good luck :D )

## Neovim
Don't trust the install scripts
1. clone neovim ( `git clone git@github.com:neovim/neovim` )
2. check out 10.0+ ( `git checkout nightly` )
2. build neovim ( `make CMAKE_BUILD_TYPE=RelWithDebInfo` )
3. install neovim ( `make CMAKE_INSTALL_PREFIX="/usr/local/bin"`)
4. make sure it's on the path

# Sources
nvim-lua/kickstart.nvim
The Primeagen: https://github.com/ThePrimeagen/.dotfiles
also his YouTube videos:
  -https://www.youtube.com/watch?v=DogKdiRx7ls
  -https://www.youtube.com/watch?v=x2QJYq4IX6M

