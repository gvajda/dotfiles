#!/bin/bash
# =============================================================================
# Bootstrap Script for Fresh Machines
# =============================================================================
# Usage: curl -fsSL https://raw.githubusercontent.com/gvajda/dotfiles/main/scripts/bootstrap.sh | bash
#
# This script:
# 1. Installs essential build tools
# 2. Installs Homebrew
# 3. Installs chezmoi
# 4. Initializes dotfiles from GitHub
# 5. Applies all configurations

set -e

GITHUB_USERNAME="gvajda"
DOTFILES_REPO="https://github.com/${GITHUB_USERNAME}/dotfiles.git"

echo "=============================================="
echo "  Dotfiles Bootstrap Script"
echo "  Repository: ${DOTFILES_REPO}"
echo "=============================================="
echo ""

# -----------------------------------------------------------------------------
# Detect OS
# -----------------------------------------------------------------------------

OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
fi

echo "Detected OS: $OS"
echo ""

# -----------------------------------------------------------------------------
# Install Prerequisites (Linux only)
# -----------------------------------------------------------------------------

if [[ "$OS" == "linux" ]]; then
    echo "Installing build prerequisites..."

    if command -v apt-get &> /dev/null; then
        # Debian/Ubuntu
        sudo apt-get update
        sudo apt-get install -y build-essential curl file git procps
    elif command -v dnf &> /dev/null; then
        # Fedora/RHEL
        sudo dnf groupinstall -y 'Development Tools'
        sudo dnf install -y curl file git procps-ng
    elif command -v yum &> /dev/null; then
        # Older RHEL/CentOS
        sudo yum groupinstall -y 'Development Tools'
        sudo yum install -y curl file git procps
    elif command -v pacman &> /dev/null; then
        # Arch
        sudo pacman -Sy --noconfirm base-devel curl file git procps-ng
    else
        echo "Warning: Could not detect package manager. Please install build tools manually."
    fi

    echo "Prerequisites installed."
    echo ""
fi

# -----------------------------------------------------------------------------
# Install Homebrew
# -----------------------------------------------------------------------------

if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH for this session
    if [[ "$OS" == "macos" ]]; then
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        elif [[ -d "$HOME/.linuxbrew" ]]; then
            eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
        fi
    fi

    echo "Homebrew installed."
else
    echo "Homebrew already installed."
fi
echo ""

# -----------------------------------------------------------------------------
# Install Chezmoi
# -----------------------------------------------------------------------------

if ! command -v chezmoi &> /dev/null; then
    echo "Installing chezmoi..."
    brew install chezmoi
    echo "Chezmoi installed."
else
    echo "Chezmoi already installed."
fi
echo ""

# -----------------------------------------------------------------------------
# Initialize Dotfiles
# -----------------------------------------------------------------------------

echo "Initializing dotfiles from GitHub..."
echo "Repository: ${DOTFILES_REPO}"
echo ""

# Initialize and apply dotfiles
# The --apply flag automatically runs chezmoi apply after init
chezmoi init --apply "${GITHUB_USERNAME}"

echo ""
echo "=============================================="
echo "  Bootstrap Complete!"
echo "=============================================="
echo ""
echo "Next steps:"
echo "  1. Start a new shell or run: source ~/.bashrc (or ~/.zshrc)"
echo "  2. Start tmux: tmux"
echo "  3. Install tmux plugins: Press prefix + I (Ctrl-b then Shift-i)"
echo "  4. Open neovim: nvim (plugins will auto-install on first launch)"
echo ""
echo "Useful commands:"
echo "  dotfiles sync    - Push local changes to GitHub"
echo "  dotfiles pull    - Pull changes from GitHub"
echo "  dotfiles status  - Check git status of dotfiles"
echo ""
