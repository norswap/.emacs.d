@ECHO OFF
set buffer=%1
if ""%1""=="""" set buffer=new
start %~dp0bin\emacsclient.exe --no-wait ^
    --alternate-editor "%~dp0bin\runemacs.exe" ^
    -f "C:\h\Dropbox\.emacs.d\files-%USERDOMAIN%-%USERNAME%\server" %buffer%