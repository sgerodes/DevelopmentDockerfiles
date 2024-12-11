#!/bin/bash

# Combine all .gitignore files, remove comments and blank lines, and sort
#cat .gitignore_os .gitignore_python .gitignore_rust | \
cat .combined.gitignore | \
grep -v '^\s*#' | grep -v '^\s*$' | sort -u > .gitignore

echo "Combined and sorted entries from all .gitignore files into .gitignore."