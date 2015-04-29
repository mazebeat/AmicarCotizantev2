package cl.intelidata.amicar.referencias;

public class Texto {

	/**
	 * Archivo Cabecera
	 */
	public static final String	CABECERA_ARCHIVO_DIARIO	     = "RUT_CLIENTE|EMAIL_CLIENTE|NOMBRE_LOCAL|NOMBRE_VENDEDOR|RUT_VENDEDOR|RUT_EJECUTIVO_ADJUDICA|NOMBRE_EJECUTIVO_ADJUDICA|NOMBRE_CLIENTE|FONO_CELULAR|FONO_COMERCIAL|FONO_PARTICULAR|MARCA_VEHICULO|MODELO_VEHICULO|VALOR_VEHICULO"; // "RUT_CLIENTE|EMAIL_CLIENTE|NOMBRE_CLIENTE|FONO_CELULAR|FONO_COMERCIAL|FONO_PARTICULAR|MARCA_VEHICULO|MODELO_VEHICULO|VALOR_VEHICULO|NOMBRE_LOCAL|NOMBRE_VENDEDOR|RUT_VENDEDOR";
	public static final String	CABECERA_ARCHIVO_MENSUAL	 = "RUT|LOCAL|NOMBRE_EJECUTIVO|CORREO_ELECTRONICO";	// "LOCAL|EJECUTIVO|CORREO";

	/**
	 * Parametros
	 */
	// ARCHIVO MENSUAL
	public static final int	   A_M_RUT_EJECUTIVO	         = 0;
	public static final int	   A_M_LOCAL	                 = 1;
	public static final int	   A_M_NOMBRE_EJECUTIVO	         = 2;
	public static final int	   A_M_CORREO_EJECUTIVO	         = 3;

	// ARCHIVO DIARIO
	public static final int	   A_D_RUT_CLIENTE	             = 0;
	public static final int	   A_D_EMAIL_CLIENTE	         = 1;
	public static final int	   A_D_NOMBRE_LOCAL	             = 2;
	public static final int	   A_D_NOMBRE_VENDEDOR	         = 3;
	public static final int	   A_D_RUT_VENDEDOR	             = 4;
	public static final int	   A_D_RUT_EJECUTIVO_ADJUDICA	 = 5;
	public static final int	   A_D_NOMBRE_EJECUTIVO_ADJUDICA = 6;
	public static final int	   A_D_NOMBRE_CLIENTE	         = 7;
	public static final int	   A_D_FONO_CELULAR	             = 8;
	public static final int	   A_D_FONO_COMERCIAL	         = 9;
	public static final int	   A_D_FONO_PARTICULAR	         = 10;
	public static final int	   A_D_MARCA_VEHICULO	         = 11;
	public static final int	   A_D_MODELO_VEHICULO	         = 12;
	public static final int	   A_D_VALOR_VEHICULO	         = 13;

	/**
	 * Mails
	 */
	public static final String	COTIZACION	                 = "cotizacion";
	public static final String	CLIENTE	                     = "cliente";
	public static final String	LLAVE_INICIO	             = "001";
	public static final String	LLAVE	                     = "amicarCotizante";
	public static final String	AMICAR	                     = "http://www.amicar.cl";

	/**
	 * MCrypt params Encrypt/Decrypt
	 */
	public static final String	KEY	                         = "amicarCotizantes";
	public static final String	IV	                         = "a1m2i3c4a5r6C7o8";

	/**
	 * LOG4J
	 */
	public final static String	LOG_PROPERTIES_FILE	         = "resources/log4j.properties";
}
