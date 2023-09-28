choco install neovim fzf ripgrep make lazygit fd -y

New-Item -ItemType SymbolicLink -Path $HOME/AppData/Local/nvim -Target $PSScriptRoot/nvim
