@echo off
:start
title ��ȫ��Դ��...
mode con cols=140 lines=30
set name=Resources
set soft=Application
if exist %soft% (echo ����Application�ļ���!) else (echo ������Application�ļ���!���ڴ���!&md Application)
if exist %soft% (echo ����Application�ļ���!) else (echo ������Application�ļ���!���ڴ���!&md Application)
if exist %soft% (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!���ڲ�ȫ!&goto install)
if exist %soft% (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!���ڲ�ȫ!&goto install)
taskkill /f /IM adb.exe
cls & goto check
:install
title ������Դing...
if exist Resources\adb\adb.exe (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!������������!)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.zip)&(7z.exe x Resources.zip | FIND "ing archive")&(del Resources.zip)
if exist Resources\adb\adb.exe (echo ����Resources�ļ���!) else (echo ������Resources�ļ���!������������!)&(wget -q --show-progress https://mirror.ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.zip)&(7z.exe x Resources.zip | FIND "ing archive")&(del Resources.zip)
path = Resources
cls & goto start
:check
title ������Դing...
setlocal enabledelayedexpansion
if exist %name%\stats\cpu.txt (echo ���������!) else (echo ����ܲ�����!������������!)&(goto install)
if exist %name%\adb\adb.exe (echo adb������!) else (echo adb������!������������!)&(goto install)
if exist %name%\apk\aapt.exe (echo aapt����!) else (echo aapt������!������������!)&(goto install)
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    if "!Config!"=="ADBMODE0" cls & goto main
    if "!Config!"=="ADBMODE1" cls & goto main2
)
:main
title ��ʼ��...
path = %path%;.\resources\adb;
set ANDROID_ADB_SERVER_PORT=5037

echo ===================================== ��ӭʹ�� W.Tools ������!==================================================
echo =                                                                                                             =
echo =                  ��ǰ������ADBģʽ:!Config!(0Ϊ5037,1Ϊ24986)                                               =
echo =                  �����豸�Ƿ��������˵���!�������û����ʾ�豸��������!(��ʾunauthorized��δ��Ȩ,�������豸ͬ���ٽ�����һ������!)        =
echo =                  �������ADB�˿ڱ�ռ������빤�������ò��л�ADBMODE1                                        =
echo =                                                                                                             =
echo ==============================================================================================================
adb devices
pause
cls & goto input
:main2
title ��ʼ��...
set ANDROID_ADB_SERVER_PORT=24986
echo ===================================== ��ӭʹ�� W.Tools ������!==================================================
echo =                                                                                                             =
echo =                  ��ǰ������ADBģʽ:!Config!(0Ϊ5037,1Ϊ24986)                                               =
echo =                  �����豸�Ƿ��������˵���!�������û����ʾ�豸��������!(��ʾunauthorized��δ��Ȩ,�������豸ͬ���ٽ�����һ������!)        =
echo =                  �������ADB�˿ڱ�ռ������빤�������ò��л�ADBMODE0                                        =
echo =                                                                                                             =
echo ==============================================================================================================
adb devices
pause
cls & goto input
:input
setlocal enabledelayedexpansion
for /f "tokens=*" %%o in (%name%\stats\model.txt) do (
    set model=%%o
    set "model=!*:�豸δ��Ȩ��δ����!"
    echo !model!>>$
    move $ %name%\stats\model.txt
)
for /f "tokens=*" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
    set "sys=!*:�豸δ��Ȩ��δ����!"
    echo !sys!>>$
    move $ %name%\stats\sys.txt
)
for /f "tokens=*" %%u in (%name%\stats\devices.txt) do (
    set devices=%%u
    set "devices=!*:�豸δ����!"
    echo !devices!>>$
    move $ %name%\stats\devices.txt
)
for /f "tokens=*" %%s in (%name%\stats\stats.txt) do (
    set stats=%%s
    set "stats=!*:�豸δ����!"
    echo !stats!>>$
    move $ %name%\stats\stats.txt
)
for /f "tokens=2" %%i in (%name%\stats\ba.txt) do (
    set ba=%%i
)
cls
adb shell dumpsys battery | find "level">%name%\stats\ba.txt
adb devices >%name%\stats\devices.txt
adb devices >%name%\stats\stats.txt
adb shell getprop ro.product.model >%name%\stats\model.txt
adb shell getprop ro.build.version.release >%name%\stats\sys.txt
for /f "tokens=1" %%o in (%name%\stats\model.txt) do (
    set model=%%o
)
for /f "tokens=1" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
)
for /f "skip=1 tokens=1" %%z in (%name%\stats\devices.txt) do (
    set devices=%%z
)
for /f "skip=1 tokens=2" %%x in (%name%\stats\stats.txt) do (
    set stats=%%x
    if "!stats!"==" " (set "stats=!stats:*=�豸δ���ӵ�ADB��û����Ӧ!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
    if "!stats!"=="device" (set "stats=!stats:device=���ӳɹ�!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
    if "!stats!"=="unauthorized" (set "stats=!stats:unauthorized=�豸δ��Ȩ!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
    if "!stats!"=="offline" (set "stats=!stats:offline=�豸δ���ӵ�ADB��û����Ӧ!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
)
cls
title W.Tools������V1.2.6(BY:�����Ƶ�I9������LIPiston)
echo ====================  W.Tools������V1.2.6   BY:�����Ƶ�I9������LIPiston  ================
echo =                                                                                       =              
echo =           [1]�������                                            [2]�豸����          =              �������豸:!devices!
echo =                                                                                       =              �豸�ͺ�:!model!
echo =                                                                                       =              ��׿�汾:!sys!
echo =                                                                                       =              �豸����:!ba!             
echo =           [3]���ܹ���                                            [4]���������        =              ����״̬:!stats!
echo =                                                                                       =
echo ==========================[Re]��ʼ��������  [Q]�رչ�����================================
set /p "num=����������Ȼ���»س�����
if "%num%"=="1" cls & goto soft
if "%num%"=="2" cls & goto device
if "%num%"=="3" cls & goto tool
if "%num%"=="4" cls & goto manage
if "%num%"=="Q" cls & goto Exit
if "%num%"=="q" cls & goto Exit
if "%num%"=="Re" cls & goto Re
echo. & echo �����������1-4,Q��Re֮��������ַ��� & pause>nul & cls & goto input
:soft
echo                                             ============================================================
echo                                             =      [1]��װ�ճ����             [4]����/�������        =
echo                                             =      [2]��װ�Զ������           [5]��ȡ��ǰӦ��         =
echo                                             =      [3]ж�����                                         =
echo                                             ============================================================
set /p "num=����������Ȼ���»س���,����Q���أ�
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto is
if "%num%"=="2" cls & goto 7
if "%num%"=="3" cls & goto 8
if "%num%"=="4" cls & goto 9
if "%num%"=="5" cls & goto 10
:is
echo                                             ================================================================
echo                                             =      [1]��װ����������             [4]��װQQ(�ֱ��)         =
echo                                             =      [2]��װ�ѹ����뷨             [5]��װVA���             =
echo                                             =      [3]��װ����������(Lawnchair)  [6]��������������������Ƶ =
echo                                             ================================================================
set /p "num=����������Ȼ���»س���,����Q���أ�
if "%num%"=="Q" cls & goto soft
if "%num%"=="1" cls & goto 1
if "%num%"=="2" cls & goto a2
if "%num%"=="3" cls & goto b4
if "%num%"=="4" cls & goto b2
if "%num%"=="5" cls & goto 3
if "%num%"=="6" cls & goto bv
:device
echo                                             ============================================================
echo                                             =      [1]����DPI                                          =
echo                                             =      [2]�鿴�豸״̬                                     =
echo                                             =      [3]�������                                         =
echo                                             ============================================================
set /p "num=����������Ȼ���»س���,����Q���أ�
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto 5
if "%num%"=="2" cls & goto 6
if "%num%"=="3" cls & goto 11
:tool
echo                                             ============================================================
echo                                             =      [1]ADB������ģʽ                                    =
echo                                             =      [2]ScrcpyͶ��                                      =
echo                                             =      [3]�ı�����                                         =
echo                                             ============================================================
set /p "num=����������Ȼ���»س���,����Q���أ�
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto 4
if "%num%"=="2" cls & goto 21
if "%num%"=="3" cls & goto 22
:manage
echo                                             ============================================================
echo                                             =      [1]����������                                       =
echo                                             =      [2]����������                                       =
echo                                             ============================================================
set /p "num=����������Ȼ���»س���,����Q���أ�
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto 12
if "%num%"=="2" cls & goto 20
:1
if exist Resources\apk\Cloudmusic.apk (goto 1b) else (echo ��������������...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Cloudmusic.apk)&(move Cloudmusic.apk %name%\apk)&cls
:1b
echo ��������ִ�а�װ�ֻ���������.
echo =====================================================
echo ==============��װ������ing...=======================
echo =====================================================
adb install %name%\apk\cloudmusic.apk
set /p "dpi=�Ƿ�Ҫ����DPIΪ120����¼?��������Y,�������:
if "%dpi%"=="Y" (adb shell wm density 120)&(echo ����ɸ���!)&(echo ��½�����ƺ�,�����һ����DPI������220�ճ�ʹ��)&pause&(adb shell wm density 220)&(echo �ѽ�DPI�޸���220!)
cls & goto input
:2
echo  =======================================
echo =      [1]��װ�ѹ����뷨                =
echo =      [2]��װ���Դ��ֵ�QQ(�ֱ��)      =
echo =      [3]�������뷨                    =
echo =      [4]��װ����������(Lawnchair)     =
echo =      [5]һ��ȥ��/�ָ�������           =
echo  =======================================
set /p "cho2=��ѡ��һ�����,����Q�˳�:
if "%cho2%"=="1" cls & goto a2
if "%cho2%"=="2" cls & goto b2
if "%cho2%"=="3" cls & goto b3
if "%cho2%"=="4" cls & goto b4
if "%cho2%"=="5" cls & goto b5
if "%cho2%"=="Q" cls & goto input
echo. & echo �����������1-5��"Q"֮��������ַ��� & pause>nul & cls & goto 2
cls & goto input
:a2
if exist Resources\apk\sougouinput.apk (goto a22) else (echo ���������ѹ����뷨...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/sougouinput.apk)&(move sougouinput.apk %name%\apk)&cls
:a22
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
if exist Resources\apk\QQ.apk (goto b22) else (echo ��������QQ...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/QQ.apk)&(move QQ.apk %name%\apk)&cls
:b22
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
if exist Resources\apk\Lawnchair.apk (goto b44) else (echo ��������Lawnchair...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Lawnchair.apk)&(move Lawnchair.apk %name%\apk)&cls
:b44
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
set /p "ui=��ѡ��һ�����,����Q�˳�:
if "%ui%"=="1" cls & goto c1
if "%ui%"=="2" cls & goto c2
if "%ui%"=="Q" cls & goto input
:c1
echo ======================================================================================================================================================
echo +                      ȥ�������Լ�Ϊȥ���¿�,�ֱ����ʮ����,�п��ܻ����ֱ�!(ʵ������¶ȵ��55��C,���53.8��C,PA(����)64��C)                        +
echo +                      ȥ�������Ե�ԭ���ǽ���com.android.systemui��ϵͳUI�ﵽ��,��ʱ�����޷������绰��ʧȥ״̬����֪ͨ��!                             +
echo +                      ����������ڴ�֮ǰ�Ȱ�װһ������������,��Ҳ��������desk����ǰ����װ����,���Ѱ�װ�����Թ�                                      +
echo ======================================================================================================================================================
set /p "tips=������������yes do as i say,��������Q�˳�:
if "%tips%"=="yes do as i say" cls & goto d1
if "%tips%"=="desk" cls & goto b4
if "%tips%"=="Q" cls & goto input
if "%tips%"=="q" cls & goto input
echo. & echo �����������"yes do as i say"/"Q"/"desk"֮��������ַ��� & pause>nul & cls & goto c1
:d1
echo =========================
echo +    ����SystemUI��...  +
echo =========================
(adb shell pm disable-user com.android.systemui)&(echo �������,�밴Home����������)
echo �����������������
pause>nul
cls & goto input
:c2
echo =========================
echo +    �ָ�SystemUI��...  +
echo =========================
(adb shell pm enable com.android.systemui)&(echo �ָ�����밴Home����������)
echo �����������������
pause>nul
cls & goto input
:3
if exist Resources\apk\VAeXposed.apk (goto 3a) else (echo ��������VA���...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/VAeXposed.apk)&(move VAeXposed.apk %name%\apk)&cls
:3a
echo ��������ִ�а�װVAeXposed.
echo =====================================================
echo ==============��װVA���ing...=======================
echo =====================================================
adb install %name%\apk\VAeXposed.apk
set /p "cho=�Ƿ�Ҫ��������������������Ƶ?��������Y,�������:
if "%cho%"=="Y" goto bv else cls & goto input
:bv
if exist Resources\apk\Bili.apk (goto 3ab) else (echo ��������BILI&Vedio...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Bili.apk)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Vedio.apk)&(move Bili.apk %name%\apk)&(move Vedio.apk %name%\apk)&cls&(goto 3b)
:3ab
if exist Resources\apk\Vedio.apk (goto 3b) else (echo ��������Vedio...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Vedio.apk)&(move Vedio.apk %name%\apk)&cls
:3b
(adb push %name%\apk\Bili.apk //sdcard/DCIM)&(adb push %name%\apk\Vedio.apk //sdcard/DCIM)&(echo ����ɴ���!�����д򿪿�ܰ�װ!)&(timeout /t 5)&cls & goto input
:4
title ����Q����
echo =========================================================================================================================================
echo =          ���õ�adb������install(��װ),uninstall(ж��),reboot(����)��,�����аٶȲ鿴,�˴��Ѿ�ʡ����adb��ǰ׺,ֻ��Ҫֱ�����������    =
echo =========================================================================================================================================
setlocal enabledelayedexpansion
set /p command=���ڴ�����ָ��:
if "%command%"=="Q" (cls&goto input)
adb %command%&pause
cls
goto 4
:5
title ����Q����
adb shell wm density |find "Physical density">%name%\stats\dpi.txt
adb shell wm density |find "Override density">%name%\stats\cdpi.txt
setlocal enabledelayedexpansion
for /f "tokens=3" %%g in (%name%\stats\cdpi.txt) do (
    set cdpi=%%g
)
for /f "tokens=3" %%f in (%name%\stats\dpi.txt) do (
    set dpi=%%f
)
echo                                                          ============================
echo                                                          =     ��ǰ�豸DPIΪ!cdpi!     =
echo                                                          =     �豸Ĭ��DPIΪ!dpi!     =
echo                                                          ============================
set /p var=��������Ҫ�޸ĵ�DPIֵ:
if "%var%"=="Q" (cls&goto input)
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
adb shell cat /proc/meminfo |find "MemTotal">%name%\stats\mem.txt
adb shell cat /proc/meminfo |find "MemFree">%name%\stats\fmem.txt
adb shell wm density |find "Physical density">%name%\stats\dpi.txt
adb shell wm density |find "Override density">%name%\stats\cdpi.txt
setlocal enabledelayedexpansion
for /f "tokens=1" %%o in (%name%\stats\model.txt) do (
    set model=%%o
)
for /f "tokens=1" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
)
for /f "eol=* tokens=*" %%q in (%name%\stats\cpu.txt) do (
    set cpu=%%q
    set "cpu=!cpu:Hardware	=�ͺ�!"
)
for /f "tokens=2" %%w in (%name%\stats\mem.txt) do (
    set mem=%%w
)
for /f "tokens=2" %%e in (%name%\stats\fmem.txt) do (
    set fmem=%%e
)
for /f "tokens=3" %%f in (%name%\stats\dpi.txt) do (
    set dpi=%%f
)
for /f "tokens=3" %%g in (%name%\stats\cdpi.txt) do (
    set cdpi=%%g
)
for /f "tokens=2" %%i in (%name%\stats\ba.txt) do (
    set ba=%%i
    echo ================================================
    echo         �豸�ͺ�:!model!
    echo         Android�汾:!sys!
    echo         CPU!cpu!
    echo         �豸Ĭ��DPI:!dpi!
    echo         �豸��ǰDPI:!cdpi!
    echo         �豸���˴�:!mem!KB
    echo         �豸ʣ���˴�:!fmem!KB
    echo         ��ǰ����Ϊ:!ba!
    echo ================================================
)
title W.Tools������V1.2.6(BY:�����Ƶ�I9������LIPiston)
echo �����������������
pause>nul
cls & goto input
:7
title ����Q����
::setlocal enabledelayedexpansion
cls
echo =======================================================================================
echo =              ��ֱ�Ӱ�Ҫ��װ�����ֱ�����뵽�����䴰��(ȷ�����Ѿ�ǩ��ΪV2!)           =
echo =                      ���Ŀ¼��Ҫ�пո�,���򹤾���ֱ�ӱ���!                          =
echo =======================================================================================
set /p apk=Ҫ��װ�����:
if "%apk%"=="Q" (cls&goto input)
chcp 65001
%name%\apk\aapt.exe dump badging %apk% >%name%\stats\app.txt
find "package: name=" %name%\stats\app.txt > %name%\stats\pname.txt
find "application-label:'" %name%\stats\app.txt > %name%\stats\aname.txt
for /f "skip=2 tokens=*" %%c in (%name%\stats\aname.txt) do (
    set an=%%c
    set "an=!an:application-label:= !"
    echo !an!>>$
    move $ %name%\stats\aname.txt
)
for /f "skip=2 tokens=*" %%v in (%name%\stats\pname.txt) do (
    set pn=%%v
    set "pn=!pn:package: name= !"
    set "pn=!pn:versionName= !"
    echo !pn!>$
    move $ %name%\stats\pname.txt
)
for /f "tokens=1" %%r in (%name%\stats\pname.txt) do (
    set pn=%%r
)
for /f "tokens=3" %%t in (%name%\stats\pname.txt) do (
    set ppn=%%t
)
cls
chcp 936
cls
echo ==========================================================================================================
echo =              Ҫ��װ�������Ϣ:                     
echo =              �����!an!        
echo =              ����!pn!
echo =              �汾!ppn!
echo =              ��ȷ���Ƿ�װ��Ӧ��,��������Y,������Q����
echo ==========================================================================================================
set /p iapk=���ڴ�����:
if "%iapk%"=="Y" (adb install %apk%)
if "%iapk%"=="Q" (cls&goto input)
pause
cls
goto 7
:8
echo  ==========================================================
echo =        [1]��ȡ��ǰ�������   [2]��ȡ���а���            =
echo = Tips:��Ҫ��ȡ��ǰ��������������豸�ϴ���Ҫ��ȡ����� =
echo  ==========================================================    
set /p "num=����������,����Q���˳�:
if "%num%"=="1" cls & goto a8
if "%num%"=="2" cls & goto b8
if "%num%"=="Q" cls & goto input
echo. & echo �����������1-2/Q֮��������ַ��� & pause>nul & cls & goto 8
:a8
title ����Q����
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
    cls
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
)
echo =================================================
echo =    Ҫж�ص��������:!at!           
echo =================================================
set /p "atn=�������Ҫж�ص�������yes,��������Q�˳�:
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="Q" cls & goto input
echo. & echo �����������yes/Q֮��������ַ��� & pause>nul & cls & goto a8
:a99
adb uninstall !at!
echo �����������������
pause>nul
cls & goto input
:b8
title ����Q����
adb shell pm list packages>%name%\apk\list.txt
start %name%\apk\list.txt
echo ===============================================================
echo =      ���ڴ򿪵ļ��±����ҵ���Ҫж�ص�����İ��������Ƶ����� =
echo =      Tips:package:����ļ�Ϊ����                            =
echo ===============================================================
set /p unapk=Ҫж�ص����:
if "%unapk%"=="Q" (cls&goto input)
(adb uninstall %unapk%)&(echo ���!)
pause>nul
cls & goto input
echo �����������������
:9
echo  ==============================================
echo =     [1]����/����Ӧ��   [2]����/�ָ�Ӧ��      =
echo  ==============================================    
set /p "pm=����������,����Q���˳�:
if "%pm%"=="1" cls & goto a9
if "%pm%"=="2" cls & goto b9
if "%pm%"=="Q" cls & goto input
echo. & echo �����������1-2/"Q"֮��������ַ��� & pause>nul & cls & goto 9
:a9
title ����Q����
adb shell pm list packages>%name%\apk\list.txt
echo ===============================================================
echo =      ���ڴ򿪵ļ��±����ҵ���Ҫ���õ�����İ��������Ƶ����� =
echo =      Tips:package:����ļ�Ϊ����                            =
echo ===============================================================
start %name%\apk\list.txt
set /p bapk=Ҫ����/��������:
if "%bapk%"=="Q" (cls&goto input)
(adb shell pm disable-user %bapk%)&(echo ���!)
pause>nul
cls & goto input
echo �����������������
:b9
title ����Q����
echo ===============================================================
echo =      ���ڴ򿪵ļ��±����ҵ���Ҫ���õ�����İ��������Ƶ����� =
echo =      Tips:package:����ļ�Ϊ����                            =
echo ===============================================================
set /p eapk=Ҫ����/�ָ������:
if "%eapk%"=="Q" (cls&goto input)
(adb shell pm enable %eapk%)&(echo ���!)
pause>nul
cls & goto input
echo �����������������
:10
title ����Q����
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
    cls
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    echo =================================================
    echo =    Ҫ��ȡ���������:!at!           
    echo =================================================
)
set /p "atn=�������Ҫ��ȡ��������yes,��������Q�˳�:
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="Q" cls & goto input
echo. & echo �����������yes/Q֮��������ַ��� & pause>nul & cls & goto a8
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
title ����Q����
(adb shell mkdir //sdcard/Ringtones)&(echo �ɹ������ļ���!)&cls
echo =============================================================================================
echo =              ��ֱ�Ӱ�Ҫ���������ֱ�����뵽�����䴰��(ȷ����׺��Ϊogg!)                    =
echo =                      ���Ŀ¼��Ҫ�пո�,���򹤾���ֱ�ӱ���!                                =
echo =          Tips:�򳧼�ԭ��,�������������Ҫ�����豸�ſ�ʶ��,����ǰ�뱣���ֱ��ϵĹ���        =
echo =============================================================================================
set /p rts=�����Ҫ��ӵ������ϵ�����:
if "%rts%"=="Q" (cls&goto input)
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
set /p "choX=��ѡ��һ�����,����Q�˳�:
if "%choX%"=="1" cls & goto ADBPORTDEF
if "%choX%"=="2" cls & goto ADBPORT24986
if "%choX%"=="3" cls & goto update
if "%choX%"=="Q" cls & goto input
echo. & echo �����������1-2��Q֮��������ַ��� & pause>nul & cls & goto :20
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
    if "!nver!"=="1.2.6" (echo ��ǰ�汾�Ѹ���������,�������)&(echo �����������������)&(pause>nul)&(cls&goto input) else (echo ��ǰ�汾�ѹ���,���ڸ���!)&(timeout /nobreak /t 2)&cls&(goto dupdate)
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
:22
start %name%\adb\input.bat
cls&goto input