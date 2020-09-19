#!/bin/sh

filetruck --plan common.yml dropoff --to ~
filetruck --plan linux.yml dropoff --to ~
sudo filetruck --plan linux_etc.yml dropoff --to /etc/

echo 'font_size 11.0' >> ~/.config/kitty/kitty.conf