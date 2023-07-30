#!/bin/sh
# unspla.sh - Set your i3 background image to a random unsplash image
# Created by Collin McKinley (collinm.xyz)


# Settings
RUN_AS_DAEMON=1                           # Run unspla.sh as a daemon if 1, if 0 unspla.sh will set the image then exit
BACKGROUND_RES="1920x1080"                # Set the size of unsplash images to pull
PARAMETERS="backgrounds"                  # Set any other parametes to pull in images. add a comma between parameters ( nature, backgrounds)
BACKGROUND_COMMAND="feh --bg-fill "       # The command that will be used to set the background, default is feh.  Image will be supplied after the command.
IMAGE_SAVE_DIR="photo.jpg"  # Directory to save the images to

#Do not change unless you need to
UNSPLASH_URL="https://source.unsplash.com/random?night&size=1920x1080"

# Daemon Settings (only modify if you are using unspla.sh as a daemon)
UPDATE_INTERVAL=21600                     # How long to wait before changing the picture (seconds)


mkdir -p /tmp/unsplash

if [ $RUN_AS_DAEMON = 1 ]
then
  printf "Launching into background"
  while :
  do
    echo "Getting the image .-."
    wget $UNSPLASH_URL -O $IMAGE_SAVE_DIR
    $BACKGROUND_COMMAND $IMAGE_SAVE_DIR
    sleep $UPDATE_INTERVAL
  done &
else
    echo "Getting the image .-. in else"
    wget  $UNSPLASH_URL -O $IMAGE_SAVE_DIR
    $BACKGROUND_COMMAND $IMAGE_SAVE_DIR
    echo "Done the image Set .-. in else"
fi
