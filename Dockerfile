FROM archlinux

RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm git neovim zsh && \
    mkdir -p ~/.local/bin && \
    curl -L 'https://github.com/yskszk63/renvim/releases/download/v0.0.1/renvim_0.0.1_Linux_x86_64.tar.gz'|tar zxf - -C ~/.local/bin renvim && \
    git clone https://github.com/yskszk63/dotfiles ~/.dotfiles && \
    ~/.dotfiles/setup && \
    pacman -Scc --noconfirm && \
    zsh -c '. ~/.zshrc'

CMD ["/usr/bin/zsh", "--login"]
