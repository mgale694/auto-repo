#!/usr/bin/zsh

function create() {
    source .env
    python $GITHUB_FILEPATH/auto-repo/create.py $1
    cd $GITHUB_FILEPATH$1

    if [ $2 = "-ds" ]
    then
        # Make top level folder structure
        mkdir data docs models notebooks references reports src

        # Make data structure
        mkdir data/external data/interim data/processed data/raw

        # Make models structure
        echo "# $1: Models" >> models/README.md

        # Make notebooks structure
        echo "# $1: Notebooks" >> notebooks/README.md

        # Make reports structure
        mkdir reports/figures

        # Make src structure
        touch __init__.py
        mkdir src/data src/features src/models src/visualisation
        touch src/data/__init__.py src/data/make_dataset.py
        touch src/features/__init__.py src/features/build_features.py
        touch src/models/__init__.py src/models/predict_model.py src/models/train_model.py
        touch src/visualisation/__init__.py src/visualisation/visualise.py

        # Make requirements file
        touch requirements.txt
    fi
    echo "# $1" >> README.md
    git init
    git add --all
    git commit -m "Initial commit"
    git branch -M main
    git remote add origin https://github.com/$GITHUB_USERNAME/$1.git
    git push -u origin main
    code .
}