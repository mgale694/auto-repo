import sys
import os
from github import Github
from dotenv import load_dotenv

load_dotenv()

path = os.getenv("FILEPATH")
github_token = os.getenv("GITHUB_TOKEN")

def create():
    folderName = str(sys.argv[1])
    os.makedirs(path + str(folderName))
    user = Github(github_token).get_user()
    repo = user.create_repo(folderName)
    print(f"Succesfully created repository {folderName}")

if __name__ == "__main__":
    create()