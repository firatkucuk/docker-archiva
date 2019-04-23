#!/bin/sh

if [ ! -d "/archiva-data/conf" ]; then
    mkdir /archiva-data/conf
    mkdir /archiva-data/repositories
    cp /archiva/conf.backup/* /archiva-data/conf
fi

/archiva/bin/archiva console
