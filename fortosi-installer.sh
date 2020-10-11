#!/bin/bash
# $1 - git clone directory (optional - default = kubernetes-extension-fortosi)
# $2 - branch name (optional - default = master)

GIT_REPO="https://github.com/ankursoni/kubernetes-extension-fortosi.git"
GIT_CLONE_PATH=$(if [ -z "$1" ]; then echo "kubernetes-extension-fortosi"; else echo "$1"; fi)
GIT_BRANCH=$(if [ -z "$2" ]; then echo "master"; else echo "$2"; fi)

if [ -z "$(ls -A $GIT_CLONE_PATH)" ]
then
    echo -e "\nCloning git - ${GIT_REPO} from branch - ${GIT_BRANCH} into directory - $GIT_CLONE_PATH"
    git clone $GIT_REPO --branch $GIT_BRANCH $GIT_CLONE_PATH
fi

echo -e "\nInstalling kubernetes extension from ${GIT_REPO}"
sudo cp $GIT_CLONE_PATH/scripts/auto-setup.sh /usr/local/bin/kubectl-fortosi
sudo chmod +x /usr/local/bin/kubectl-fortosi