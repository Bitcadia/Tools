#!/bin/bash
echo "Checking if asdf exists"

ASDF_DIR="$HOME/.asdf"
TOOLS_VERSIONS_FILE="$HOME/.tool-versions"
ASDF_VERSION="v0.11.3"

# Check if `asdf` is already installed
if [ -d "$ASDF_DIR" ]; then
	echo "asdf is already installed in $ASDF_DIR."
else
	# Clone asdf repository
	git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch "$ASDF_VERSION"
	echo '. "$HOME/.asdf/asdf.sh"' >>~/.bashrc
	echo '. "$HOME/.asdf/completions/asdf.bash"' >>~/.bashrc
	source ~/.bashrc
	echo "asdf cloned successfully in $ASDF_DIR."
fi

# Install asdf plughins
asdf plugin add bun https://github.com/cometkim/asdf-bun.git
asdf plugin add make https://github.com/yacchi/asdf-make.git
asdf plugin add neovim https://github.com/richin13/asdf-neovim.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ripgrep https://gitlab.com/wt0f/asdf-ripgrep.git
asdf plugin add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin add zig https://github.com/asdf-community/asdf-zig.git

# Create symbolic link for .tool-versions file
ln -sf "$(pwd)/.tool-versions" "$TOOLS_VERSIONS_FILE"
echo ".tool-versions file linked to $TOOLS_VERSIONS_FILE."

# Install versions in asdf global scope
cd ~/
asdf install
asdf global make 4.4.1
asdf global neovim stable
asdf global nodejs 20.2.0
asdf global ripgrep 13.0.0
popd
cp cc ~/.asdf/shims
asdf install tmux 3.3
asdf global tmux 3.3
