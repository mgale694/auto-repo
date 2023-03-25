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
    # Make README with repo as title
    echo "# $1" >> README.md

    # Make a .gitignore file with basic configuration
    echo "# Byte-compiled / optimized / DLL files
    __pycache__/
    *.py[cod]

    # Unit test / coverage reports
    htmlcov/
    .tox/
    .nox/
    .coverage
    .coverage.*
    .cache
    nosetests.xml
    coverage.xml
    *.cover
    *.py,cover
    .hypothesis/
    .pytest_cache/
    cover/

    # Jupyter Notebook
    .ipynb_checkpoints

    # IPython
    profile_default/
    ipython_config.py

    # pyenv
    #   For a library or package, you might want to ignore these files since the code is
    #   intended to run in multiple environments; otherwise, check them in:
    .python-version

    # PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
    __pypackages__/

    # Celery stuff
    celerybeat-schedule
    celerybeat.pid

    # Environments
    .env
    .venv
    env/
    venv/
    ENV/
    env.bak/
    venv.bak/

    # mypy
    .mypy_cache/
    .dmypy.json
    dmypy.json

    # Pyre type checker
    .pyre/

    # pytype static type analyzer
    .pytype/

    # Cython debug symbols
    cython_debug/

    # Other
    .DS_Store" >> .gitignore

    git init
    git add --all
    git commit -m "Initial commit"
    git branch -M main
    git remote add origin https://github.com/$GITHUB_USERNAME/$1.git
    git push -u origin main
    code .
}