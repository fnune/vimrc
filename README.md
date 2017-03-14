# My NVIM configuration file

This is the configuration file I use for NVIM. I use this with the nightly build, currently at `0.2.0-dev`. I use [vim-plug](https://github.com/junegunn/vim-plug) to manage my plugins. The content of my vim configuration is **not meant to be general** and it caters to my specific needs and tastes. Feel free to use it as a starting point and create your own.

## Features

- Rich set of plugins that are useful for any activity and programming language: vim-surround, NERDCommenter, vim-fugitive, vim-repeat, editorconfig-vim, vim-sneak, vim-signify, NERDTree, auto-pairs, vim-multiple-cursors and tabular.
- Syntax and completion for several languages and frameworks: JavaScript, JSX, CSS, Markdown, Ruby, Ruby on Rails, Haskell, Rust and HTML.
- Super fast file search and directory in-file regex matching with FZF and Silver Searcher.
- Autocompletion with YouCompleteMe with an installation script with completion for C-like languages, JavaScript and Rust.
- Asynchronous linting for all available linters with ALE.
- Beautiful theming with vim-airline and the base16 theme.
- My own keybindings and configuration preferences. Read the comments in the configuration file to see what they do.
- GitHub-flavored Markdown preview by pressing Ctrl + M.

## Installation

1. Follow [vim-plug](https://github.com/junegunn/vim-plug) installation instructions to get the plugin manager working. Do not run `:PlugInstall` yet.

2. Check out requirements for [YouCompleteMe](https://github.com/Valloric/YouCompleteMe). This installation will require Node.js, NPM, Rust, and the standard build-essential and cmake packages. Make sure you have those in place.

3. Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) following their installation instructions.

4. For GitHub-flavored Markdown preview, install [grip](https://github.com/joeyespo/grip).

5. Copy the contents of `init.vim` to your `.vimrc` file. I personally use a symlink to keep everything in a `~/.vim` folder.

6. Open NVIM and run `:PlugInstall`. This will install a lot of stuff. Enjoy!


