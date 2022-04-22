# How to set this up?

1. Install `packer.nvim`
2. Clone this repository to `~/.config/nvim`
3. Start nvim and install plugins with `:PackerInstall`
4. Install language servers 
  ```bash
  npm i -g @volar/vue-language-server typescript typescript-language-server vscode-langservers-extracted
  go install golang.org/x/tools/gopls@latest # By default installs to /Users/<username>/go/bin <- add this to your PATH

  export NVIM_LSP_TSSERVER_PATH = "<path/to/tsserverlanguage.js>" 
  ```

## Install Nerd Fonts

To have terminal icons appearing you need one of the patched fonts installed.

  ```
  brew tap caskroom/fonts
  brew list | grep nerd -- List all nerd fonts available via Homebrew Fonts cask

  brew install --cask <ANY_FONT_FROM_THE_OUTPUT>
  ```

## The list of plugins I would like to explore
- [git-messenger.vim](https://github.com/rhysd/git-messenger.vim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [committia.vim](https://github.com/rhysd/committia.vim)
- [octo.nvim](https://github.com/pwntester/octo.nvim)
- [neogen](https://github.com/danymat/neogen)
- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [limelight.vim](https://github.com/junegunn/limelight.vim)
- [goyo.vim](https://github.com/junegunn/goyo.vim)
- [twilight.nvim](https://github.com/folke/twilight.nvim)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
