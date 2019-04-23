#!/bin/sh

if [ ! -d "/archiva-data/conf" || ! -d  "/archiva-data/repositories" || ! -d "/archiva-data/data" || ! -d "/archiva-data/logs" ]; then
    mkdir /archiva-data/conf
    mkdir /archiva-data/repositories
    mkdir /archiva-data/data
    mkdir /archiva-data/logs
    cp /archiva/conf.backup/* /archiva-data/conf
fi

/archiva/bin/archiva console
