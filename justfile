default: restore-env

restore-env:
  uv sync --all-extras --all-groups --frozen && uv run pre-commit install && just restore-env-core && just restore-env-cli && just restore-env-docs && just restore-env-telegram-bot

[working-directory: 'packages/core']
restore-env-core:
  uv run pre-commit install

[working-directory: 'packages/cli']
restore-env-cli:
  uv run pre-commit install

[working-directory: 'packages/docs']
restore-env-docs:
  uv run pre-commit install

[working-directory: 'packages/telegram-bot']
restore-env-telegram-bot:
  uv run pre-commit install

clean:
  uvx cleanpy@0.5.1 .
