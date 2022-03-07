#!/bin/bash

# author: Stephen Melben Corral

type=$1
name=$2
ext=$3

user=$SUDO_USER

echo $type
function create() {
    if [ $EUID -eq 0 ]; then
        if [ $type == '-f' ]; then
            touch $name.$ext
            chown $user:$user $name.$ext
            chmod u+x $name.$ext
        elif [ $type == '-d' ]; then
            echo "Directory"
            mkdir $name
            chown $user:$user $name
            chmod u+x $name
        else
            echo "Creation Failed."
        fi
    else
        echo "This script must be run as root"
        exit 1
    fi
}

create