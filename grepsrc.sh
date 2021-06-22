#!/usr/bin/env bash
set -o nounset
set -o errexit

main() {

    if [ $# -lt 2 ]; then
        grep -h
        return
    fi

    declare -A name_map=(
        [grepgd]=gd
        [grephp]=php
        [grepy]=py
    )
    filename=$(basename $0)

    pattern=""
    target=""
    flags=""
    args=($@)
    for (( i=$#-1; i>=0; i-- )); do
        if [ -z $target ]; then
            target=${args[i]}
        elif [ -z $pattern ]; then
            pattern=${args[i]}
        else
            flags="$flags ${args[i]}"
        fi
    done

    if [ ${name_map[$filename]} ]; then
        find "$target" -name "*\.${name_map[$filename]}" -print0 | xargs -0 grep $flags $pattern
    else
        grep -Ir $flags $pattern $target
    fi
}

main $@
