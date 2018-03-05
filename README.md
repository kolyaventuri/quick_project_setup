# Quick Project Setup

Modular script for simple and easy project generation. Easy to expand upon if more things are needed.

Currently implemented setup modules are for JavaScript on Node.JS and Ruby (with SimpleCov).

Hound.yml files are set up for both.

## Installation

*TODO*

## Usage

Use by running the `setup.sh` script with the name of the module to use. Ex: `setup.sh javascript`

By default it uses the current directory, but a second argument overrides that. Ex: `setup.sh javascript /var/foo`

## Adding new modules

New modules can be defined by creating a new `modules/[name]/setup.sh` file with all relevant bash instructions.

Any aliases for the module should be defined in the `modules/[name]/.alias` file. Ex, add _jscript_ to the `modules/javascript/.alias` file to make `setup.sh jscript` an alias for `setup.sh javascript`

Default .gitingore files should be placed at `modules/[name]/.gitignore.template`
