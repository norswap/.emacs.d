@ECHO OFF

;; Same as em.bat but without the --no-wait option. Should be kept in sync.

set buffer=%1
if [%buffer%]==[] set buffer=new
if not defined HOME set HOME=%APPDATA%
emacsclient.exe ^
    --alternate-editor runemacs.exe ^
    -f %HOME%\.emacs.d\files-%USERDOMAIN%-%USERNAME%\server ^
    %buffer%
