@Echo OFF

REM --------------------------------------------------------------------------------------------------------------------
REM -- FILE NAME    : JNJ_ES_DR_AHQC-6265.BAT
REM -- AUTHOR       : KARTHIK AS
REM -- DATE CREATED : 04-AUG-2022
REM -- PURPOSE      : This script is used to update existing DR's and to create New DRs
REM --------------------------------------------------------------------------------------------------------------------
set install_file=.\INSTALL.LOG
set timestamp=%DATE% %TIME%
set NLS_LANG=AMERICAN_AMERICA.AL32UTF8

:Begin  
CLS
ECHO                              Welcome %username% :      
ECHO.
echo          ======================================================================           
echo                             JNJ_ES_DR_AHQC-6265
echo          ======================================================================   
echo.


REM ==========================================================================================
REM    Prompt For ARISg TS Schema Credintials for JNJ_ES_DR_AHQC-6265
REM ==========================================================================================

:JNJ_AG_CONN
set /P ag_user=       Please Enter ARISg Schema Name           : 
echo.
REM set /p ag_pass=       Please Enter ARISg Schema Password       :
set "psCommand=powershell -Command "$pword = read-host 'Please Enter ARISg Schema Password       ' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set ag_pass=%%p
echo.
set /p ag_conn=       Please Enter ARISg SID   : 


sqlplus %ag_user%/%ag_pass%@%ag_conn% @.\SCRIPTS\AHQC-6265.SQL
sqlplus %ag_user%/%ag_pass%@%ag_conn% @.\SCRIPTS\PRISM_CONFIG_DETAILS.SQL

pause