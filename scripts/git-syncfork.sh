#!/bin/bash
MAINBRANCH=main

git checkout main || export MAINBRANCH=master && git checkout master

git fetch upstream && git merge upstream/$MAINBRANCH && git push origin $MAINBRANCH
