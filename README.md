# Neovim Setup

This is the Neovim config I use every day at work and at university.

## Building Neovim

I prefer building software myself, since I don't like installing things into the global/system
space. Most users will prefer installing Neovim via their system package manager (`apt`, `dnf`,
etc.) instead - feel free to skip this section entirely if that's you.

1. Install the packages required to build Neovim:
   ```sh
   apt install cmake ninja-build git build-essential
   ```
2. Download the source code:
   ```sh
   git clone https://github.com/neovim/neovim.git && cd neovim
   ```
3. Build and install it:
   ```sh
   make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=~/.local
   make install
   ```
