choco install neovim fzf ripgrep make lazygit fd -y
irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -RunAsAdmin  "$HOME\.scoop"
scoop install zig 
New-Item -ItemType SymbolicLink -Path $HOME/AppData/Local/nvim -Target $PSScriptRoot/nvim
