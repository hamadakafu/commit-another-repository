#!/bin/sh

set -ex

apk --no-cache add git
env

echo "$*"

# git clone https://<token>@github.com/owner/repo.git
# git clone https://github.com/hamadakafu/argocd-sample.git
# cd argocd-sample
# git remote set-url --push origin https://hamadakafu:${{ secrets.SAMPLE_GITHUB_TOKEN }}@github.com/hamadakafu/argocd-sample
# ls -lat
# git log --oneline
# sudo snap install yq
# yq --version
# yq w --inplace charts/sample-helm-chart/values.yaml 'image.tag' 1.6
# git config --global user.name "hamadakafu"
# git commit -am "change image tag"
# git push
# 
