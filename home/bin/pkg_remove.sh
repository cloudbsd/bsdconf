#!/usr/local/bin/bash

echo "Delete all packages containing...: \n"
read arg

pkgname=$(pkg info | grep "$arg")

pkg delete $pkgname
