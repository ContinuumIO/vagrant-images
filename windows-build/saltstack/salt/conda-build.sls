conda-build:
  cmd.run:
    - name: 'C:\Miniconda\Scripts\conda.exe update conda && C:\Miniconda\Scripts\conda.exe install -y conda-build'
    - require:
      - module: miniconda3