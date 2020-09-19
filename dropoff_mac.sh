#!/bin/sh

filetruck --plan common.yml dropoff --to ~
filetruck --plan mac.yml dropoff --to ~

echo 'font_size 13.0' >> ~/.config/kitty/kitty.conf