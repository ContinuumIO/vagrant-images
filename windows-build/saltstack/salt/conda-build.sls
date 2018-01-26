{% set conda_dir = 'C:\\MC3x64\\;C:\\MC3x64\\Scripts;C:\\MC3x64\\Library\\bin;' %}
{% set conda_dir = conda_dir ~ 'C:\\MC3x64\\Library\\usr\\bin;C:\\MC3x64\\Library\\mingw-w64\\bin' %}
{% set env_path = salt['environ.get']('PATH') %}
{% set env_path = env_path ~ ';' ~ conda_dir %}

conda-build:
  cmd.run:
    - name: 'C:\MC3x64\Scripts\conda.exe install -yq conda-build vs2015_runtime'
    - require:
      - sls: miniconda3
