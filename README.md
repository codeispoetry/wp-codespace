# WordPress in a Codespace

This is a sample configuration for a development environment for WordPress in a GitGub [Codepsace](https://github.com/features/codespaces).
Start developing for WordPress right after a single click.

## Usage
Just create your own codespace by clicking this button. Please allow 5 minutes at first setup. 

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope)

## Behind the scenes
After the codespace is up and running, the _postCreateCommand_ will be executed, including:
- installing node and php dependencies
- installig WordPress with credentials admin/admin
- installig and activating pre-defined plugins from the task _wp_configure_ in the _Makefile_
- providing [WP CLI](https://wp-cli.org/)
- configure in VS Code:
  - WP Coding Standards
  - Autocompletion for WordPress functions
  - searchable WordPress-Docs
  - for more details, see _.devcontainer/.devcontainer.json_

## About Codepsaces
GitHub Codespaces are your dev environment in the cloud. Start coding instantly on your WordPress theme or plugin. A codespace is an IDE in the browser with pre-configured XDebug, WordPress Coding Standards and a pre-installed WordPress with your personal plugin or theme, that you are developing.

Set up your personal codespace on this repo (or on your private fork) with just one click. Codespace installs WordPress automatically, keeps track of the docker containers for the database and phpMyAdmin, pre-configures XDebug for you, installs the WordPress Coding Standards and configures the VS Code extension for PHP_CodeSniffer and many other WordPress extensions more. You can start coding your theme or plugin without any further ado.

A codespace is a convenient way to contribute to an Open Source project, as you find all prerequisites preconfigured. You do not have to install any software, a codespace runs in the browser, as well as in your local VS Code or PhpStorm.

Just type, test and refactor your WordPress code. No need for DevOps.

Giv it a try and [create your personal codespace on main right now]((https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope)).
