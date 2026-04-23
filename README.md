# Dotfiles

### Configuration With Stow

1. Clone the repo and change directory to it.
2. Ensure Stow is installed.
```
sudo apt install stow
```
3. Once installed, run the following command to copy the configuration of your choosing <br>
(Ensure that the configuration doesn't exist already, a.k.a if i3 is already has a configuration folder in .config, rename it or delete it)
```bash
stow <folder name>

Example:

stow i3
```
This creates a symlink between this repository and the copied i3 folder in .config, meaning that any changes you make in the configuration
both in .config or in the repository are reflected on eachother.
