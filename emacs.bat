@ECHO OFF
set buffer=%1
if ""%1""=="""" set buffer=new
start %~dp0bin\emacsclient.exe -n -a "%~dp0bin\runemacs.exe" -f "C:\h\Dropbox\.emacs.d\server\server" %buffer%