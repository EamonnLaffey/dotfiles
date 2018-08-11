#!/bin/sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

#while xsetroot -name "`date` `uptime | sed 's/.*,//'`
#do
#	sleep 1
#done &
#exec dwm

xbindkeys &
compton &
redshift &
exec bspwm
