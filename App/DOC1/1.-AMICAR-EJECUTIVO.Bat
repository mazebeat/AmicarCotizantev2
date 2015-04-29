@ECHO Off
SETLOCAL EnableDelayedExpansion

TITLE Amicar Ejecutivo v2 - DOC1 GEN Ejecutivo

REM Amicar Cotizante DOC1 GEN Ejecutivo version 0.0.2
REM @Autor 		Daniel Césped
REM @Modified	DIEGO F.
REM @DATE 		Creación		09-07-2014
REM @DATE 		Modificación	27-03-2015

REM INICIO SETEO CARPETAS VARIABLES
SET RAIZ=E:\Amicar\App\
SET DOC1=%RAIZ%D1GEN57
SET HIP=%RAIZ%DOC1
SET ETS=%RAIZ%DOC1
SET OPSS=%RAIZ%DOC1
SET SAL=%RAIZ%DOC1\SALIDA
SET DATA=%RAIZ%DOC1\DATA
SET RUTA_EMESSAGING_HTML=\\10.160.1.104\Amicar_Vuela\OutProfiles\CotizantesAmicar\html
SET RUTA_EMESSAGING_DIJ=\\10.160.1.104\Amicar_Vuela\OutProfiles\CotizantesAmicar\dij
SET PASS_SERVER=ID727s
SET USER_SERVER=Administrator
SET LOG=%SAL%ejecutivo.log

IF EXIST %DATA%\EjecutivosGenerado*.* DEL %DATA%\EjecutivosGenerado*.*

ECHO.
ECHO ========================================================================
ECHO                       CORRIENDO DOC1 GEN
ECHO ========================================================================
ECHO.

FOR %%e IN (%DATA%\Ejecutivos*.*) DO (
	CALL %DOC1%\doc1gen.Exe %HIP%\EJECUTIVO.hip ops=%OPSS%\amicarcssEjecutivo.ops ArchIn=%DATA%\%%~nxe HIP=%HIP%\ OPSS=%OPSS%\ SAL=%SAL%\ ETS=%ETS%\ > %LOG%

	SET Fecha=!Date!
	SET Fecha=!Date: =-!
	SET Hora=%Time%
	SET Hora=!Hora:~0,4!
	SET Fecha=!Fecha!-!Hora!-%%~ne
	
	IF NOT EXIST %SAL%\!Fecha! MKDIR %SAL%\!Fecha!
	IF NOT EXIST %SAL%\!Fecha!\HTML MKDIR %SAL%\!Fecha!\HTML
	IF NOT EXIST %SAL%\!Fecha!\DIJ MKDIR %SAL%\!Fecha!\DIJ

	MOVE /-y *.html %SAL%\!Fecha!\HTML
	MOVE /-y *.jrn %SAL%\!Fecha!\DIJ
	MOVE /-y %DATA%\%%~nxe %SAL%\!Fecha!\
	
	NET USE %RUTA_EMESSAGING_HTML% %PASS_SERVER% /USER:%USER_SERVER%
	MOVE %SAL%\!Fecha!\HTML\*.html %RUTA_EMESSAGING_HTML%
	
	NET USE %RUTA_EMESSAGING_DIJ% %PASS_SERVER% /USER:%USER_SERVER%
	MOVE %SAL%\!Fecha!\DIJ\*.jrn %RUTA_EMESSAGING_DIJ%
	
	TIMEOUT /t 20

	)