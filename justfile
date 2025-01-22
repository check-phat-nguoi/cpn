default: restore-env

restore-env:
  uv sync --all-extras --all-groups --all-packages --frozen && uv run pre-commit install && git pull --recurse-submodules=yes && git submodule foreach --recursive 'git checkout main' && git submodule foreach --recursive 'uv run pre-commit install'

# Push all submodule
push-all:
  git submodule foreach --recursive 'git push'

# Pull all submodules' branches with {{remote}}='origin' and this superproject
pull-all remote='orgin':
  git submodule foreach --recursive 'git pull {{remote}}'

clean:
  uvx cleanpy@0.5.1 .
