include:
  - 7za

C:\Downloads\GRMSDKX_EN_DVD.iso:
  file.managed:
    - name: C:\Downloads\GRMSDKX_EN_DVD.iso
    - source: https://download.microsoft.com/download/F/1/0/F10113F5-B750-4969-A255-274341AC6BCE/GRMSDKX_EN_DVD.iso
    - source_hash: md5=09ab322d876ae4cf10fdae23249807d3
    - requires:
      - sls: download

vc10-extract:
  cmd.run:
    # - name: C:\conda-root\Library\bin\7za.exe x -y -oC:\Downloads\Win7SDK C:\Downloads\GRMSDKX_EN_DVD.iso
    # The version of 7za that we have a conda package for is really old and doesn't properly extract the iso.
    # I manually installed 7z from a fresh download and it worked fine.
    - name: '"C:\Program Files\7-Zip\7z.exe" x -y -oC:\Downloads\Win7SDK C:\Downloads\GRMSDKX_EN_DVD.iso'
    - creates: C:\Downloads\Win7SDK\setup.exe
    - require:
      - sls: 7za
      - file: C:\Downloads\GRMSDKX_EN_DVD.iso

vc10-install:
  cmd.run:
    - name: C:\Downloads\Win7SDK\setup.exe -q -params:ADDLOCAL=ALL
    - require:
      - cmd: vc10-extract
    - creates:
      - C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat
