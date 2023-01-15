# WordPress Codespace Dev Environment

This is a starter kit for a development environment for WordPress in a GitGub [Codepsace](https://github.com/features/codespaces).
Start developing for WordPress right after a single click.

## Usage
Create your own codespace by clicking this button. Please allow 5 minutes for auto-configuration at first setup. 

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope)

Try the example plugin in _plugins/wp-codespace_, make some changes and appreciate the advantages of a pre-configured codespace.

## Behind the scenes
After the codespace is up and running, the _postCreateCommand_ will be executed, including:
- install node and php dependencies
- install WordPress with credentials admin/admin
- install and activate selected plugins
- provide [WP CLI](https://wp-cli.org/)
- add [playwright test](https://playwright.dev/) environment
- configure in VS Code:
  - WP Coding Standards
  - Autocompletion for WordPress functions
  - searchable WordPress-Docs
  - for more details, see _.devcontainer/.devcontainer.json_

## About Codepsaces
GitHub Codespaces are your dev environment in the cloud. Start coding instantly on your WordPress theme or plugin. A codespace is an IDE in the browser with pre-configured XDebug, WordPress Coding Standards and a pre-installed WordPress with your personal plugin or theme, that you are developing.

Set up your personal codespace on this repo (or on your private fork) with just one click. Codespace installs WordPress automatically, pre-configures XDebug, enables playwright tests, installs the WordPress Coding Standards and configures the VS Code extension for PHP_CodeSniffer and many other WordPress extensions. Start coding your theme or plugin without any further ado.

A codespace is a convenient way to contribute to an Open Source project, as you find all prerequisites preconfigured. You do not have to install any software, a codespace runs in the browser, as well as in your local VS Code or PhpStorm.

Just type, test and refactor your WordPress code. No need for DevOps.

Give it a try and [create your personal codespace on main](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope) right now.
