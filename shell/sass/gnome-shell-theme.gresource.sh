#!/bin/sh

glib-compile-resources --sourcedir="../gnome-shell" \
	../gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-nokto" \
	../gnome-shell-nokto/gnome-shell-theme.gresource.xml
