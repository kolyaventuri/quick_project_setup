# Quick Project Setup

Modular script for simple and easy project generation. Easy to expand upon if more things are needed.

Currently implemented setup modules are for JavaScript on Node.JS and Ruby (with SimpleCov).

Hound.yml files are set up for both.

## Installation

Install Quick Project Setup with curl

`curl -o- https://raw.githubusercontent.com/kolyaventuri/quick_project_setup/master/install.sh | bash`

or wget

`wget -qO- https://raw.githubusercontent.com/kolyaventuri/quick_project_setup/master/install.sh | bash`

The install script clones the project to the ~/.quick_setup directory. You will need to add the following line to your bash profile (ex,. .bashrc, .bash_profile, or equivalent) for the script to load on terminal load. This process may be automated in a later release.

`PATH=$PATH:~/.quick_setup/`

## Usage

Use by running the `setup.sh` script with the name of the module to use. Ex: `setup.sh javascript`

By default it uses the current directory, but a second argument overrides that. Ex: `setup.sh javascript /var/foo`

## Adding new modules

New modules can be defined by creating a new `modules/[name]/setup.sh` file with all relevant bash instructions.

Any aliases for the module should be defined in the `modules/[name]/.alias` file. Ex, add _jscript_ to the `modules/javascript/.alias` file to make `setup.sh jscript` an alias for `setup.sh javascript`

Default .gitingore files should be placed at `modules/[name]/.gitignore.template`
