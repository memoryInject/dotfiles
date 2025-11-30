# 🚀 My macOS Setup Guide

This guide is for setting up a new Mac from scratch using my dotfiles.

## 1. Initial Git Setup

1.  Clone the bare repository:
    ```bash
    git clone --bare git@github.com:YOUR_USERNAME/dotfiles.git $HOME/.dotfiles
    ```

2.  Add the `config` alias to your Zsh shell:
    ```bash
    echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
    ```

3.  Source the file and set the "hide untracked files" config:
    ```bash
    source ~/.zshrc
    config config --local status.showUntrackedFiles no
    ```

4.  Check out your files into your home directory:
    ```bash
    config checkout
    ```
    *If this fails due to existing files, either delete them or force it with `config checkout -f`.*

## 2. Manual Installations

Some applications need to be installed manually before their configs can be used.

* **Alacritty:**
    1.  Go to [https://alacritty.org/](https://alacritty.org/) and download the `.dmg` for macOS.
    2.  Drag the application to your `/Applications` folder.
    3.  The config file (`alacritty.yml`) will already be in place from the `config checkout` step.

* **Docker:**
    1. Download https://desktop.docker.com/mac/main/arm64/Docker.dmg
    2. Drag the application to your `/Applications` folder.
    3. Run docker

## 2.1 SSH for Github Setup
- Run the following command with email address associated with GitHub account.
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- when prompted:
    - Accept default file locaion
    - skip passphrase

- The command will generate two files in `~/.ssh` directory:
    - `id_ed25519` (your private key - keep this secret)
    - `id_ed25519.pub` (your public key - this is what you share with GitHub)

- Start the SSH Agent and Add Key
The `ssh-agent` manages private keys and securely handles the authentiation.
    - Start the `ssh-agent` in the background:
        ```bash
        eval "$(ssh-agent -s)"
        ```

    - Add your private key to the `ssh-agent` and store the passphrase in your macOS Keychain so you don't have to enter it every time:
        ```bash
        ssh-add --apple-use-keychain ~/.ssh/id_ed25519
        ```

- Add the Public Key to Github Account
    - Copy public key
        ```bash
        pbcopy < ~/.ssh/id_ed25519.pub
        ```

## 3. Homebrew (Managed) Installations

1.  Install Homebrew:
    ```bash
    /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
    ```
    *(Follow any on-screen instructions to add brew to your PATH)*.

2.  Install all applications from the `Brewfile`:
    ```bash
    brew bundle install --file=~/Brewfile
    ```

## 4. install oh-my-zsh
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    
### 4.1. install oh-my-zsh plugins:
     - zsh-autosuggestions 
     ```bash
     git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
     ```
     - zsh-syntax-highlighting 
     ```bash
     git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     ```
     - zsh-fzf-history-search
     ```bash
     git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
     ```

### 4.2 Integrate fzf to zsh
    ```bash
     # Set up fzf key bindings and fuzzy completion
     source <(fzf --zsh)
    ```

## 6. Setup starship theme for oh-my-zsh 
    ```bash
    # Starship is installed from brew just need to config zsh
    eval "$(starship init zsh)"
    ```

## 5. Install dir-bookmark
    ```bash
    git clone https://github.com/memoryInject/dir-bookmark.git ~/.local/share/dir-bookmark
  
    ~/.local/share/dir-bookmark/install.sh
    ```

## 6. Install nvim
    ```bash
    ~/nvim-macos/v0.11.1/
    ```

## 7. Install nvim config
    ```bash
    git clone https://github.com/memoryInject/nvim-config.git ~/.config/nvim
    ```

## 8. Install node with nvm
    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    ```

## 9. Install uv for python setup
    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```
