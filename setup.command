#!/bin/bash

echo "If this script doesn't work, be sure to run it as sudo"

index_path_prefix=""
index_path=""

if [ -d "/Applications/Slack\ 3.app/Contents" ]; then
   index_path_prefix="/Applications/Slack\ 3.app/Contents"
   index_path="$index_path_prefix/Resources/app.asar.unpacked/src/static/ssb-interop.js"
else
   index_path_prefix="/Applications/Slack.app/Contents"
   index_path="$index_path_prefix/Resources/app.asar.unpacked/src/static/index.js"
fi


rm $index_path
touch $index_path

cat ./setup/base_index.js >> $index_path
cat ./setup/index_addon.js >> $index_path
