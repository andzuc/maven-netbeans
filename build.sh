#!/bin/bash

rm screenlog.0
screen -L sh -c "tar -C context -cf - .|docker build --progress=plain -t andzuc/alpine-netbeans -"
