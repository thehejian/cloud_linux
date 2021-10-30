#!/bin/bash

#MASTER,daima hexin
#DEVELOP,zuixin kaifa chenguo
#RELEASE wei kaifa xin chanpin
#HOTFIX xiufu BUG
#FEATURE kaifa xin gongneng

git status
#dangqian fenzhi

git branch -v
#suoyou fenzhi

git branch hotfix

git branch develop

git branch -v

git checkout hotfix
#qiehuan dao hotfix fenzhi
mkdir -p test

git commit -m "hotfix new files"

git checkout master

git merge hotfix
#ba hotfix hebing dao master
#xuyao xian qiehuan dao master

git push
#shangchuan dao fuwuqi
#shangmian de suoyou caozuo dou shi zai bendi client shang wancheng

