# WordPress in a Codespace

This is a sample configuration for a development environment for WordPress in a GitGub [Codepsace](https://github.com/features/codespaces).
Start developing for WordPress right after a single click.

## Usage
Just create your own codespace by clicking this button. Please allow 5 minutes for initial setup.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=586814971&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestEurope)

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
