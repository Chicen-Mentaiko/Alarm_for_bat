@echo off
setlocal

chcp 65001


echo +--------------------------+
echo *        アラーム          *
echo +--------------------------+


:settime
set /p hour="時を入力してください(00~24) >"
set /p min="分を入力してください(00~59) >"
set alrmtime=%hour%%min%
goto :setmusic
exit /b

:setmusic
set /p music="音楽のパスを入力してください >"
if  %music% == d (
    set music="default.mp3"
    ) else if %music% == r (
	set music="master.m3u8"
)
goto :alarm

:alarm
cls
set nowtime=%time: =0%
set nowhour=%nowtime:~0,2%
set nowmin=%nowtime:~3,2%

set nowtime=%nowhour%%nowmin%

if %nowtime% == %alrmtime% (
    %music%
    pause
    taskkill /im Microsoft.Media.Player.exe /f
    chcp 932
) else (
	echo SetTime: %hour%:%min%
	echo NowTime:%time%
	timeout /t 1 > nul
	cls
    goto :alarm
)
