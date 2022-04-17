# How to set this up?

1. Install `packer.nvim`
2. Clone this repository to `~/.config/nvim`
3. Start nvim and install plugins with `:PackerInstall`
4. Install COC plugins:  
  ```
  :CocInstall coc-html coc-tsserver coc-json coc-css @yaegassy/coc-volar-tools @yaegassy/cock-volar
  ```

## Install Nerd Fonts

To have terminal icons appearing you need one of the patched fonts installed.

  ```
  brew tap caskroom/fonts
  brew list | grep nerd -- List all nerd fonts available via Homebrew Fonts cask

  brew install --cask <ANY_FONT_FROM_THE_OUTPUT>
  ```
