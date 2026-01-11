# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

### On a Fresh Machine

```bash
curl -fsSL https://raw.githubusercontent.com/gvajda/dotfiles/main/scripts/bootstrap.sh | bash
```

This will:
1. Install Homebrew (if not present)
2. Install chezmoi
3. Clone and apply all dotfiles
4. Install all packages from Brewfile

### On an Existing Machine with Chezmoi

```bash
chezmoi init --apply gvajda
```

## What's Included

### TUI Tools (via Homebrew)

| Tool | Description | Command |
|------|-------------|---------|
| Neovim | Text editor | `nvim` or `v` |
| tmux | Terminal multiplexer | `tmux` or `t` |
| lazygit | Git TUI | `lazygit` or `lg` |
| yazi | File manager | `yazi` or `y` |
| fzf | Fuzzy finder | `fzf` |
| ripgrep | Fast grep | `rg` |
| k9s | Kubernetes TUI | `k9s` or `k` |
| bat | Better cat | `bat` |
| eza | Better ls | `eza` |

### Configurations

- **Neovim**: LazyVim with C#/OmniSharp support
- **tmux**: Session persistence with resurrect + continuum
- **zsh/bash**: Aliases, functions, and integrations

## Usage

### Managing Dotfiles

```bash
# Sync local changes to GitHub
dotfiles sync "commit message"

# Pull latest changes from GitHub
dotfiles pull

# Edit a dotfile (edits source, then applies)
dotfiles edit ~/.tmux.conf

# See what would change
dotfiles diff

# Go to chezmoi source directory
dotfiles cd
```

### tmux

```bash
# Start tmux
tmux

# Attach to existing session
tmux attach -t <session>

# List sessions
tmux list-sessions
```

**Key bindings** (prefix is `Ctrl-b`):
- `prefix + |` - Split vertically
- `prefix + -` - Split horizontally
- `prefix + h/j/k/l` - Navigate panes
- `prefix + r` - Reload config
- `prefix + I` - Install plugins (first time only)
- `prefix + Ctrl-s` - Save session manually
- `prefix + Ctrl-r` - Restore session manually

Sessions auto-save every 15 minutes and auto-restore on tmux start.

### Neovim (LazyVim)

```bash
nvim
```

**Key bindings** (leader is `Space`):
- `<leader>` - Show which-key menu
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>e` - File explorer
- `<leader>gg` - Open lazygit

C# support is pre-configured via OmniSharp.

## Directory Structure

```
~/.local/share/chezmoi/           # Chezmoi source (this repo)
├── .chezmoi.toml.tmpl            # Machine-specific variables
├── .chezmoiignore                # Platform-specific ignores
├── dot_tmux.conf                 # → ~/.tmux.conf
├── dot_zshrc.tmpl                # → ~/.zshrc (Mac)
├── dot_bashrc.tmpl               # → ~/.bashrc (Linux)
├── dot_config/nvim/              # → ~/.config/nvim/
├── Brewfile                      # Homebrew packages
├── run_once_before_*.sh.tmpl     # Auto-runs on apply
└── scripts/
    └── bootstrap.sh              # Fresh machine setup
```

## Platform Support

- **macOS** (Apple Silicon & Intel)
- **Linux** (Ubuntu, Debian, Fedora, Arch)
- **WSL2** (Ubuntu recommended)

The same dotfiles work everywhere - chezmoi templates handle OS differences.

## First Time Setup on Mac

If you're setting this up for the first time (not cloning):

```bash
# Install chezmoi
brew install chezmoi

# Initialize new chezmoi repo
chezmoi init

# Copy your existing configs to chezmoi
chezmoi add ~/.tmux.conf
chezmoi add ~/.zshrc
chezmoi add ~/.config/nvim

# Go to source directory and set up git
chezmoi cd
git init
git add -A
git commit -m "Initial commit"
git remote add origin git@github.com:gvajda/dotfiles.git
git push -u origin main
```

## License

MIT
