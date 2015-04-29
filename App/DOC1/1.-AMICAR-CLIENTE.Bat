@ECHO Off
SETLOCAL EnableDelayedExpansion

TITLE Amicar Cliente v2 - DOC1 GEN Cliente

REM Amicar Cotizante DOC1 GEN Cliente version 0.0.2
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

ECHO.
ECHO ========================================================================
ECHO                       CORRIENDO DOC1 GEN
ECHO ========================================================================
ECHO.

FOR /F %%f IN (%DATA%\ClientesGenerado.txt) DO (
	SET arch=%%f
)

REM EJECUTA DOC1GEN PARA PROCESAR ARCHIVO CLIENTE
CALL %DOC1%\doc1gen.exe %HIP%\CLIENTE.hip ops=%OPSS%\amicarcss.ops ArchIn=%DATA%\%arch% HIP=%HIP%\ OPSS=%OPSS%\ SAL=%SAL%\ ETS=%ETS%\ DATA=%DATA%\>proceso.log

IF NOT EXIST %SAL%\Generados MKDIR %SAL%\Generados
IF NOT EXIST %SAL%\Generados\HTML MKDIR %SAL%\Generados\HTML
IF NOT EXIST %SAL%\Generados\DIJ MKDIR %SAL%\Generados\DIJ

MOVE /y *.html %SAL%\Generados\html
MOVE /y %SAL%\*.html %SAL%\Generados\html

MOVE /y *.jrn %SAL%\Generados\DIJ
MOVE /y %SAL%\*.jrn %SAL%\Generados\DIJ

MOVE /y *.Jrn %SAL%\Generados
MOVE /y *.LOG %SAL%\Generados