@echo off
git status
git add -A
git commit -m "Syncing .github folder"
git push
cd %~p0
cd %~p0"..\Bearsampp"
xcopy /e /y %~p0".github\*.*" %~p0"..\Bearsampp\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push

cd %~p0"..\startbootstrap-clean-blog"
xcopy /e /y %~p0".github\*.*" %~p0"..\startbootstrap-clean-blog\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\website"
xcopy /e /y %~p0".github\*.*" %~p0"..\website\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-ruby"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-ruby\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\modules-untouched"
xcopy /e /y %~p0".github\*.*" %~p0"..\modules-untouched\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-filezilla"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-filezilla\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-apache"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-apache\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\dev"
xcopy /e /y %~p0".github\*.*" %~p0"..\dev\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-git"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-git\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-xdc"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-xdc\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-php"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-php\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-perl"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-perl\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-mysql"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-mysql\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-ngrok"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-ngrok\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-websvn"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-websvn\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-nodejs"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-nodejs\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-mongodb"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-mongodb\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-gitlist"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-gitlist\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-mariadb"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-mariadb\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-mailhog"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-mailhog\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-composer"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-composer\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-consolez"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-consolez\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-postgresql"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-postgresql\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-phpmyadmin"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-phpmyadmin\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-imagemagick"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-imagemagick\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-ghostscript"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-ghostscript\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\bearsampp.github.io"
xcopy /e /y %~p0".github\*.*" %~p0"..\bearsampp.github.io\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\gitim"
xcopy /e /y %~p0".github\*.*" %~p0"..\gitim\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-nginx"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-nginx\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\prerequisites"
xcopy /e /y %~p0".github\*.*" %~p0"..\prerequisites\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\login-servers-enhanced"
xcopy /e /y %~p0".github\*.*" %~p0"..\login-servers-enhanced\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-python"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-python\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-phpmemadmin"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-phpmemadmin\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-phppgadmin"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-phppgadmin\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-svn"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-svn\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-webgrind"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-webgrind\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-memcached"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-memcached\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\module-yarn"
xcopy /e /y %~p0".github\*.*" %~p0"..\module-yarn\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git push 

cd %~p0"..\aetraymenu"
xcopy /e /y %~p0".github\*.*" %~p0"..\aetraymenu\.github\*.*"
git status
git add -A
git commit -m "Syncing .github folder"
git p%~p*.*\.github\*.*0