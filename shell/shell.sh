#!/bin/bash

consonants="bcdfghjklmnpqrstvwxz"
vowels="aeiouy"

function gennick
{
    declare output
    declare length=$(( 3 + $RANDOM % 6))
    echo {0 .. $length}
    for i in $(seq 0 $length)
    do
        if [[ $(($RANDOM % 2)) -eq 0 ]]
        then
            output+="${consonants:$(($RANDOM % 19)):1}"
        else
            output+="${vowels:$(($RANDOM % 5)):1}"
        fi
    done

    echo $output
}

function gennicks
{
    for i in $(seq 0 $1)
    do
        gennick
    done
}

gennicks 10
