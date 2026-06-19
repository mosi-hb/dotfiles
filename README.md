<img width="100%" alt="Showcase Image" src="https://github.com/user-attachments/assets/4f71106c-e4d4-477d-a451-1d8278c5e290" />

# Mosi's Dotfiles

![](https://img.shields.io/github/last-commit/mosi-hb/dotfiles?&style=for-the-badge&color=79c0ff&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/mosi-hb/dotfiles?style=for-the-badge&logo=andela&color=79c0ff&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/mosi-hb/dotfiles?color=79c0ff&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

## Content
- Sway
- Waybar
- Rofi
- Kitty
- Zsh paired with Oh My Zsh (plus some plugins)
- Neovim
- Other tools I use (k9s, lazygit, etc.)

## Configuration From Scratch
I have made a script to install all of my configuration from scratch onto a system, meaning nothing has been installed on the system yet. 
This will probably still work on a system that isn't a fresh install but i have never tested it. **Script is made for Ubuntu** as it is what i daily drive, so use at your own risk!
```bash
git clone https://github.com/mosi-hb/dotfiles.git
cd dotfiles
./install.sh
```

## Configuration With Stow

I use [GNU Stow](https://www.gnu.org/software/stow/manual/stow.pdf) to manage my dotfiles, which explains the unusual file structure. For a detailed walkthrough, watch this video:

<div align="center">
  <a href="https://www.youtube.com/watch?v=NoFiYOqnC4o" target="_blank">
    <img src="https://img.youtube.com/vi/NoFiYOqnC4o/maxresdefault.jpg" alt="Watch the video on YouTube" width="75%">
  </a>
</div>

### Setup Instructions

1. **Clone the repository** and navigate into it:
   ```bash
   git clone https://github.com/mosi-hb/dotfiles.git
   cd dotfiles
   ```

2. **Install Stow** (if not already installed):
   ```bash
   sudo apt install stow
   ```

3. **Stow your desired configuration**:
   ```bash
   stow <folder-name>
   # Example: stow sway
   ```
   
   **Important**: Ensure the configuration doesn't already exist in `~/.config`. If it does (e.g., Sway already has a folder), make a backup and delete it first.

This creates a symlink between the repository and the target folder in `~/.config`. Any changes you make—whether in the repository or in `~/.config`—are automatically reflected in both places.
