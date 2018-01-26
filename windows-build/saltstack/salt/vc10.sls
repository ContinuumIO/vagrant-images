C:\Downloads\GRMSDKX_EN_DVD.iso:
  file.managed:
    - name: C:\Downloads\GRMSDKX_EN_DVD.iso
    - source: http://download.microsoft.com/download/F/1/0/F10113F5-B750-4969-A255-274341AC6BCE/GRMSDKX_EN_DVD.iso
    - source_hash: sha256=9f495e52f33d68125277cbca3565ce57904af7d506758a14691fa6e2479ad65c
    - requires:
      - sls: download

vc10-extract:
  cmd.run:
    - name: '7za x -o C:\Downloads\Win7SDK -y C:\Downloads\GRMSDKX_EN_DVD.iso'
    - creates: C:\Downloads\Win7SDK
    - require:
      - sls: 7za
      - file: C:\Downloads\GRMSDKX_EN_DVD.iso

vc10-install:
  cmd.run:
    - name: 'C:\Downloads\Win7SDK\setup.exe -q -params:ADDLOCAL=ALL'
    - require:
      - file: C:\Downloads\Win7SDK