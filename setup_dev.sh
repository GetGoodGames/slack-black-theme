#!/bin/bash

echo "If this script doesn't work, be sure to run it as sudo"

# read in the contents of the index_addon.js file
# append that to /usr/lib/slack/resources/app.asar.unpacked/src/static/index.js
# echo that it worked

index_path="/usr/lib/slack/resources/app.asar.unpacked/src/static/index.js"

rm $index_path
touch $index_path
cat ./setup/base_index.js >> $index_path
cat ./setup/dev_index_addon.js >> $index_path

echo "In order to develop, you need to host the custom.css file at localhost:9080"
echo "You also need to set the SLACK_DEVELOPER_MENU=true environment flag to true"
echo "Finally, be sure to update the localCssPath variable to have the correct path"
