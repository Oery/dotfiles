#!/bin/sh

# Reload AGS on file changes
find . -type f | entr -r ags run
