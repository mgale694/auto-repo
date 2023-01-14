# Atumatic GitHub Repository

This project is designed to allow the user to automate the creation of their GitHub repositories
via running a shell command.

## Install
```zsh
git clone "https://github.com/mgale694/auto-repo.git"
```
```zsh
cd auto-repo
```
```zsh
pip install -r requirements.txt
```

## Setup

```zsh
touch .env
```

Open the .env file and store your username, password, and file destination in the following format:

```zsh
USERNAME="Username123"
PASSWORD="Password123"
FILEPATH="/path/to/your/project/"
```

Add the following to your `.zshrc` in order to source commands whenever you terminal starts up.

```zsh
source ~/{path to repository}/.my_commands.sh
```

Alternatively you can run the above command everytime you open a new terminal.

## Usage

To run the script you need to type the following into your terminal:

```zsh
create {name of your repository}
```