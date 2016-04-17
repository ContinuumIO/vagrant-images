vc10:
  cmd.run:
    - name: 'C:\ProgramData\chocolatey\bin\cinst -y windows-sdk-7.1'
    - require:
      - module: chocolatey