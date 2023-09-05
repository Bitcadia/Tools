#!/bin/bash
echo "Checking if asdf exists"

#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
ASDF_DIR="$HOME/.asdf"
USR_DIR="/usr/bin"
ASDF_VERSION="v0.12.0"
BASHRC_FILE="$HOME/.bashrc"

# Check if `asdf` is already installed
if [ -d "$ASDF_DIR" ]; then
	echo "asdf is already installed in $ASDF_DIR."
else
	# Clone asdf repository
	git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch "$ASDF_VERSION"
	echo "asdf cloned successfully in $ASDF_DIR."
fi

START_MARKER="# DEF from install-tools.sh"
END_MARKER="# ENDEF from install-tools.sh"
# Check if the markers already exist in .bashrc
if grep -Fxq "$START_MARKER" "$BASHRC_FILE" && grep -Fxq "$END_MARKER" "$BASHRC_FILE"; then
	# Remove lines between the markers
	sed -i.bak "/$START_MARKER/,/$END_MARKER/d" "$BASHRC_FILE"
	echo "Lines between '$START_MARKER' and '$END_MARKER' have been removed from .bashrc."
else
	echo "Could not find the start and end markers in .bashrc. No changes made."
fi

echo '' >>$BASHRC_FILE
echo '# DEF from install-tools.sh' >>$BASHRC_FILE
echo '# DO NOT ADD ANYTHIHNG INSIDE DEF AND ENDEF, IT WILL BE OVERWRITTEN' >>$BASHRC_FILE
echo "# neovim" >>$BASHRC_FILE
echo "alias vim='nvim'" >>$BASHRC_FILE
echo '# asdf' >>$BASHRC_FILE
echo ". \"$ASDF_DIR/asdf.sh\"" >>$BASHRC_FILE
echo ". \"$ASDF_DIR/completions/asdf.bash\"" >>$BASHRC_FILE
Check if XDG_CONFIG_HOME is already set
if [[ -n "$XDG_CONFIG_HOME" ]]; then
	echo "XDG_CONFIG_HOME is already set to: $XDG_CONFIG_HOME"
else
	# Add XDG_CONFIG_HOME to .bashrc
	echo "export XDG_CONFIG_HOME=\"$CONFIG_DIR\"" >>"$BASHRC_FILE"
	echo "Added XDG_CONFIG_HOME to .bashrc: $CONFIG_DIR"
fi
mkdir -p $CONFIG_DIR
echo '' >>$BASHRC_FILE
source $BASHRC_FILE
echo '# tmux' >>$BASHRC_FILE
echo "tmux source $CONFIG_DIR/tmux/tmux.config" >>$BASHRC_FILE
echo '# ENDEF from install-tools.sh' >>$BASHRC_FILE
echo ".bashrc updated"

# Install asdf plughins
asdf plugin add bun https://github.com/cometkim/asdf-bun.git
asdf plugin add make https://github.com/yacchi/asdf-make.git
asdf plugin add neovim https://github.com/richin13/asdf-neovim.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ripgrep https://gitlab.com/wt0f/asdf-ripgrep.git
asdf plugin add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin add zig https://github.com/asdf-community/asdf-zig.git
asdf plugin add jq https://github.com/AZMCode/asdf-jq.git
asdf plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit.git

if ! command -v unzip &>/dev/null; then
	sudo apt-get update && sudo apt-get install -y unzip
fi

rm $ASDF_DIR/shims/gcc
sudo ln -sf $SCRIPT_DIR/gcc $USR_DIR/gcc
sudo ln -sf $SCRIPT_DIR/cc $USR_DIR/cc
sudo ln -sf $SCRIPT_DIR/ld $USR_DIR/shims/ld
while read -r line; do
	# Install versions in asdf global scope
	plugin=$(echo "$line" | awk '{print $1}')
	version=$(echo "$line" | awk '{print $2}')
	(
		asdf install "$plugin" "$version"
		asdf global "$plugin" "$version"
	)
	echo "Installed $plugin version $version in asdf global scope."
done <"$SCRIPT_DIR/.tool-versions"

ln -sf $SCRIPT_DIR/ld $ASDF_DIR/shims/ld
ln -sf $SCRIPT_DIR/gcc $ASDF_DIR/shims/gcc
ln -s "$SCRIPT_DIR/tmux" "$CONFIG_DIR/tmux"
ln -s "$SCRIPT_DIR/nvim" "$CONFIG_DIR/nvim"

echo "Linked nvim and tmux configs"

source $BASHRC_FILE
