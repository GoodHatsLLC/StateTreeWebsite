#!/usr/bin/env bash

REF="${1:-main}"
git submodule update --init
git submodule foreach "git fetch origin && git checkout ${REF}"
