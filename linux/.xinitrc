#!/bin/sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
setxkbmap -option caps:escape

xbindkeys &
# compton &
redshift &
exec bspwm
