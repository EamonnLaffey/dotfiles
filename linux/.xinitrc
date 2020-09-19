#!/bin/sh

userresources=$HOME/.Xresources
userprofile=$HOME/.xprofile
sysresources=/etc/X11/xinit/.Xresources

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$userprofile" ]; then
    . "$userresources"
fi

setxkbmap -option caps:escape

xbindkeys &
# compton &
# redshift &
exec bspwm
