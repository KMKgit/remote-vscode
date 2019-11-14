#!/bin/bash
rootdir="$( cd "$(dirname "$0")" ; pwd -P )"

function vscode_usage
{
    echo "========================================================================="
    echo " KMK VSCode"
    echo "-------------------------------------------------------------------------"
    echo " Commands"
    echo " - up"
    echo " - down"
    echo ""
}

function up
{
    echo "docker-compose -f $rootdir/docker/docker-compose.yml up -d"
    docker-compose -f $rootdir/docker/docker-compose.yml up -d
}

function down
{
    echo "docker-compose -f $rootdir/docker/docker-compose.yml down -v"
    docker-compose -f $rootdir/docker/docker-compose.yml down -v
}

function kmk-vscode
{
    case $1 in
        up | down )
            cmd=$1
            shift
            $cmd $@
            ;;
        *)
            vscode_usage
			exit
            ;;
    esac
}

kmk-vscode $@

