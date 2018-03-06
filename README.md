# Quick Project Setup

Modular script for simple and easy project generation. Easy to expand upon if more things are needed.

Currently implemented setup modules are for JavaScript on Node.JS and Ruby (with SimpleCov).

Hound.yml files are set up for both.

## Installation

Install Quick Project Setup with curl

`curl -o- https://raw.githubusercontent.com/kolyaventuri/quick_project_setup/master/install.sh | bash`

or wget

`wget -qO- https://raw.githubusercontent.com/kolyaventuri/quick_project_setup/master/install.sh | bash`

The install script clones the project to the ~/.quick_setup directory. In addition, it loads the script in your bash profile (ex,. .bashrc, .bash_profile, or equivalent). Henceforth, your terminal will need to be reloaded for the changes to take effect or use the command given on install to load immediately into the current terminal window.

## Usage

Use by running the `setup` command with the name of the module to use. Ex: `setup javascript`

By default it uses the current directory, but a second argument overrides that. Ex: `setup javascript /var/foo`

## Adding new modules

New modules can be defined by creating a new `$QUICK_SETUP_DIR/modules/[name]/setup.sh` file with all relevant bash instructions.

Any aliases for the module should be defined in the `$QUICK_SETUP_DIR/modules/[name]/.alias` file. Ex, add _jscript_ to the `$QUICK_SETUP_DIR/modules/javascript/.alias` file to make `setup jscript` an alias for `setup javascript`

Default .gitingore files should be placed at `$QUICK_SETUP_DIR/modules/[name]/.gitignore.template`
