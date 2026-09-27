# dotfiles

```bash
git clone https://github.com/mihir262/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

`:CF` loads `vim/templates/cf.cpp` in Vim and Neovim.

Neovim keeps `termguicolors` off and uses Vim's 16-color palette, so it follows the terminal theme. Lualine and git signs use the Rose Pine palette slots.

`<C-p>` or `<space>f` finds files, `<space>s` searches file contents, and `<space>b` finds open buffers. `<space>e` opens netrw in the current window.

Git blame is shown at the end of the current line. `<space>gb` toggles it, `<space>gB` opens the full blame for that line, and `]c` / `[c` move between changes.
