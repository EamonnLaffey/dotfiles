source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

update() {
    sudo reflector --country Australia --latest 10 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
    yay
}