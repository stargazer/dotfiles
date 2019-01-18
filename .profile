# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Disable middle touchpad button
TOUCHPAD_ID="$(xinput list | grep Touchpad | awk -F 'id=' '{ print $2 }' | awk '{ print $1 }')"
xinput set-button-map $TOUCHPAD_ID 1 0 3

# If no external monitor is detected, scale text to 1.22X
if [ $(xrandr --listmonitors | grep Monitors| awk '{print $2}') -eq "1" ]; then
    dconf write /org/gnome/desktop/interface/text-scaling-factor 1.22
else
    dconf write /org/gnome/desktop/interface/text-scaling-factor 1
fi