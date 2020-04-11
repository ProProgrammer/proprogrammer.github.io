#!/bin/bash

# What we need to achieve:
## Copy files from ./poole/ submodule into the directories below as called out in variable 'DIRECTORIES_TO_ITERATE_OVER'

# If you want to iterate over more directories, add them to this variable in space separated manner
OBJECTS_TO_SYNC="_layouts _includes _sass assets _config.yml 404.html Gemfile about.md archive.md atom.xml index.html
 README.md styles.scss"

for object in ${OBJECTS_TO_SYNC}
do
#	echo "Listing contents of ./poole/${item}"
#	ls ./poole/${item}
    echo "Syncing ./poole/${object} to ${object}"
    rsync --archive --verbose --compress --update ./poole/${object} ./


    # iterate over all the files in ./poole/${item} and if its a file, create a symlink for it in ${directory} (the
    # folder in parent directory)
#     FILES_IN_DIR=./poole/${directory}/*

#     for file in ${FILES_IN_DIR}
#     do
#         # If the object that we are iterating over is a file
#     	if [[ -f ${file} ]]; then
#     	    # Create symlink for that object (file)
#
#     	    # cp -nvU - description: https://unix.stackexchange.com/a/294969/314497
#     	    # Using rsync instead of cp because cp command on Mac is not updated to include -u option
#             rsync --archive --verbose --compress --update --dry-run ${file} ./${directory}/
#     	    echo "A copy of File: ${file} created in ./${directory}/"
#     		echo "Browsing contents of ./${directory}"
#     		ls -al ./${directory}
#         fi
#     done

done
