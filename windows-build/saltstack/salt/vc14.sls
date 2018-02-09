C:\Downloads\BuildTools2015Admin.xml:
  file.managed:
    - name:   C:\Downloads\BuildTools2015Admin.xml
    - source: https://gist.githubusercontent.com/msarahan/2342635a842ce93c9509801177076f8c/raw/0fa94a75794ed7df856098182fc604efd9f73ad7/AdminDeployment.xml
    - source_hash: sha256=e4486732ed703e7f8907e429ae88ac1b18715061ef74e7877fa1a823d3a0f2e3
    - requires:
      - module: download

C:\Downloads\visualcppbuildtools_full.exe:
  file.managed:
    - name:   C:\Downloads\visualcppbuildtools_full.exe
    - source: https://download.microsoft.com/download/5/d/6/5d6a1865-11ff-41f8-8af6-60e92d9bbd0b/visualcppbuildtools_full.exe
    - source_hash: sha256=cd922cfae0c0f7835bb646984c39f8f7598b996e62e3f32ff0cc5c720c088634
    - requires:
      - module: download

vc14:
  cmd.run:
    - name: C:\Downloads\visualcppbuildtools_full.exe /Quiet /NoRestart /AdminFile C:\Downloads\BuildTools2015Admin.xml
    - require:
      - file: C:\Downloads\visualcppbuildtools_full.exe
      - file: C:\Downloads\BuildTools2015Admin.xml
    - creates:
      - C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat
