# .dotfile 

## Bare repo initial setup
1 - Create the bare repo:
```bash
	git init --bare $HOME/.dotfiles
```

2 - Setup the alias
```bash
	echo "alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

3 - Activate the Alias & Set Config: Run these two commands to activate the alias in your current session and tell it to ignore all the other files in your home directory.
```bash
	source ~/.zshrc
	gitdot config --local status.showUntrackedFiles no
```


## Usage
1.  Clone the bare repository:
    ```bash
    git clone --bare https://github.com/memoryInject/dotfiles.git $HOME/.dotfiles
    ```

2. Setup the alias
```bash
	echo "alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

3.  Source the file and set the "hide untracked files" config:
    ```bash
    source ~/.zshrc
    gitdot config --local status.showUntrackedFiles no
    ```

4.  Check out your files into your home directory:
    ```bash
    gitdot checkout
    ```
    *If this fails due to existing files, either delete them or force it with `gitdot checkout -f`.*

5.  Run the main script:
    ```bash
    make run
    ```
