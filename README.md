# Building and installing neovim
$ git clone git@github.com:neovim/neovim.git
$ cd neovim.git
$ make CMAKE_BUILD_TYPE=Release CC=/usr/bin/clang-9 CXX=/usr/bin/clang++-9 CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREIX=\"$HOME/.local\"" install

Change the `CC` and `CXX` variables as needed.
