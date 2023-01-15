# WordPress Codespace Dev Environment

This is a starter kit for a development environment for WordPress in a GitGub [Codepsace](https://github.com/features/codespaces).
Start developing for WordPress right after a single click.

## Usage
Create your own codespace by clicking this button. Please allow 5 minutes for auto-configuration at first setup. 

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope)

## Playing around
Try the example plugin in _plugins/wp-codespace_, make some changes and appreciate the advantages of a pre-configured codespace.

### Code linting
Edit the file _wordpress/wp-content/plugins/wp-codespace/wp-codespace.php_:
- Delete a whitespace between parentheses and curly brackets and see the code linting in action. 
- Use a right click to format the file according to [WordPress Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/).

### WordPress autocompletion and inline documentation
Edit the file _wordpress/wp-content/plugins/wp-codespace/wp-codespace.php_:
- type somewhere _"add_" and see the autocompletion suggestions specially for WordPress.
- hover over _add_action_ and see the documentation for that WordPress method

### WP CLI
Open the terminal (make sure, you are in the subfolder _wordpress_) and try the [WP CLI](https://wp-cli.org/).
- `wp plugin list`
- `wp user list`

### Playwright Tests
Open the terminal and switch to the directory _wordpress/wp-content/plugins/wp-codespace_.
- run `npm test` for an example [playwright test](https://playwright.dev/).
See the test specification in the subfolder _tests_.

### SASS/CSS Compiling
Open the terminal and switch to the directory _wordpress/wp-content/plugins/wp-codespace_.
- change the color in the file _build/sass/styles.scss_
- run `npm run compile:css` to compile _styles.css_

## Behind the scenes
This setup will install and configure the following things automatically:
- install WordPress with credentials admin/admin
- install and activate selected plugins
- populate demo data from the [WordPress Theme Unit Test](https://codex.wordpress.org/Theme_Unit_Test)
- install [WP CLI](https://wp-cli.org/)
- install node (npm) and php (composer) dependencies
- add [playwright test](https://playwright.dev/) environment
- configure VS Code:
  - WordPress Coding Standards
  - autocompletion for WordPress functions
  - searchable WordPress-Docs
 
 For more details, see _.devcontainer.json_, _Dockerfile_ and _postCreateCommand.sh_, all of which you will find in the _.devcontainer_-folder.

## About Codepsaces
GitHub Codespaces are your dev environment in the cloud. Start coding instantly on your WordPress theme or plugin. A codespace is an IDE in the browser with pre-configured XDebug, WordPress Coding Standards and a pre-installed WordPress with your personal plugin or theme, that you are developing.

Set up your personal codespace on this repo (or on your private fork) with just one click. Codespace installs WordPress automatically, pre-configures XDebug, enables playwright tests, installs the WordPress Coding Standards and configures the VS Code extension for PHP_CodeSniffer and many other WordPress extensions. Start coding your theme or plugin without any further ado.

A codespace is a convenient way to contribute to an Open Source project, as you find all prerequisites preconfigured. You do not have to install any software, a codespace runs in the browser, as well as in your local VS Code or PhpStorm.

Just type, test and refactor your WordPress code. No need for DevOps.

Give it a try and [create your personal codespace on main](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope) right now.
