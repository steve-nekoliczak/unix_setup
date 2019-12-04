#!/bin/bash

source_dir="$HOME/.unix_setup/config_files"
dest_dir="$HOME"

copied_files=()
ignored_files=()

overwrite="false"
reverse_copy="false"

copy_file() {
    local source_filepath=${1}
    local dest_filepath=${2}
    if $reverse_copy = "true"; then
        # Reverse arguments to copy files back
        cp $dest_filepath $source_filepath
    else
        cp $source_filepath $dest_filepath
    fi
    copied_files+=($source_filepath)
}

copy_dir() {
    local source_filepath=${1}
    local dest_filepath=${2}
    local filename=${3}

    local is_copy_file="false"

    # found directory, drill down
    if test -d $source_filepath; then
        mkdir -p $dest_filepath
        for filepath in "$source_filepath/"* ; do
            filename=$(basename $filepath)
            sub_dest_filepath="$dest_filepath/$filename"

            copy_dir $filepath $sub_dest_filepath $filename
        done

    # dest file exists
    elif test -f $dest_filepath; then
        if $overwrite = "true"; then
            copy_file $source_filepath $dest_filepath
        else
            ignored_files+=($source_filepath)
        fi

    # dest file doesn't exist
    else
        copy_file $source_filepath $dest_filepath
    fi
}

pretty_filename() {
    local filepath=${1}
    echo "${filepath:${#source_dir}}"
}

main() {
    # display hidden files
    shopt -s dotglob

    copy_dir $source_dir $dest_dir ""

    echo
    echo "files that were copied:"
    for file in "${copied_files[@]}"; do
        pretty_filename "$file"
    done

    echo
    echo "files that were ignored:"
    for file in "${ignored_files[@]}"; do
        pretty_filename "$file"
    done

    git config --global core.excludesfile ~/.gitignore
}

for arg in "$@"; do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]; then
        echo "Copies files from $source_dir to $dest_dir"
        echo "Flags:"
        echo "--help / -h"
        echo "    Display help menu"
        echo "--overwrite / -o"
        echo "    Overwrite config all files currently in $dest_dir"
        echo "--copyback / -c"
        echo "    Copy all config files from $dest_dir back to $source_dir"
        exit 0
    elif [ "$arg" == "--overwrite" ] || [ "$arg" == "-o" ]; then
        overwrite="true"
    elif [ "$arg" == "--copyback" ] || [ "$arg" == "-c" ]; then
        # overwriting is fine for copyback since all files are in git repo
        overwrite="true"
        reverse_copy="true"
    fi
done

main
