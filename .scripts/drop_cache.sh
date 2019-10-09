#!/usr/bin/env bash

sync && \
    bash -c "echo 1 | tee sudo /proc/sys/vm/drop_caches"
