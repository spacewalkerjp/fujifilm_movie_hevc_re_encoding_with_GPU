New-Item out -ItemType Directory
.\ffmpegreencondingNVENC.ps1 (Get-ChildItem *.MOV -File | ForEach-Object { "$($_.Name)" })