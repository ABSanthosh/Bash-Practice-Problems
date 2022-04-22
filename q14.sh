#!/bin/bash

echo "Number of files: $(ls -p | wc | cut -d ' ' -f 6)"