@ECHO Off
SETLOCAL EnableDelayedExpansion

TITLE Amicar Cotizante v2 - Archivo Diario

REM Amicar Cotizante Archivo Diario version 0.0.2
REM @Autor 		Daniel Césped
REM @Modified	DIEGO F.
REM @DATE 		Creación		09-07-2014
REM @DATE 		Modificación	27-03-2015

ECHO ========================================================================
ECHO ========================================================================
ECHO                     Proceso data Amicar Cotizante
ECHO                        	Archivo Diario     
ECHO                            Version 0.0.2 
ECHO ========================================================================
ECHO ========================================================================
ECHO.

REM SETEO VARIABLES    
REM PATHS
:: :: :: APP
SET rutaArchivos=E:\Amicar\App\
SET rutaJava=%rutaArchivos%JAVA\
SET rutaFtp=%rutaArchivos%FTP\
SET rutaCargados=%rutaArchivos%CARGADOS\

:: :: DOC1
SET rutaDOCONEDATASALIDA=%rutaArchivos%DOC1\DATA\
SET rutaSalida=%rutaArchivos%DOC1\Salida\
SET rutaDOCONE=%rutaArchivos%DOC1\

:: :: SALIDAS
:: HTML
SET rutaSalidaHTML=%rutaArchivos%DOC1\SALIDA\Generados\HTML\salida\
SET rutaEntradaHTML=%rutaArchivos%DOC1\SALIDA\Generados\HTML\
:: LOGS
SET rutaSalidaLog=%rutaArchivos%DOC1\SALIDA\Generados\
:: DIJ
SET rutaDIJ=%rutaArchivos%DOC1\SALIDA\Generados\DIJ\

:: :: :: BODYS
SET rutaBodys=E:\Projects\Html\TemplateMailsAmicar2\

REM ARCHIVOS A UTILIZAR
SET CLIENTE=Clientes
SET codigo=_VUELA_COTIZADOS_SIN_SOLICITUD.CSV
SET archivoFTP=amicarLista.txt

REM FTP CONFIG
SET ipFTP=192.231.140.30
SET user=amicarvuela
SET pass=amicar.2014$
SET dirFTP=cd ftpamicarvuela
SET descargaFTP=descargarFTP.ftps
SET vacio=vacio
SET ftpScript=ftpScript.ftps

REM EMESSAGING CONFIG
SET RUTA_EMESSAGING_HTML=\\10.160.1.104\Amicar_Vuela\OutProfiles\CotizantesAmicar\html
SET RUTA_EMESSAGING_DIJ=\\10.160.1.104\Amicar_Vuela\OutProfiles\CotizantesAmicar\dij
SET PASS_SERVER=ID727s
SET USER_SERVER=Administrador

ECHO.
ECHO ========================================================================
ECHO                       OBTENIENDO ARCHIVO DESDE FTP
ECHO ========================================================================
ECHO.

:: REM ESTO DEBE SER DESCOMENTADO AL MOMENTO DE REALIZAR LAS PRUEBAS CON EL SERVIDOR FTP.
:: 
:: REM CONEXIÓN AL FTP PARA LISTAR ARCHIVOS EXISTENTES
:: FTP -s:%rutaFtp%%ftpScript% %ipFTP% 
:: 
:: REM LLAMA AL APLICATIVO JAVA ENCARFADO DE ENTREGARNOS LA FECHA VIGENTE DEL ARCHVIVO A DESCARGAR
:: FOR /F %%a IN ('JAVA -cp %rutaJava%ArchivosAmicarFTP-0.0.3.jar cl.intelidata.amicar.main.Fecha') DO (
:: 	SET archivo=%%a
:: 	)
:: 
:: REM LECTURA Y RESCATE DEL ÚLTIMO ARCHIVO
:: ECHO Buscando el archivo %archivo%%codigo% en el servidor ftp
:: 
:: FOR /F %%z IN ('JAVA -cp %rutaJava%ArchivosAmicarFTP-0.0.3.jar cl.intelidata.amicar.main.ArchivoDiario %rutaArchivos% %archivoFTP% %archivo%%codigo%') DO (
:: 	SET archivoDiario=%%z
:: 	)
:: 
:: REM CREA INSTRUCCIONES PARA FTP Y BAJAR EL ARCHIVO NECESARIO
:: IF EXIST %descargaFTP% (
:: 	DEL %descargaFTP%
:: 	)
:: 
:: REM CREA EL ARCHIVO DE INSTRUCCIONES PARA EL FTP
:: IF %archivoDiario%==%vacio% (
:: 	ECHO El archivo %archivo%%codigo% no esta disponible en el servidor FTP
:: 	) ELSE (
:: 	ECHO %user% >> %descargaFTP%
:: 	ECHO %pass% >> %descargaFTP%
:: 	ECHO %dirFTP% >> %descargaFTP%
:: 	ECHO get %archivoDiario% >> %descargaFTP%
:: 	ECHO bye >> %descargaFTP%
:: 
:: 	REM SE CONECTA AL FTP Y DESCARGA EL ARCHIVO SOLICITADO
:: 	FTP -s:%descargaFTP% %ipFTP%

	ECHO.
	ECHO ========================================================================
	ECHO                       PROCESANDO ARCHIVO DIARIO
	ECHO ========================================================================
	ECHO.

	SET archivoDiario=CUSTOMER_TEST.CSV

	REM LLAMA AL BAT QUE PROCESA EL ARCHIVIO DIARIO
	JAVA -cp %rutaJava%CargaDatosAmicar2-0.0.1.jar cl.intelidata.amicar.CargaDatosAmicar2 %rutaArchivos% %rutaDOCONEDATASALIDA% %archivoDiario%

	REM VERIFICA SI EXISTE LA CARPETA CARGADOS, SINO LA CREA
	IF NOT EXIST cargados (
		MKDIR cargados
		)

	REM MUEVE EL ARCHIVO PROCESADO A LA CARPETA DE CARGADOS
	ECHO MOVIENDO %rutaArchivos%%archivoDiario% A CARPETA CARGADOS
	:: MOVE %archivoDiario% %rutaCargados%

	REM MUEVE TODOS LOS ARCHIVOS GENERADOS A LA CARPETA DE SALIDA
	ECHO MOVIENDO TODOS LOS ARCHIVOS %CLIENTE%*.* A %rutaDOCONEDATASALIDA%
	MOVE %rutaSalida%%CLIENTE%*.* %rutaDOCONEDATASALIDA%

	REM LLAMA A DOC1 Y GENERA LOS BODYS
	CALL %rutaDOCONE%1.-AMICAR-CLIENTE.bat

	ECHO.
	ECHO ========================================================================
	ECHO                      APLICANDO FIX HTML AMICAR
	ECHO ========================================================================
	ECHO.

	REM CREA LA RUTA DE SALIDA SI ESTA NO EXISTE
	IF NOT EXIST %rutaSalidaHTML% MKDIR %rutaSalidaHTML%

	REM MUEVE IMAGENES (PNG) A LA RUTA DE SALIDA
	COPY %rutaBodys%*.png %rutaSalidaHTML%

	REM VERIFICA SI EXISTE LA CARPETA %rutaSalidaHTML%, SINO LA CREA
	IF NOT EXIST %rutaSalidaHTML% (
		MKDIR %rutaSalidaHTML%
		)

	REM APLICAMOS FIX PARA OBTENER EL BODYS DE LOS CORREOS SEGUN EL ALGORITMO DE SELECCION
	JAVA -cp %rutaJava%AmicarAddFixBody-1.0.jar cl.intelidata.amicar.AmicarAddFixBody %rutaEntradaHTML% %rutaSalidaHTML% %rutaDIJ% %rutaBodys%

	REM MOVER EL ARCHIVO LOG DEL FIX  A LA CARPETA GENERADOS
	MOVE /y *.LOG %SAL%\Generados

::	ECHO.
::	ECHO ========================================================================
::	ECHO                      PROCESANDO ARCHIVOS CON EMESSAGING
::	ECHO ========================================================================
::	ECHO.
::
:: 	REM COPIA ARCHIVOS HTML Y DIJ A PERFIL DEL EMESSAGING
:: 	NET USE %RUTA_EMESSAGING_HTML% %PASS_SERVER% /USER:%USER_SERVER%
:: 	MOVE %rutaSalidaHTML%*.html %RUTA_EMESSAGING_HTML%
:: 
:: 	NET USE %RUTA_EMESSAGING_DIJ% %PASS_SERVER% /USER:%USER_SERVER%
:: 	MOVE %rutaDIJ%*.jrn %RUTA_EMESSAGING_DIJ%
:: 
:: 	IF EXIST %rutaSalidaHTML%*.html (
:: 		DEL %rutaEntradaHTML%*.html
:: 		DEL %rutaSalidaHTML%*.html
:: 		) ELSE (
:: 		ECHO no hay archivos html
:: 		)
:: 
:: 		REM DEL %rutaDOCONEDATA%*.txt - ELIMINA LOS ARCHIVOS QUE YA NO SE UTILIZAN
:: 		IF EXIST %archivoFTP% (
:: 			DEL %archivoFTP%
:: 			)
:: 
:: 		IF EXIST %descargaFTP% (
:: 			DEL %descargaFTP%
:: 			)
:: 
:: 		REM RENOMBRANDO LOG PARA DEJAR REGISTRO DEL PROCESO Y CONTINUIDAD OPERATIVA
:: 		CD %rutaSalidaLog%
:: 
:: 		IF EXIST CotizanteAmicar2.log (
:: 			ECHO Renombrando CotizanteAmicar2.log
:: 			RENAME CotizanteAmicar2.log %DATE:~0,2%%DATE:~3,2%%DATE:~6,4%CotizanteAmicar2.log
:: 			)
:: 
:: 		IF EXIST proceso.log (
:: 			ECHO Renombrando proceso.log
:: 			RENAME proceso.log %DATE:~0,2%%DATE:~3,2%%DATE:~6,4%proceso.log
:: 			)
:: 
:: 		ECHO.
:: 		ECHO PROCESO TERMINADO CORRECTAMENTE.
:: 		EXIT 0;
:: 
:: 		)
:: ECHO.
:: EXIT 0;

PAUSE

:: java -cp AmicarAddFixBody-1.0-SNAPSHOT-jar-with-dependencies.jar cl.intelidata.amicar.AmicarAddFixBody E:\Amicar\App\DOC1\SALIDA\Generados\HTML\ E:\Amicar\App\DOC1\SALIDA\Generados\HTML\salida\ E:\Amicar\App\DOC1\SALIDA\Generados\DIJ\ E:\Projects\Html\TemplateMailsAmicar2\