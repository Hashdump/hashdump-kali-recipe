#!/bin/sh
cd `dirname $0`
command -v convert >/dev/null 2>&1 || { echo >&2 "I require ImageMagick >= 6.7.7 but it's not installed.  Aborting."; exit 1; }
command -v gif2png >/dev/null 2>&1 || { echo >&2 "I require gif2png >=2.5.8 but it's not installed.  Aborting."; exit 1; }
command -v sed >/dev/null 2>&1 || { echo >&2 "I require sed but it's not installed.  Aborting."; exit 1; }
read -p "Please enter your new color in HEX(eg. #ffffff for white) " NEWCOLOR
echo "This may take a while"
find . -type f -exec sed -i 's/#a5e12d/'$NEWCOLOR'/g' {} \;
cd images
for name in `find -wholename "*.gif"`;do gif2png -O "$name" && convert -define png:format=png32 `echo $name|sed 's/gif/png/g'` -fill "$NEWCOLOR" -opaque "#a5e12d" `echo $name|sed 's/gif/png/g'` && convert `echo $name|sed 's/gif/png/g'` "$name" && rm `echo $name|sed 's/gif/png/g'`;done;
echo "done"
