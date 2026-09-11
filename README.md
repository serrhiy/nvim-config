# Neovim Setup

This is the Neovim config I use every day at work and at university.

## Building Neovim

I prefer building software myself, since I don't like installing things into the global/system
space. Most users will prefer installing Neovim via their system package manager (`apt`, `dnf`,
etc.) instead - feel free to skip this section entirely if that's you.

1. Install the packages required to build Neovim:
   ```sh
   apt install curl cmake ninja-build git build-essential
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

## Installing the C++ toolchain

To enable syntax highlighting, code suggestions and so on, a language server is needed.
To enable other useful features, like code formatting and linting, more tools are needed.
You can pick any compiler, but since all these tools come from the LLVM world, I'll use clang:
```sh
apt install cmake ninja-build clang clangd clang-tidy clang-format lldb
```