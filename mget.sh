#!/bin/bash
## cli for https://github.com/hunshcn/gh-proxy
## author: Wszl
## date: 2024-08-30

_mget() {
    set -e
    mirror_url=$GITHUB_MIRROR
    if [ -z $mirror_url ]; then
        echo "please setup GIHHUB_MIRROR in your env."
    fi
    mirror_of_prefixs=( "https://github.com" "https://raw.githubusercontent.com" "https://gist.githubusercontent.com" )
    new_param_ary=()
    for param in $@; do
        if [[ $param =~ ^-.* ]]; then
            new_param_ary+=( $param )
        fi
        for url_prefix in "${mirror_of_prefixs[@]}"; do
            if [[ $param =~ ^"$url_prefix".*  ]]; then
                new_param_ary+=( "$mirror_url$param" )
                break
            fi
        done
    done
    wget "${new_param_ary[@]}"
}
alias ${MPGET_CMD:-wget}=_mget
