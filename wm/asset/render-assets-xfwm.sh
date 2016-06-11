#! /bin/bash

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
