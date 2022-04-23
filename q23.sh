#!/bin/bash
read -p "Enter a list of files and directories to backup: "  files

zip -r backup.zip $files

