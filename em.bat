@ECHO OFF

set buffer=%1
if [%buffer%]==[] set buffer=new
if not defined HOME set HOME=%APPDATA%
emacsclient.exe --no-wait ^
    --alternate-editor runemacs.exe ^
    -f %HOME%\.emacs.d\files-%USERDOMAIN%-%USERNAME%\server ^
    %buffer%
