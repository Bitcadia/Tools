SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
sudo mv /usr/bin/git /usr/bin/git2
sudo ln -sf $SCRIPT_DIR/git /usr/bin/git
