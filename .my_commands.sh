#!/usr/bin/zsh

function create() {
    source .env
    python $GITHUB_FILEPATH/auto-repo/create.py $1
    cd $GITHUB_FILEPATH$1
    echo "# $1" >> README.md
    git init
    git add README.md
    git commit -m "Initial commit"
    git branch -M main
    git remote add origin https://github.com/$GITHUB_USERNAME/$1.git
    git push -u origin main
    code .
}