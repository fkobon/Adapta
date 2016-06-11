#! /bin/bash
#
# Yeah this script is pretty bad and ugly, so?
#

INKSCAPE="/usr/bin/inkscape"

SRC_FILE="assets-gtk2.svg"
ASSETS_DIR="assets-gtk2"
ASSETS_CLONE_DIR="assets-clone"
INDEX="assets-gtk2.txt"
INDEX_CLONE="assets-clone-gtk2.txt"

render-non-scale() {
    ID=`echo $i | tr '/' '_'`
    $INKSCAPE --export-id=$ID \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE > /dev/null #\
}

# Generate PNG files
for i in `cat $INDEX`
do
    SUB_DIR=`echo $i | cut -f1 -d '/'`
    if [ '!' -d $ASSETS_DIR/$SUB_DIR ]; then
        mkdir  $ASSETS_DIR/$SUB_DIR; 
    fi

    if [ -f  $ASSETS_DIR/$i.png ] && [ $SRC_FILE -ot  $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f  $ASSETS_DIR/$i.png ] && [ $SRC_FILE -nt  $ASSETS_DIR/$i.png ]; then
        echo Re-rendering  $ASSETS_DIR/$i.png
        rm -f  $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering  $ASSETS_DIR/$i.png
        render-non-scale
    fi
done

# Clone stock SVG files
for i in `cat $INDEX_CLONE`
do
    case $i in
    "null" )
        if [ -f $ASSETS_DIR/Others/$i.svg ]; then
            echo $ASSETS_DIR/Others/$i.svg exists.
        else
            echo Cloning $i.svg into $ASSETS_DIR/Others
            cp $ASSETS_CLONE_DIR/$i.svg $ASSETS_DIR/Others
        fi
        ;;
    "z-depth"* )
        if [ -f $ASSETS_DIR/Shadows/$i.svg ]; then
            echo $ASSETS_DIR/Shadows/$i.svg exists.
        else
            echo Cloning $i.svg into $ASSETS_DIR/Shadows
            cp $ASSETS_CLONE_DIR/$i.svg $ASSETS_DIR/Shadows
        fi
        ;;
    esac    
done

exit 0
