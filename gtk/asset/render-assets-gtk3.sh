#! /bin/bash

INKSCAPE="/usr/bin/inkscape"

SRC_FILE="assets-gtk3.svg"
ASSETS_DIR="assets-gtk3"
ASSETS_CLONE_DIR="assets-clone"
INDEX="assets-gtk3.txt"
INDEX_CLONE="assets-clone-gtk3.txt"

render-non-scale() {
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null #\
}

render-scale() {
    $INKSCAPE --export-id=$i \
              --export-dpi=180 \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null #\
}

# Generate PNG files
for i in `cat $INDEX`
do 
    if [ -f $ASSETS_DIR/$i.png ] && [ $SRC_FILE -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && [ $SRC_FILE -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        render-non-scale
    fi

    if [ -f $ASSETS_DIR/$i@2.png ] && [ $SRC_FILE -ot $ASSETS_DIR/$i@2.png ]; then
        echo $ASSETS_DIR/$i@2.png exists.
    elif [ -f $ASSETS_DIR/$i@2.png ] && [ $SRC_FILE -nt $ASSETS_DIR/$i@2.png ]; then
        echo Re-rendering $ASSETS_DIR/$i@2.png
        rm -f $ASSETS_DIR/$i@2.png
        render-scale
    else
        echo Rendering $ASSETS_DIR/$i@2.png
        render-scale
    fi
done

# Clone stock SVG files
for i in `cat $INDEX_CLONE`
do
    if [ -f $ASSETS_DIR/$i.svg ]; then
        echo $ASSETS_DIR/$i.svg exists.
    else
        echo Cloning $i.svg into $ASSETS_DIR
        cp $ASSETS_CLONE_DIR/$i.svg $ASSETS_DIR/
    fi
done

exit 0
