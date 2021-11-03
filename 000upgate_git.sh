#!/bin/bash

git pull origin main

mydate=date +'%Y%m%d %H:%M:%S'

git commit -m "$mydate"

git add --all

git push origin main

ls
