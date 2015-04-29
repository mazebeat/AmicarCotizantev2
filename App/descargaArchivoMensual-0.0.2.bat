@ECHO Off
SETLOCAL EnableDelayedExpansion

TITLE Amicar Cotizante v2 - Archivo Mensual

REM Amicar Cotizante Archivo Mensual version 0.0.2
REM @Autor 		Daniel Césped
REM @Modified	DIEGO F.
REM @DATE 		Creación		09-07-2014
REM @DATE 		Modificación	27-03-2015

ECHO ========================================================================
ECHO ========================================================================
ECHO                     Proceso data Amicar Cotizante
ECHO                        	Archivo Mensual     
ECHO                            Version 0.0.2 
ECHO ========================================================================
ECHO ========================================================================
ECHO.

REM SETEO VARIABLES
SET rutaArchivos=E:\Amicar\App
SET archivoMensual=Ejecutivo.txt

ECHO.
ECHO ========================================================================
ECHO                       PROCESANDO ARCHIVO MENSUAL
ECHO ========================================================================
ECHO.

REM LLAMA AL JAVA QUE PROCESA EL ARCHVO MENSUAL
JAVA -cp %rutaArchivos%CargaDatosAmicar2-0.0.1.jar cl.intelidata.amicar.CargaDatosAmicar %rutaArchivos% %rutaArchivos% %rutaArchivos%%archivoMensual%