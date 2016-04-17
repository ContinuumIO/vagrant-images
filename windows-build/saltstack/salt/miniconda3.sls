{% set conda_dir = 'C:\\Miniconda\\;C:\\Miniconda\\Scripts;C:\\Miniconda\\Library\\bin' %}
{% set env_path = salt['environ.get']('PATH') %}
{% set env_path = env_path ~ ';' ~ conda_dir %}

miniconda3:
  cmd.run:
    - name: 'C:\ProgramData\chocolatey\bin\cinst -y miniconda3'
    - require:
      - module: chocolatey