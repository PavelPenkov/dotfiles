#!/bin/sh

git for-each-ref --format='%(refname)' refs/heads/ | sed 's|refs/heads/||' | while read -r line
do
  if [ "$line" != "master" ]; then
    echo "Deleting $line"
    git branch --delete $line
  fi
done
