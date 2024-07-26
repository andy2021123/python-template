#!/bin/bash

cd $(dirname $0)

remote_url=$(git config --get remote.origin.url)
repo_name=$(basename -s .git "$remote_url")
project=$(echo "$repo_name" | sed 's/[^a-zA-Z0-9]/_/g')
project_cli="$(echo "$project" | sed 's/_/-/g')"

files=("src/python_template/base.py" "src/python_template/cli.py" "pyproject.toml" "README.md")

for file in "${files[@]}"; do
    sed -i "s/python_template/$project/g" "$file"
    sed -i "s/python-template/$project_cli/g" "$file"
done

mv src/python_template src/$project