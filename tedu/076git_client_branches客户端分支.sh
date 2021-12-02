#!/bin/bash

#一般分支的命名
#MASTER,核心发布
#DEVELOP,最新开发的大版本
#RELEASE 新发布的小功能
#HOTFIX 修改BUG
#FEATURE 开发的新功能
#GitHub上默认叫main

cd ~/project/
git status
#查看当前分支

git branch -v
#所有分支

git branch hotfix
#创建hotfix分支

git branch develop
#创建develop分支

git branch -v
#查看当前分支

##############################################################################切换分支
git checkout hotfix
#切换到hotfix分支

git add --all
#暂存所有

git commit -m "hotfix new files"
#提交变更到本地

git checkout master
#切换到master版本

git merge hotfix
#先切换到主版本
#把hotfix合并到master版本

git push
#推送到服务器

