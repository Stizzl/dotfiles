#!/usr/bin/env bash

sync && \
    sudo bash -c 'echo 1 > /proc/sys/vm/drop_caches'
