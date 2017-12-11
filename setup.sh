#!/bin/bash

echo "If this script doesn't work, be sure to run it as sudo"

# read in the contents of the index_addon.js file
# append that to /usr/lib/slack/resources/app.asar.unpacked/src/static/index.js
# echo that it worked

index_path="/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js"

rm $index_path
touch $index_path
cat ./setup/base_index.js >> $index_path
cat ./setup/index_addon.js >> $index_path
