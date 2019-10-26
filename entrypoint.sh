#!/bin/sh

set -ex

apk update
apk --no-cache add git

echo "$*"

git config --global user.name $INPUT_USERNAME
git clone https://$INPUT_ACCESS_TOKEN@github.com/$INPUT_REPOSITORY

dirname=$(echo -n $INPUT_REPOSITORY | awk -F/ '{print $2}')
cd $dirname 

if [ -n "$INPUT_REFS" ]; then
    git checkout $INPUT_REFS
else
    git checkout master
fi

git remote set-url --push origin https://$INPUT_USERNAME:$INPUT_ACCESS_TOKEN@github.com/$INPUT_REPOSITORY

sh -c "$INPUT_COMMAND"

git commit -am "$INPUT_COMMIT_MESSAGE"
git push
