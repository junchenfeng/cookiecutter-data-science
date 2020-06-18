#!/usr/bin/env bash

# create a git pre commit hook
# source file
source_file="ci/pre-commit"
echo $source_file

# target file
target_dir=".git/hooks"
mkdir -p $target_dir

mv $source_file $target_dir
chmod u+x "$target_dir/pre-commit"
