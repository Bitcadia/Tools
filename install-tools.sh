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
cp cc ~/.asdf/shims

# Install versions in asdf global scope
while read -r line; do
	plugin=$(echo "$line" | awk '{print $1}')
	version=$(echo "$line" | awk '{print $2}')
	(
		asdf install "$plugin" "$version"
		asdf global "$plugin" "$version"
	)
	echo "Installed $plugin version $version in asdf global scope."
done <"$TOOLS_VERSIONS_FILE"
