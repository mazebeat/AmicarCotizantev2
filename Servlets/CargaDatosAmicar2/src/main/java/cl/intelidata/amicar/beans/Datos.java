package cl.intelidata.amicar.beans;


public class Datos {
	private String strLinea = "";

	public Datos(String strLinea) {
		this.strLinea = strLinea;
	}

	public String extraer(int iPosicion) {
		String string = "";
		if (this.strLinea != null) {
			String[] array = separarColumnas(this.strLinea);
			string = array[iPosicion];
		}
		return string;
	}

        private String[] separarColumnas(String strLinea) {
		String separador = asignarSeparador(strLinea);
		if (!strLinea.endsWith(separador)) {
			strLinea = strLinea + separador;
		}
		strLinea = strLinea.replace(separador + separador, separador + " " + separador);
		strLinea = strLinea.replace(separador + separador, separador + " " + separador);
		String[] string = strLinea.split(separador);
		return string;
	}

	private String asignarSeparador(String strLinea) {
		String string = "\\|";
		if (strLinea.contains("\\|")) {
			string = "\\|";
		} else if (strLinea.contains(";")) {
			string = ";";
		}
		return string;
	}
}
