default: restore-env

restore-env:
  uv sync --all-extras --all-groups --all-packages --frozen && uv run pre-commit install && git pull --recurse-submodules=yes && git submodule foreach 'git checkout main' && git submodule foreach 'uv run pre-commit install'

# Push all submodule and this superproject
push-all:
  git push --recurse-submodules=on-demand

clean:
  uvx cleanpy@0.5.1 .
