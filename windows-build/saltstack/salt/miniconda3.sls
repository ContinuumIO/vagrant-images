C:\Downloads\Miniconda3-4.1.11-Windows-x86_64.exe:
  file.managed:
    - name: C:\Downloads\Miniconda3-latest-Windows-x86_64.exe
    - source: https://repo.continuum.io/miniconda/Miniconda3-4.1.11-Windows-x86_64.exe
    - source_hash: md5=6c434573474edfc72b1408762b50dde3
    - requires:
      - module: download

miniconda3:
  cmd.run:
    - shell: cmd
    - name: 'start /wait "" C:\Downloads\Miniconda3-4.1.11-Windows-x86_64.exe /S /D=C:\MC3_x64'
    - require:
      - file: C:\Downloads\Miniconda3-4.1.11-Windows-x86_64.exe

update_conda:
  cmd.run:
    - name: 'C:\MC3x64\Scripts\conda.exe update -yq conda'
    - require:
      - miniconda3: cmd.run