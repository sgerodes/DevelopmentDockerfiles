#!/bin/bash

# Combine all .gitignore files, remove comments and blank lines, and sort
#cat .gitignore_os .gitignore_python .gitignore_rust | \
cat custom.gitignore jetbrains.gitignore macos.gitignore node.gitignore python.gitignore rust.gitignore | \
grep -v '^\s*#' | grep -v '^\s*$' | sort -u > .gitignore

echo "Combined and sorted entries from all .gitignore files into .gitignore."
