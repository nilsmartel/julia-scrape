#!/bin/bash

# Receive raw html from githubs repos
getPage() {
    curl "https://github.com/search?l=Julia&q=jl&type=Repositories&p=$1"
}

# for the first 50 pages, print all repo names in them
# in form
# /nilsmartel/js        (<- Example )
getAllPages() {
    for i in $(seq 1 50)
    do
        getPage $i | htmlq '.application-main' '.codesearch-results' '.repo-list' '.text-normal' '.v-align-middle' -a href
    done
}

getAllPages
