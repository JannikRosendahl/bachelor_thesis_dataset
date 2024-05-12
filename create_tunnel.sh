#!/bin/bash

if [[ $(ssh -fN -L 5432:localhost:5432 vmrosendahl) -eq 0 ]]; then
    echo "SSH tunnel successfully established."
else
    echo "Failed to establish SSH tunnel."
    exit 1
fi