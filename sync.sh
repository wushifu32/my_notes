#!/bin/bash

git add .
git commit -m "sync from $(uname -ns) at $(date)"
git pull --rebase
git push
