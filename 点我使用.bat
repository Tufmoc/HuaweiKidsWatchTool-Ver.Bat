@echo off
:start
title ��ȫ��Դ��...
color 4F
mode con cols=140 lines=30
if exist %soft% (echo ����Application�ļ���!) else (echo ������Application�ļ���!���ڴ���!&md Application)
if exist %soft% (echo ����Application�ļ���!) else (echo ������Application�ļ���!���ڴ���!&md Application)
if exist %soft% (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!���ڲ�ȫ!&goto install)
if exist %soft% (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!���ڲ�ȫ!&goto install)
set name=Resources
set soft=Application
taskkill /f /IM adb.exe
cls & goto check
:install
title ������Դing...
if exist Resources\adb\adb.exe (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!������������!)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.7z)&(7z.exe x Resources.7z | FIND "ing archive")&(del Resources.7z)
if exist Resources\adb\adb.exe (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!������������!)&(wget -q --show-progress https://mirror.ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.7z)&(7z.exe x Resources.7z | FIND "ing archive")&(del Resources.7z)
if exist Resources\apk\Cloudmusic.apk (echo ���������!) else (echo �����������!������������!)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/get-apk.zip)&(7z.exe x get-apk.zip -o%name%\apk | FIND "ing archive")&(del get-apk.zip)
if exist Resources\apk\Vedio.apk (echo ���������!) else (echo �����������!������������!)&(wget -q --show-progress https://mirror.ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/get-apk.zip)&(7z.exe x get-apk.zip -o%name%\apk | FIND "ing archive")&(del get-apk.zip)
path = Resources
cls & goto start
:check
title ������Դing...
setlocal enabledelayedexpansion
if exist %name%\apk\Cloudmusic.apk (echo ����Cloudmusic.apk!) else (echo ȱ��apk!������������!)&(goto install)
if exist %name%\apk\Bili.apk (echo ����Bili.apk!) else (echo ȱ��!������������!)&(goto install)
if exist %name%\apk\Lawnchair.apk (echo ����Lawnchair.apk!) else (echo ȱ��apk!������������!)&(goto install)
if exist %name%\apk\QQ.apk (echo ����QQ.apk!) else (echo ȱ��apk!������������!)&(goto install)
if exist %name%\apk\sougouinput.apk (echo ����sougouinput.apk!) else (echo ȱ��apk!������������!)&(goto install)
if exist %name%\apk\VAeXposed.apk (echo ����VAeXposed.apk!) else (echo ȱ��apk!������������!)&(goto install)
if exist %name%\apk\Vedio.apk (echo ����Vedio.apk!) else (echo ȱ��apk!������������!)&(goto install)
if exist %name%\stats\cpu.txt (echo ���������!) else (echo ����ܲ�����!������������!)&(goto install)
if exist %name%\adb\adb.exe (echo adb������!) else (echo adb������!������������!)&(goto install)
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    if "!Config!"=="ADBMODE0" cls & goto main
    if "!Config!"=="ADBMODE1" cls & goto main2
)
:main
title W.Tools������V1.1.9(BY:�����Ƶ�I9������LIPiston)
color    3F
echo ��ӭʹ�� W.Tools ������!
echo ������ADBģʽ:!Config!(0Ϊ5037,1Ϊ24986)
echo �����豸�Ƿ��������˵���!�������û����ʾ�豸��������!(��ʾunauthorized��δ��Ȩ!�������豸ͬ���ٽ�����һ������!)
echo �������ADB�˿ڱ�ռ������빤�������ò��л�ADBMODE1
path = %path%;.\resources\adb;
set ANDROID_ADB_SERVER_PORT=5037
adb.exe devices
pause
cls & goto input
:main2
title W.Tools������V1.1.9(BY:�����Ƶ�I9������LIPiston)
color    3F
echo ��ӭʹ�� W.Tools ������!
echo ������ADBģʽ:!Config!(0Ϊ5037,1Ϊ24986)
echo �����豸�Ƿ��������˵���!�������û����ʾ�豸��������!(��ʾunauthorized��δ��Ȩ!�������豸ͬ���ٽ�����һ������!)
echo �������ADB�˿ڱ�ռ������빤�������ò��л�ADBMODE1
path = %path%;.\resources\adb;
set ANDROID_ADB_SERVER_PORT=24986
adb.exe devices
pause
cls & goto input
:input
title W.Tools������V1.1.9(BY:�����Ƶ�I9������LIPiston)
echo ====================  W.Tools������V1.1.9   BY:�����Ƶ�I9������LIPiston  ================
echo =                                                                                       =
echo = [1]��װ������   [2]��װ�ճ����   [3]��װVAeXposed(���)   [4]ADB����   [5]����DPI    =
echo =                                                                                       =
echo = [6]�鿴�豸״̬   [7]��װӦ��   [8]ж��Ӧ��   [9]����/����Ӧ��   [10]��ȡ��ǰӦ��     =
echo =                                                                                       =
echo = [11]�滻����  [12]����������  [20]����������   [21]ScrcpyͶ��                         =
echo =                                                                                       =
echo ==========================[Re]��ʼ��������  [Exit]�رչ�����==============================
set /p "num=����������Ȼ���»س�����
if "%num%"=="1" cls & goto 1
if "%num%"=="2" cls & goto 2
if "%num%"=="3" cls & goto 3
if "%num%"=="4" cls & goto 4
if "%num%"=="5" cls & goto 5
if "%num%"=="6" cls & goto 6
if "%num%"=="7" cls & goto 7
if "%num%"=="8" cls & goto 8
if "%num%"=="9" cls & goto 9
if "%num%"=="10" cls & goto 10
if "%num%"=="11" cls & goto 11
if "%num%"=="12" cls & goto 12
if "%num%"=="20" cls & goto 20
if "%num%"=="Exit" cls & goto Exit
if "%num%"=="exit" cls & goto Exit
if "%num%"=="21" cls & goto 21
if "%num%"=="Re" cls & goto Re
echo. & echo �����������1-12,20-22��Re֮��������ַ��� & pause>nul & cls & goto input
:1
echo ��������ִ�а�װ�ֻ���������.
echo =====================================================
echo ==============��װ������ing...=======================
echo =====================================================
adb install %name%\apk\cloudmusic.apk
set /p "dpi=�Ƿ�Ҫ����DPIΪ120����¼?��������Y(�豸���Զ�����!),�������:
if "%dpi%"=="Y" (adb shell wm density 120)&(adb reboot)&(echo ����ɸ���!)&(echo �ȴ��豸�������,��½�����ƺ�,�����һ��DPI������220�ճ�ʹ��)&pause&(adb shell wm density 220)&(adb reboot)&(echo �ѽ�DPI�޸���220!)
cls & goto input
:2
echo  =======================================
echo =      [1]��װ�ѹ����뷨                =
echo =      [2]��װ���Դ��ֵ�QQ(�ֱ��)      =
echo =      [3]�������뷨                    =
echo =      [4]��װ����������(Lawnchair)     =
echo =      [5]һ��ȥ��/�ָ�������           =
echo  =======================================
set /p "cho2=��ѡ��һ�����,exit�˳�:
if "%cho2%"=="1" cls & goto a2
if "%cho2%"=="2" cls & goto b2
if "%cho2%"=="3" cls & goto b3
if "%cho2%"=="4" cls & goto b4
if "%cho2%"=="5" cls & goto b5
if "%cho2%"=="exit" cls & goto input
echo. & echo �����������1-5��"exit"֮��������ַ��� & pause>nul & cls & goto 2
cls & goto input
:a2
echo ��������ִ�а�װ�ѹ����뷨.
echo =====================================================
echo ==============��װ���뷨������ing...==================
echo =====================================================
adb install %name%\apk\sougouinput.apk
echo ������Զ��������뷨
timeout /t 3
adb shell ime enable com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
adb shell ime set com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
echo �����������������
pause>nul
cls & goto input
:b2
echo ��������ִ�а�װQQ.
echo =====================================================
echo ==============��װQQing...==========================
echo =====================================================
adb install %name%\apk\QQ.apk
echo �����������������
pause>nul
cls & goto input
:b3
echo ������Զ��������뷨
timeout /t 3
adb shell ime enable com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
adb shell ime set com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
echo �����������������
pause>nul
cls & goto input
:b4
echo ��������ִ�а�װLawnchair.
echo =====================================================
echo ==============��װLawnchairing...====================
echo =====================================================
adb install %name%\apk\Lawnchair.apk
echo �����������������
pause>nul
cls & goto input
:b5
echo  ===================
echo =   [1]ȥ��������   =
echo =   [2]�ָ�������   =
echo  ===================
set /p "ui=��ѡ��һ�����,exit�˳�:
if "%ui%"=="1" cls & goto c1
if "%ui%"=="2" cls & goto c2
if "%ui%"=="exit" cls & goto input
:c1
echo ��������������ʲô!ȥ�������Լ�Ϊȥ���¿�,�ֱ����ʮ����!�п��ܻ����ֱ�!(����ʵ������¶ȵ��55��C,���53.8��C,PA(����)64��C)
echo ȥ�������Ե�ԭ���ǽ���com.android.systemui��ϵͳui�ﵽ��,����������ڴ�֮ǰ�Ȱ�װһ������������,��Ҳ��������desk����ǰ����װ����,���Ѱ�װ�����Թ�
set /p "tips=������������yes do as I say,��������exit�˳�! :
if "%tips%"=="yes do as I say" cls & goto d1
if "%tips%"=="desk" cls & goto b4
if "%tips%"=="exit" cls & goto input
echo. & echo �����������"yes do as I say"/"exit"/"desk"֮��������ַ��� & pause>nul & cls & goto c1
:d1
(echo ����SystemUI��...)&(adb shell pm disable-user com.android.systemui)&(echo �ɹ�!�밴Home����������)
echo �����������������
pause>nul
cls & goto input
:c2
(echo �ָ���������...)&(adb shell pm enable com.android.systemui)&(echo �ɹ�!�밴Home����������)
echo �����������������
pause>nul
cls & goto input
:3
echo ��������ִ�а�װVAeXposed.
echo =====================================================
echo ==============��װVA���ing...=======================
echo =====================================================
adb install %name%\apk\VAeXposed.apk
set /p "cho=�Ƿ�Ҫ��������������������Ƶ?��������Y,�������:
if "%cho%"=="Y" (adb push %name%\apk\Bili.apk //sdcard/DCIM)&(adb push %name%\apk\Vedio.apk //sdcard/DCIM)&(echo ����ɴ���!�����д򿪿�ܰ�װ!)&(timeout /t 5)&cls & goto input
cls & goto input
:4
title ����exit����
echo ���õ�adb������install(��װ),uninstall(ж��),reboot(����)��,�����аٶȲ鿴,�˴��Ѿ�ʡ����adb��ǰ׺,ֻ��Ҫֱ�����������
setlocal enabledelayedexpansion
set /p command=����ָ��:
if "%command%"=="exit" (cls&goto input)
adb %command%&(echo ���!)&pause
cls
goto 4
:5
set /p var=����DPI:
(adb shell wm density %var%)&(echo ����ɸ���!)
echo �����������������
pause>nul
cls & goto input
:6
title ��ѯ��...
adb shell dumpsys battery | find "level">%name%\stats\ba.txt
adb shell getprop ro.product.model >%name%\stats\model.txt
adb shell getprop ro.build.version.release >%name%\stats\sys.txt
adb shell cat /proc/cpuinfo | find "Hardware">%name%\stats\cpu.txt
adb shell dumpsys meminfo |find "Total RAM">%name%\stats\mem.txt
adb shell dumpsys meminfo |find "Free RAM">%name%\stats\fmem.txt
adb shell wm density |find "Physical density">%name%\stats\dpi.txt
adb shell wm density |find "Override density">%name%\stats\cdpi.txt
setlocal enabledelayedexpansion
for /f "tokens=1" %%o in (%name%\stats\model.txt) do (
    set model=%%o
    echo �豸�ͺ�:!model!
)
for /f "tokens=1" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
    echo Android�汾:!sys!
)
for /f "eol=* tokens=*" %%q in (%name%\stats\cpu.txt) do (
    set cpu=%%q
    set "cpu=!cpu:Hardware	=�ͺ�!"
    echo CPU!cpu!
)
for /f "tokens=3" %%w in (%name%\stats\mem.txt) do (
    set mem=%%w
    echo �豸���ڴ�:!mem!
)
for /f "tokens=3" %%e in (%name%\stats\fmem.txt) do (
    set fmem=%%e
    echo �豸ʣ���ڴ�:!fmem!
)
)
for /f "tokens=3" %%f in (%name%\stats\dpi.txt) do (
    set dpi=%%f
    echo �豸Ĭ��DPI:!dpi!
)
)
for /f "tokens=3" %%g in (%name%\stats\cdpi.txt) do (
    set cdpi=%%g
    echo �豸��ǰDPI:!cdpi!
)
for /f "tokens=2" %%i in (%name%\stats\ba.txt) do (
    set ba=%%i
    echo ��ǰ����Ϊ:!ba!
)
title W.Tools������V1.1.9(BY:�����Ƶ�I9������LIPiston)
echo �����������������
pause>nul
cls & goto input
:7
title ����exit����
setlocal enabledelayedexpansion
echo ��ֱ�Ӱ�Ҫ��װ�����ֱ�����뵽�����䴰��(ȷ�����Ѿ�ǩ��ΪV2!�����Ӣ������,�������ȸ���!)
echo ���Ŀ¼��Ҫ����C��,���򹤾���ֱ�ӱ���!
set /p apk=Ҫ��װ�����:
if "%apk%"=="exit" (cls&goto input)
adb install %apk%&(echo ���!)&pause
cls
goto 7
pause
:8
echo  ==============================================
echo =     [1]��ȡ��ǰ�������   [2]��ȡ���а���    =
echo  ==============================================    
set /p "num=����������,����exit���˳�:
if "%num%"=="1" cls & goto a8
if "%num%"=="2" cls & goto b8
if "%num%"=="exit" cls & goto input
:a8
title ����exit����
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    echo Ҫж�صİ���!at!
)
set /p "atn=�������Ҫж�ص�������yes,��������exit�˳�! :
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="exit" cls & goto input
echo. & echo �����������yes/exit֮��������ַ��� & pause>nul & cls & goto a8
:a99
adb uninstall !at!
echo �����������������
pause>nul
cls & goto input
:b8
title ����exit����
adb shell pm list packages>%name%\apk\list.txt
echo ���ڴ򿪵ļ��±����ҵ���Ҫж�ص�����İ��������Ƶ�����(package����ľ��ǰ���!)
start %name%\apk\list.txt
set /p unapk=Ҫж�ص����:
if "%unapk%"=="exit" (cls&goto input)
(adb uninstall %unapk%)&(echo ���!)
pause>nul
cls & goto input
:9
echo  ==============================================
echo =     [1]����/����Ӧ��   [2]����/�ָ�Ӧ��      =
echo  ==============================================    
set /p "pm=����������,����exit���˳�:
if "%pm%"=="1" cls & goto a9
if "%pm%"=="2" cls & goto b9
if "%pm%"=="exit" cls & goto input
echo. & echo �����������1-2/"exit"֮��������ַ��� & pause>nul & cls & goto 9
:a9
title ����exit����
adb shell pm list packages>%name%\apk\list.txt
echo ���ڴ򿪵ļ��±����ҵ���Ҫ���õ�����İ��������Ƶ�����(package����ľ��ǰ���!)
start %name%\apk\list.txt
set /p bapk=Ҫ����/��������:
if "%bapk%"=="exit" (cls&goto input)
(adb shell pm disable-user %bapk%)&(echo ���!)
pause>nul
cls & goto input
:b9
title ����exit����
echo ���ҵ���Ҫ���õ�����İ��������Ƶ�����
set /p eapk=Ҫ����/�ָ������:
if "%eapk%"=="exit" (cls&goto input)
(adb shell pm enable %eapk%)&(echo ���!)
pause>nul
cls & goto input
:10
title ����exit����
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    echo Ҫ��ȡ�İ���!at!
)
set /p "atn=�������Ҫ��ȡ��������yes,��������exit�˳�! :
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="exit" cls & goto input
echo. & echo �����������yes/exit֮��������ַ��� & pause>nul & cls & goto a8
:a99
adb shell pm path !at! | find "package:">%name%\stats\bt.txt
for /f "tokens=*" %%m in (%name%\stats\bt.txt) do (
    set bt=%%m
    set "bt=!bt:package:/= !"
    echo !bt!>>$
    move $ %name%\stats\bt.txt
)
adb pull !bt! %soft%
ren Application\base.apk !at!.apk
echo ��ȡ�ɹ�!�뵽Application�ļ��в鿴Apk
start %soft%
echo �����������������
pause>nul
cls & goto input
:11
title ����exit����
(adb shell mkdir //sdcard/Ringtones)&(echo �ɹ������ļ���!)
set /p rts=�����Ҫ�滻������(.ogg��β)�ϵ�����:
if "%rts%"=="exit" (cls&goto input)
(adb push %rts% //sdcard/Ringtones)&(echo �������ļ��б�)&(adb shell ls //sdcard/Ringtones)&(echo �������!�豸���Զ�����.)
adb reboot
echo �����������������
pause>nul
cls & goto input
:12
start ����ʹ��.bat&exit
:20
echo   ========================================
echo =    ��ǰ������ģʽ!Config!                =
echo =    [1]�л�ADBMODE0(�ָ�Ĭ��5037�˿�)     =
echo =    [2]�л�ADBMODE1(�˿�Ϊ24986)          =
echo =    [3]���¹�����                         =
echo   ========================================
set /p "choX=��ѡ��һ�����,exit�˳�:
if "%choX%"=="1" cls & goto ADBPORTDEF
if "%choX%"=="2" cls & goto ADBPORT24986
if "%choX%"=="3" cls & goto update
if "%choX%"=="exit" cls & goto input
echo. & echo �����������1-2��exit֮��������ַ��� & pause>nul & cls & goto :20
:ADBPORTDEF
setlocal enabledelayedexpansion
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    set "Config=!Config:ADBMODE1=ADBMODE0!"
    echo !Config!>>$
    move $ %name%\stats\Config.txt
)
taskkill /f /IM adb.exe
echo �ָ�Ĭ�϶˿ڳɹ�,�����������������
pause>nul
start ����ʹ��.bat&exit
:ADBPORT24986
setlocal enabledelayedexpansion
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    set "Config=!Config:ADBMODE0=ADBMODE1!"
    echo !Config!>>$
    move $ %name%\stats\Config.txt
)
taskkill /f /IM adb.exe
echo ����24986�˿ڳɹ�,�����������������
pause>nul
start ����ʹ��.bat&exit
:update
setlocal enabledelayedexpansion
del %name%\stats\version.txt
(echo ���ڼ�����....)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Version.txt)&(move Version.txt %name%\stats\)&cls
for /f "tokens=*" %%A in (%name%\stats\Version.txt) do (
    set nver=%%A
    if "!nver!"=="1.1.9" (echo ��ǰ�汾�Ѹ���������,�������)&(echo �����������������)&(pause>nul)&(cls&goto input) else (echo ��ǰ�汾�ѹ���,���ڸ���!)&(timeout /nobreak /t 2)&cls&(goto dupdate)
)
:dupdate
(echo ���ظ��½ű���...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/update.bat)&(if exist update.bat (goto doupdate&del version.txt) else (echo �ļ�������,������������!)&(cls&goto dupdate)
:doupdate
(echo ��ʼ����!)&(timeout /nobreak /t 2)&(start update.bat)&exit 
:Exit
start �ر�ADB����.bat&exit
:21
start �ر�ADB����.bat
timeout /nobreak /t 1
start scrcpy.exe
pause
start �ر�ADB����.bat
cls & goto 12
:Re
cls & start �ر�ADB����.bat
timeout /nobreak /t 2
rd /s/Q %soft%
rd /s/Q %name%
del /s/Q .wget-hsts
exit