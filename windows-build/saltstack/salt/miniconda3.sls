{% set miniconda_fn = 'Miniconda3-4.3.21-Windows-x86_64.exe' %}

C:\Downloads\{{ miniconda_fn }}:
  file.managed:
    - name: C:\Downloads\{{ miniconda_fn }}
    - source: https://repo.continuum.io/miniconda/{{ miniconda_fn }}
    - source_hash: md5=29000c7082bad516c5c5b92c180b6793
    - requires:
      - module: download

miniconda3:
  cmd.run:
    - shell: cmd
    - name: start /wait "" C:\Downloads\{{ miniconda_fn }} /InstallationType=JustMe /RegisterPython=0 /AddToPath=0 /S /D=c:\conda-root
    - require:
      - file: C:\Downloads\{{ miniconda_fn }}
    - creates:
      - c:\conda-root\conda-meta\history

update_conda:
  cmd.run:
    - name: c:\conda-root\Scripts\conda.exe update -yq conda
    - require:
      - cmd: miniconda3
