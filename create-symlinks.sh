#!/bin/bash

# -- Start --
# Go through the directory POOLE_PATH and identify if each item is a directory or file
# POOLE_PATH=./poole/*

# for item in ${POOLE_PATH}
# do
# 	if [[ -d ${item} ]]; then
# 		FOLDER_PATH=./poole/${item}
# 		echo "Folder: ${FOLDER_PATH}"
# 	elif [[ -f ${item} ]]; then
# 		FILE_PATH=./poole/${item}
# 		echo "File: ${item} "
# 	fi
# done
# -- End --

# We don't want to create symlinks from posts since we will create our own posts
# If you want to iterate over more directories, add them to this variable in space separated manner
DIRECTORIES_TO_ITERATE_OVER="_layouts _includes _sass assets"

for directory in ${DIRECTORIES_TO_ITERATE_OVER}
do
#	echo "Listing contents of ./poole/${item}"
#	ls ./poole/${item}
    echo "Creating symlinks for ./poole/${directory} in ${directory}, each file name will follow"

    # iterate over all the files in ./poole/${item} and if its a file, create a symlink for it in ${directory} (the
    # folder in parent directory)
    FILES_IN_DIR=./poole/${directory}/*

    for file in ${FILES_IN_DIR}
    do
        # If the object that we are iterating over is a file
    	if [[ -f ${file} ]]; then
    	    # Create symlink for that object (file)
            ln -s ${file} ./${directory}/
    	    echo "Symlink created for ${file} in ./${directory}/"
    		echo "Browsing contents of ./${directory}"
    		ls -al ./${directory}
        fi
    done

done
