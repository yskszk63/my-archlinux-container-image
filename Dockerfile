FROM archlinux

RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm git neovim zsh chezmoi && \
    mkdir -p ~/.local/bin && \
    curl -L 'https://github.com/yskszk63/renvim/releases/download/v0.0.1/renvim_0.0.1_Linux_x86_64.tar.gz'|tar zxf - -C ~/.local/bin renvim && \
    chezmoi init --apply https://github.com/yskszk63/dotfiles.git && \
    pacman -Scc --noconfirm

CMD ["/usr/bin/zsh", "--login"]
