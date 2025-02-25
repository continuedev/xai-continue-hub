# xAI on hub.continue.dev

You will find more information in the [Continue 1.0 Partnership Guide](https://continuedev.notion.site/Continue-1-0-Partnership-Guide-1811d55165f7802686fcd0b70464e778).

# Setting up Continue at xAI

To use Continue at xAI, you can set up Continue on your local machine.

- VSCode: Install [VSCode Extension](https://marketplace.visualstudio.com/items?itemName=Continue.continue) and click on "Switch to Pre-Release Version" after installation.
- JetBrains: Install [JetBrains Plugin](https://plugins.jetbrains.com/plugin/22707-continue)

First, copy the config yaml file you want to use to:
- On Mac/Linux: `~/.continue/config.yaml`
- On Windows: `%USERPROFILE%\.continue\config.yaml`

Replace `apiKey` with the API key you get on https://console.x.ai, be sure you are on a team with the right model access permissions.

# Developing

To develop, first run:
```
make create-venv
```

Then activate the Python virtual environment, install dependencies and setup pre-commit hook:
```
source ./venv/bin/activate
make install-deps
```

When you develop, use `make lint` to check the yaml formatting, and `make format` to fix formatting. Under the hood, it is using `yamllint` and `yamlfix` to enforce these rules. The configuration files are `.yamlint` and `.yamlfix.toml` respectively.