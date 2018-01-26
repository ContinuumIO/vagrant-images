C:\Downloads\VCForPython27.msi:
  file.managed:
    - name: C:\Downloads\VCForPython27.msi
    - source: https://download.microsoft.com/download/7/9/6/796EF2E4-801B-4FC4-AB28-B59FBF6D907B/VCForPython27.msi
    - source_hash: sha256=070474db76a2e625513a5835df4595df9324d820f9cc97eab2a596dcbc2f5cbf
    - requires:
      - module: download

vc9:
  cmd.run:
    - name: C:\Downloads\VCForPython27.msi /qn /norestart
    - require:
      - file: C:\Downloads\VCForPython27.msi