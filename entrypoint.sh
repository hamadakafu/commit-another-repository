#!/bin/sh

set -ex

apk update
apk --no-cache add git

echo "$*"

git config --global user.name $INPUT_USERNAME
git config --global user.email $INPUT_EMAIL
git clone https://$INPUT_ACCESS_TOKEN@github.com/$INPUT_REPOSITORY

dirname=$(echo -n $INPUT_REPOSITORY | awk -F/ '{print $2}')
cd $dirname 

git remote set-url --push origin https://$INPUT_USERNAME:$INPUT_ACCESS_TOKEN@github.com/$INPUT_REPOSITORY

if [ -n "$INPUT_REFS" ]; then
    git checkout $INPUT_REFS
else
    git checkout master
fi


sh -c "$INPUT_COMMAND"

git add .
git commit -m "$INPUT_COMMIT_MESSAGE"
git push
