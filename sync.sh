#!/bin/bash

git add .
git commit -m "$(date)"
git pull --rebase
git push
