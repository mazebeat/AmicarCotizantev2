package cl.intelidata.amicar.componente;

import static cl.intelidata.amicar.conf.Configuracion.logger;

import java.util.ArrayList;
import java.util.List;

import cl.intelidata.amicar.bd.Proceso;
import cl.intelidata.amicar.beans.Archivo;
import cl.intelidata.amicar.beans.ConsultasDB;
import cl.intelidata.amicar.referencias.Texto;
import cl.intelidata.amicar.referencias.URL;

public class Mail {

	private String rutaSalida;

	public Mail(String rutaSalida) {
		this.setRutaSalida(rutaSalida);
	}

	public void clientes(List<Proceso> procesos) {
		List<String> lista = new ArrayList<String>();
		for (Proceso p : procesos) {
			lista.add(procesaLinea(p));
		}
		this.guardarArchivoMail(lista);
	}

	private void guardarArchivoMail(List<String> lista) {
		Archivo archivo = new Archivo(this.getRutaSalida());
		archivo.guardarLista(lista, "Clientes", "txt");
	}

	private String procesaLinea(Proceso proceso) {
		logger.info("ID Proceso: " + proceso.getIdProceso().toString());

		String line = "";
		ConsultasDB db = new ConsultasDB();
		String idBody = db
				.searchBodyIdByCliente(proceso.getClientesdiario()
						.getRutCliente(), proceso.getClientesdiario()
						.getEmailCliente());

		if (idBody != "") {
			List<String> list = new ArrayList<String>();
			list.add(Texto.LLAVE_INICIO);
			list.add(proceso.getClientesdiario().getEmailCliente());
			list.add(proceso.getClientesdiario().getRutCliente());
			list.add(URL.cliente(proceso.getIdProceso().toString(),
					String.valueOf(proceso.getClientesdiario().getIdCliente())));
			list.add(String.valueOf(proceso.getFechaEnvio()));
			list.add(URL.clienteLectura(proceso.getIdProceso().toString(),
					String.valueOf(proceso.getClientesdiario().getIdCliente())));
			list.add(String.valueOf(idBody));
			list.add(proceso.getClientesdiario().getNombreCliente());
			line = formatLine(list);

			System.out.println(line);

			
		} else {
			logger.info("Error al rescatar el valor del idBody, Proceso: {}", proceso.getIdProceso().toString());			
		}
		
		return line;
	}

	public String getRutaSalida() {
		return rutaSalida;
	}

	public void setRutaSalida(String rutaSalida) {
		this.rutaSalida = rutaSalida;
	}

	private static String formatLine(List<String> list) {
		String line = "";

		for (String l : list) {
			line = line.concat(l).concat("|");
		}

		return line;
	}
}
