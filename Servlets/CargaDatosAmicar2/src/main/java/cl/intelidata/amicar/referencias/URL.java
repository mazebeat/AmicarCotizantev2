package cl.intelidata.amicar.referencias;

import static cl.intelidata.amicar.conf.Configuracion.logger;

import java.util.HashMap;
import java.util.Map.Entry;

import cl.intelidata.amicar.beans.MCrypt;
import cl.intelidata.amicar.conf.Configuracion;


public class URL {

	

	public static String cliente(String strProceso, String strCliente) {
		String respuesta = Texto.AMICAR;
		String dominioClick = Configuracion.getInstance().getInitParameter("dominioClick");

		if ((strProceso != null)) {
			try {
				MCrypt mcrypt = new MCrypt();

				HashMap<String, String> params = new java.util.HashMap<String, String>();
				params.put(Texto.CLIENTE, MCrypt.bytesToHex(mcrypt.encrypt(strCliente)));
				params.put(Texto.COTIZACION, MCrypt.bytesToHex(mcrypt.encrypt(strProceso)));

				logger.info("Generando URL click");
				respuesta = fullURL(dominioClick, params);
			} catch (Exception e) {
				logger.error("Error URL cliente: " + e.getMessage());
			}
		}
		return respuesta;
	}

	public static String clienteLectura(String strProceso, String strCliente) {
		String respuesta = Texto.AMICAR;
		String dominio = Configuracion.getInstance().getInitParameter("dominioLectura");

		if ((strProceso != null)) {
			try {
				MCrypt mcrypt = new MCrypt();

				HashMap<String, String> params = new java.util.HashMap<String, String>();
				params.put(Texto.CLIENTE, MCrypt.bytesToHex(mcrypt.encrypt(strCliente)));
				params.put(Texto.COTIZACION, MCrypt.bytesToHex(mcrypt.encrypt(strProceso)));

				logger.info("Generando URL lectura");
				respuesta = fullURL(dominio, params);
			} catch (Exception e) {
				logger.error("Error URL clienteLectura: " + e.getMessage());
			}
		}
		return respuesta;
	}

	public static String fullURL(String urlBase, HashMap<String, String> params) {
		if (!urlBase.endsWith("?")) {
			urlBase = urlBase.concat("?");
		}

		for (Entry<String, String> entry : params.entrySet()) {
			String param = entry.getKey().toString() + "=" + entry.getValue() + "&";
			urlBase = urlBase.concat(param);
		}

		if (urlBase.endsWith("&")) {
			urlBase = urlBase.substring(0, urlBase.length() - 1);
		}

		return urlBase;
	}
}
