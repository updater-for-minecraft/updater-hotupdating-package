@echo off

python version.py > temp.txt
set /p filename=< temp.txt
del temp.txt

echo Build for %filename%

pyinstaller --noconfirm --version-file version-file.txt --add-data="icon.ico;." -i icon.ico -w -n %filename% main.py %1 %2 %3
echo Build finished!
rmdir /S /Q                         D:\nginx-1.19.1\html\hotupdate\
xcopy /E /R /Y dist\NewUpdater\*    D:\nginx-1.19.1\html\hotupdate\
xcopy /E /R /Y extraFiles\*         D:\nginx-1.19.1\html\hotupdate\

rmdir /S /Q                         D:\nginx-1.19.1\updatertest\hotupdate\
xcopy /E /R /Y dist\NewUpdater\*    D:\nginx-1.19.1\updatertest\hotupdate\
xcopy /E /R /Y extraFiles\*         D:\nginx-1.19.1\updatertest\hotupdate\

D:\hyperink\Desktop\JsonGenerator-1.0.1.exe D:\nginx-1.19.1\updatertest\hotupdate
D:\hyperink\Desktop\JsonGenerator-1.0.1.exe D:\nginx-1.19.1\updatertest\resources