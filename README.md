# My dotfiles

## Setup

1. Update MacOS to the latest version through system preferences
2. [Generate a new public and private SSH key][ssh-key] by running:

    ```zsh
    ssh-keygen -t ed25519 -C "github@mopolo.net" -f ~/.ssh/id_github
    ```

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone git@github.com:Mopolo/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    ~/.dotfiles/install.sh
    ```

5. Restart your computer to finalize the process

## Inspirations

- https://github.com/freekmurze/dotfiles
- https://github.com/piouPiouM/dotfiles
- https://github.com/driesvints/dotfiles

## Useful links

- https://sharats.me/posts/shell-script-best-practices/

[ssh-key]: https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
