#!/bin/sh

filetruck --plan common.yml pickup --from ~
filetruck --plan linux.yml pickup --from ~
filetruck --plan linux_etc.yml pickup --from /etc/