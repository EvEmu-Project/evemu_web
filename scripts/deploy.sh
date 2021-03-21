#!/bin/bash
echo "Generating static pages using hugo..."
hugo -D
echo "Syncing files to server..."
ssh evemuupload@evemu.dev rm -rf /web/*
rsync -r public/ evemuupload@evemu.dev:/web/
