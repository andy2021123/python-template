#!/bin/bash

cd $(dirname $0)

remote_url=$(git config --get remote.origin.url)
repo_name=$(basename -s .git "$remote_url")
project=$(echo "$repo_name" | sed 's/[^a-zA-Z0-9]/-/g')

files=("src/python-template/base.py" "src/python-template/cli.py" "README.md")

for file in "${files[@]}"; do
    sed -i "s/python-template/$project/g" "$file"
done

cat <<EOF > pyproject.toml
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name = "$project"
version = "0.0.1"
authors = [
  { name="$(git config --get user.name)", email="$(git config --get user.email)" },
]
description = "python template repository"
readme = "README.md"
requires-python = ">=3.8"
classifiers = [
  "Programming Language :: Python :: 3",
  "License :: UNLICENSED",
  "Operating System :: OS Independent",
]

dependencies = []

[project.optional-dependencies]
dev = [
  "pytest",
  "devpi-client"
]

[project.scripts]
$project = "$project.cli:main"
EOF

mv src/python-template src/$project