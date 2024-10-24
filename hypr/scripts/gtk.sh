#!/bin/sh
gnome_schema="org.gnome.desktop.interface"
gsettings set "$gnome_schema" icon-theme "Tokyonight-Dark"
gsettings set "$gnome_schema" cursor-theme "Bibata-Modern-Ice"
gsettings set "$gnome_schema" font-name "sans-serif 16"
gsettings set "$gnome_schema" color-scheme "prefer-dark"
