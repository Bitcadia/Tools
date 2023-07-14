git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
export PATH=$PATH:~/.asdf/bin
asdf plugin-add zig https://github.com/asdf-community/asdf-zig.git
asdf plugin-add bun https://github.com/cometkim/asdf-bun.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install
