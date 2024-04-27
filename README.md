# Python Template

This is a template python repository that allows for installation with pyproject.toml, has a cli script set up, and has some Makefile commands for easy project initialization.

## Setup

Use Makefile to set up virtual environment:

`
make virtualenv
`

Then, install the virtual environment with the printed command. Then install the project in development mode:

`
make install
`

## Using

The template is set up to be used as a module, but the cli setup allows for direct calls using:

`
python -m python-template
`

OR

`
python-template
`
