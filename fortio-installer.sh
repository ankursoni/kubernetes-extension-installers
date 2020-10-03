#!/bin/bash
# $1 - branch name (optional - default = master)

GIT_REPO="https://github.com/ankursoni/kubernetes-extension-fortosi.git"
GIT_BRANCH=$(if [ -z "$1" ]; then echo "master"; else echo "$1"; fi)

if [ ! -d "kubernetes-extension-fortosi" ]
then
    echo "Cloning git - ${GIT_REPO} from branch - ${GIT_BRANCH}"
    git clone $GIT_REPO --branch $GIT_BRANCH
fi

echo "Installing kubernetes extension from ${GIT_REPO}"
sudo cp kubernetes-extension-fortosi/scripts/auto-setup.sh /usr/local/bin/kubectl-fortosi
sudo chmod +x /usr/local/bin/kubectl-fortosi