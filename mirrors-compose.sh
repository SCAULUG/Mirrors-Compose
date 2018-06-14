#!/bin/bash

# Mirrors-Compose.sh, version 1


function usage {
    echo "Usage: $0 [install|rebulid|uninstall]"
}

function install {
    git clone --depth 1 https://github.com/SCAULUG/Mirrors-Sync.git
    git clone --depth 1 https://github.com/SCAULUG/Mirrors-Nginx.git
    docker-compose build --no-cache
    docker-compose up -d
}

function uninstall {
    docker-compose stop
    docker-compose rm -f
    rm -rf Mirrors-Sync Mirrors-Nginx
}

function rebuild {
    uninstall
    install
}

if [[ $# -ne 1 ]]
then
    usage
    exit 1
fi

case "$1" in
    install)
        install;;
    uninstall)
        uninstall;;
    rebuild)
        rebuild;;
esac
