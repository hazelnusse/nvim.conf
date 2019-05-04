# Building and installing neovim
Neovim uses make to drive a CMake build that fetches all dependencies
automatically. This is the simplest way to get the latest Neovim:

$ git clone git@github.com:neovim/neovim.git
$ cd neovim.git
$ make CMAKE_BUILD_TYPE=Release CC=/usr/bin/clang-9 CXX=/usr/bin/clang++-9 CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREIX=\"$HOME/.local\"" install

Change the `CC` and `CXX` variables as needed.

Once neovim is installed, you can run `setup.sh` to *remove* your old neovim directory
and install symlinks from ~/.config/nvim/init.vim to the one in this git
repository. Be careful and check to ensure you don't have any other files
floating around in that directory before running `setup.sh`.
