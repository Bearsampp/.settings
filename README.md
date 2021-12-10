# .settings

These are the settings that should be included in every repo & editor.
This is eqv to https://docs.joomla.org/Joomla_CodeSniffer

** How to clone all repos in the organization at once.

1. first download and install [Git-cli](https://cli.github.com/)
2. install _**"Git-cli"**_
3. reboot
4. open console where you want the repo's to be.  For me it was **_"E:\Development\MY_PROJECTS\bearsampp-development"_**
5. type `gh extension install matt-bartel/gh-clone-org`
6. after thats installed type `gh clone-org -y Bearsampp`

Thats all there is too it.  [Full instructions here](https://github.com/matt-bartel/gh-clone-org)

** How to sync .github folder for all repos

* install [gh cli](https://github.com/cli/cli/releases/download/v2.3.0/gh_2.3.0_windows_amd64.msi)
* open terminal in this repo
* run ```gh repo list > raw-list.txt```
* using notepad++ ( or eqv ) search for "tab" ( \t ) and delete everything from it to end of line. save as "list.txt"
* Add new repos to github-sync.bat using ```xcopy /E /Y /EXCLUDE:exclude.txt .github\*.* ..\Bearsampp\${NEW_REPO_NAME}```  Replace "${NEW_REPO_NAME}" with the name of the missing repo
* 
