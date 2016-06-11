#! /bin/bash

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
