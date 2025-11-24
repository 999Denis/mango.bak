#!/bin/sh
killall -9 waybar
killall xdg-desktop-portal
killall xdg-desktop-portal-gtk
#killall xdg-desktop-portal-hyprland
killall gvfsd-trash gvfsd-recent gvfsd-network gvfsd-dnssd gvfsd-wsdd
killall dunst
gsettings set org.gnome.desktop.interface gtk-theme "" 
gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
waybar -c ~/.config/waybar/config.json &
pkill swaync 
swaync &
