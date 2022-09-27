@echo off

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"



choco install --confirm winrar
choco install --confirm vscode
choco install --confirm docker-desktop
choco install --confirm docker
choco install --confirm dbgate
choco install --confirm googlechrome
choco install --confirm microsoft-teams
choco install --confirm python
choco install --confirm vscode-python
choco install --confirm javaruntime
choco install --confirm jdk11
choco install --confirm jdk8
choco install --confirm putty.install
choco install --confirm winscp.install
choco install --confirm tomcat
choco install --confirm  git
choco install --confirm golang
choco install --confirm goland
choco install --confirm jetbrains-rider
choco install --confirm sql-server-management-studio