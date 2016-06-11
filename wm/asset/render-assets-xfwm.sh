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

INKSCAPE="/usr/bin/inkscape"

SRC_DIR="assets-xfwm"
ASSETS_DIR="../xfwm4"
INDEX="assets-xfwm.txt"

render-non-scale() {
    $INKSCAPE --export-png=$ASSETS_DIR/$i.png $SRC_DIR/$i.svg >/dev/null #\
}

# Generate PNG files
for i in `cat $INDEX`
do 
    if [ -f $ASSETS_DIR/$i.png ] && \
        [ $SRC_DIR/$i.svg -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && \
        [ $SRC_DIR/$i.svg -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        render-non-scale
    fi
done

exit 0
