#! /bin/bash
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

SRC_DIR="assets-metacity"
ASSETS_DIR="../metacity-1"
INDEX="assets-metacity.txt"

# Clone stock SVG files
for i in `cat $INDEX`
do
    if [ -f $ASSETS_DIR/$i.svg ] && \
        [ $SRC_DIR/$i.svg -ot $ASSETS_DIR/$i.svg ]; then
        echo $ASSETS_DIR/$i.svg exists.
    elif [ -f $ASSETS_DIR/$i.svg ] && \
        [ $SRC_DIR/$i.svg -nt $ASSETS_DIR/$i.svg ]; then
        echo Re-cloning $ASSETS_DIR/$i.svg
        cp $SRC_DIR/$i.svg $ASSETS_DIR/
    else
        echo Cloning $ASSETS_DIR/$i.svg
        cp $SRC_DIR/$i.svg $ASSETS_DIR/
    fi
done

exit 0
