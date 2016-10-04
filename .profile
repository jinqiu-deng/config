# Use colors, but only if connected to a terminal, and that terminal
# supports them.
printf "Running .profile\n"

if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi

if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e

CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
    exit 1
fi
unset CHECK_ZSH_INSTALLED

# Check if git is installed
hash git >/dev/null 2>&1 || {
    echo "${YELLOW}Error: git is not installed${NORMAL}"
    exit 1
}

# Install oh-my-zsh
ZSH=$HOME/.oh-my-zsh
if [ ! -d "$ZSH" ]; then
    printf "${BLUE}Installing oh-my-zsh...${NORMAL}\n"

    env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
    printf "${YELLOW}Error: git clone of oh-my-zsh repo failed.${NORMAL}\n"
    exit 1
    }
fi

# Download .vimrc
if [ ! -e "$HOME/.vimrc" ]; then
    printf "Download .vimrc\n"
    curl "https://raw.githubusercontent.com/DengJinqiu/config/master/.vimrc" -o ~/.vimrc
fi

# Download .zshrc
if [ ! -e "$HOME/.zshrc" ]; then
    printf "Download .zshrc\n"
    curl "https://raw.githubusercontent.com/DengJinqiu/config/master/.zshrc" -o ~/.zshrc
fi

# Download vundle
if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ]; then
    printf "Download vundle\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

# Download .tmux.conf
if [ ! -e "$HOME/.tmux.conf" ]; then
    printf "Download tmux.conf"
    curl "https://raw.githubusercontent.com/DengJinqiu/config/master/.tmux.conf" -o ~/.tmux.conf
fi

# Download .gitconfig
if [ ! -e "$HOME/.gitconfig" ]; then
    printf "Download .gitconfig"
    curl "https://raw.githubusercontent.com/DengJinqiu/config/master/.gitconfig" -o ~/.gitconfig
fi

printf "End .profile\n"

# Invoke zsh
export SHELL=/bin/zsh
[ -z "$ZSH_VERSION" ] && exec /bin/zsh -l
