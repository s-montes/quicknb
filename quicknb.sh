#!/bin/bash
#################
# Quick Jupyter notebook viewer
# It will open a temporary HTML file in default browser
# USAGE:
# quicknb "filename.ipynb"

# Notebook filename
NOTEBOOK=$1

# Change extension of the file
# The sed command is used to avoid problems with spaces in filename
FILENAME="$(echo "$NOTEBOOK" | sed 's/\(.*\.\)ipynb/\1html/')"

# Launches the Jupyter script
jupyter nbconvert --to html "$NOTEBOOK"

# Open in default browser
#firefox --new-tab "./$FILENAME" &
# xdg-open is preferred, in case no Firefox
xdg-open "./$FILENAME" &

# Wait for the file to load before deleting it
sleep 10s

rm "$FILENAME"
