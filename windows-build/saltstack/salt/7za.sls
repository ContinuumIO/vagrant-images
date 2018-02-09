{% set conda_dir = 'C:\\conda-root\\;C:\\conda-root\\Scripts;C:\\conda-root\\Library\\bin;' %}
{% set conda_dir = conda_dir ~ 'C:\\conda-root\\Library\\usr\\bin;C:\\conda-root\\Library\\mingw-w64\\bin' %}
{% set env_path = salt['environ.get']('PATH') %}
{% set env_path = env_path ~ ';' ~ conda_dir %}

conda-build:
  cmd.run:
    - name: C:\conda-root\Scripts\conda.exe install -yq 7za
    - require:
      - sls: miniconda3
