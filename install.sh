#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask password beforehand
sudo -v

# Hide "last login" line when starting a new terminal session
touch "$HOME"/.hushlogin

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME"/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf "$HOME"/.zshrc
ln -s "$HOME"/.dotfiles/shell/.zshrc "$HOME"/.zshrc

# Removes .zprofile from $HOME (if it exists) and symlinks the .zprofile file from the .dotfiles
rm -rf "$HOME"/.zprofile
ln -s "$HOME"/.dotfiles/shell/.zprofile "$HOME"/.zprofile

# Symlink starship prefs
rm "$HOME"/.config/starship.toml
ln -s "$HOME"/.dotfiles/shell/.starship.toml "$HOME"/.config/starship.toml

# Symlink git config file
rm "$HOME"/.gitconfig
ln -s "$HOME"/.dotfiles/git/dot-gitconfig "$HOME"/.gitconfig

# Copy base SSH git file
cp "$HOME"/.dotfiles/ssh/config "$HOME"/.ssh/config

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file "$HOME"/.dotfiles/Brewfile

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Setup PHP
bash "$HOME"/.dotfiles/install/php.sh

# Setup Go
bash "$HOME"/.dotfiles/install/go.sh

# Setup Java
jenv enable-plugin export
jenv enable-plugin maven
#sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# Install nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# Setup Minecraft
ln -s "$HOME"/.dotfiles/minecraft/ferium/config.json "$HOME"/.config/ferium/config.json
ferium complete zsh > "$HOME"/.dotfiles/shell/autocomplete/_ferium

# Clone projects
bash "$HOME"/.dotfiles/install/clone.sh

# Set OSX defaults
bash "$HOME"/.dotfiles/install/set-defaults.sh

# Manual steps
echo -e
echo "Installation done!"
echo -e
echo "Some manual steps remaining:"
echo -e
echo "### Java ###"
echo "Tutorial: https://blog.bigoodyssey.com/how-to-manage-multiple-java-version-in-macos-e5421345f6d0"
echo -e
echo "Run: /usr/libexec/java_home -V"
echo "Run: jenv add /path/to/jdk"
echo "Run: jenv versions"
echo "Choose a default version with: jenv global {version}"
echo -e
echo "## Mac App Store apps ##"
echo " - https://welovelights.app"
echo -e
