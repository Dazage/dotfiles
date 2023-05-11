# About
These are my personal dotfiles. Use them at your own risk!

# Deployment
I rely on [GNU Stow](https://www.gnu.org/software/stow/) and [ansible](https://github.com/ansible/ansible) for deployment, the script will automatically ensure GNU Stow is installed and attempt to use ansible.

Failing ansible detection the script will guess which package manager to use and act accordingly, though yours may not be supported.

```
git clone https://github.com/Dazage/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```