package cl.intelidata.amicar;

import static cl.intelidata.amicar.conf.Configuracion.logger;
import cl.intelidata.amicar.componente.Procesa;
import cl.intelidata.amicar.conf.Configuracion;


public class CargaDatosAmicar2 {

	/**
	 * @param args
	 */
	public static void main(String... args) {
		try {
			Configuracion.configLog4();
			if (args.length != 3) {
				logger.error("LOS ARGUMENTOS NO SON VALIDOS... DEBE INGRESAR [RUTA_ENTRADA] [RUTA_SALIDA] [ARCHIVO]");
				System.exit(1);
			}
			
			logger.info("INICIANDO APLICACION");
			logger.info("ARGUMENTOS UTILIZADOS EN LA CONSULTA");
			
			for (int i = 0; i < args.length; i++) {
				logger.debug("ARGUMENTO {}: {} ", i, args[i]);
			}
			

			logger.info("INICIANDO PROCESO DE CARGA");
			Procesa procesa = new Procesa(args[0], args[1], args[2]);
			procesa.cargaData();
			logger.info("PROCESO FINALIZADO");

		} catch (Exception e) {
			logger.info("Error: {}", e);
			System.exit(1);
		}
	}
}