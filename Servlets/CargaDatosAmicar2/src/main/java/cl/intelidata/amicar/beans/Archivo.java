package cl.intelidata.amicar.beans;

import static cl.intelidata.amicar.conf.Configuracion.logger;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import org.jam.superutils.FastFileTextReader;

/**
 * Archivo, facilita la lectura y escritura de los archivos, dentro de sus
 * metodos utilizando sobrecarga de metodos podemos encontrar funcionalidades
 * similares que reciben distintos parametros, dandonos versatilidad al momento
 * de utilizarla
 * <p>
 * 
 * @author Daniel C�sped Villanueva
 *         <p>
 */
public class Archivo {

	private String strPathEntrada;
	private String strPathSalida;
	private String strPrimeraLinea;
	// Extension archivo modificado a csv

	/**
     *
     */
	public final String CSV = "_pro.csv";

	/**
	 * 
	 * @param strDirectorioEntrada
	 * @param strDirectorioSalida
	 */
	public Archivo(String strDirectorioEntrada, String strDirectorioSalida) {
		setPath(strDirectorioEntrada.trim(), strDirectorioSalida.trim());
	}

	/**
	 * 
	 * @param strDirectorioSalida
	 */
	public Archivo(String strDirectorioSalida) {
		setPath(null, strDirectorioSalida.trim());
	}

	/**
	 * Lee un archivo en la ruta dentro de la ruta de origen, devolviendo una
	 * lista con los datos
	 * <p>
	 * 
	 * @param strArchivo
	 *            nombre del archivo a leer
	 * @param strCabecera
	 *            cabecera o primera linea a insertar
	 * @return Lista con los datos del archivo <B>List<String></b>
	 */
	public List<String> leer(String strArchivo, String strCabecera) {
		// Atributos y variables locales
		String strLinea = "";
		List<String> lista = new ArrayList<String>();
		int contador = 0;
		try {
			// Crea el objeto que leera el archivo
			strArchivo = this.getStrPathEntrada() + strArchivo;
			FastFileTextReader fastFileTextReader = new FastFileTextReader(
					strArchivo, FastFileTextReader.ISO_8859_1, 1024 * 40);
			// Comienza la lectura del archivo linea por linea
			while ((strLinea = fastFileTextReader.readLine()) != null) {
				logger.info("leyendo la linea: " + strLinea);

				// insertar lectura de los archivos
				if (strCabecera == null) {
					if (contador == 1) {
						lista.add(strLinea);
					}
				} else if (!strLinea.startsWith(strCabecera)) {
					lista.add(strLinea);
				}
				if (contador == 0) {
					this.setStrPrimeraLinea(strLinea);
					contador = 1;
				}
			}
			// Intenta el cierre del objeto que lee el archivo
			try {
				fastFileTextReader.close();
			} catch (Exception e) {
				this.error(e, "Problemas al cerrar el archivo");
			}
			// Confirma la lectura exitosa
			logger.info("Proceso del archivo teminado con exito");
		} catch (FileNotFoundException fe) {
			this.error(fe, "El archivo " + strArchivo + " no fue encontrado");
			System.exit(1);
		} catch (Exception e) {
			this.error(e, "Problemas al leer el archivo");
		}
		return lista;
	}

	/**
	 * 
	 * @param lista
	 * @param strRuta
	 * @param strExtension
	 */
	public void guardarLista(List<String> lista, String strRuta,
			String strExtension) {
		try {
			this.guardarLista(lista, strRuta, null, strExtension);
		} catch (Exception e) {
			this.error(e, "Problemas al guardar el archivo");
		}
	}

	/**
	 * 
	 * @param lista
	 * @param strRuta
	 * @param strCabecera
	 * @param strExtension
	 */
	public void guardarLista(List<String> lista, String strRuta, String strCabecera, String strExtension) {
        // Atributos y variables locales
        BufferedWriter bufferedWriter = null;
        BufferedWriter bufferedWriterArchivo = null;

        // Comienza la escritura del archivo
        String archivo = System.currentTimeMillis() + "." + strExtension;
        String archivoFinal = strRuta.trim() + archivo;
        strRuta = this.getStrPathSalida() + strRuta.trim();

        String strArchivo = strRuta.trim() + archivo;
        try {

            bufferedWriter = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(strArchivo), "UTF-8"));
            logger.info("Creando el archivo " + strArchivo);
            if (strCabecera != null) {
                // Inserta la cabecera del archivo
            	 logger.info("Insertando Cabecera...");
                bufferedWriter.append(strCabecera);
                bufferedWriter.newLine();
            }
            // Lee la lista y escribe el archivo
            logger.info("Escribiendo los datos...");
            for (String strDatos : lista) {
                bufferedWriter.append(strDatos);
                bufferedWriter.newLine();
            }
            bufferedWriterArchivo = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(strRuta + "Generado.txt"), "UTF-8"));
            bufferedWriterArchivo.append(archivoFinal);
            bufferedWriterArchivo.newLine();

        } catch (IOException e) {
            // TODO Auto-generated catch block
        	this.error(e, "");
        } finally {
            // Cierra el buffer de escritura
            try {
                bufferedWriter.close();
                bufferedWriterArchivo.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
            	this.error(e, "");
            }
        }
    }

	/**
	 * 
	 * @param lista
	 * @param strNombreArchivo
	 * @param strCabecera
	 */
	public void guardarListaCSV(List<String> lista, String strNombreArchivo,
			String strCabecera) {
		// Atributos y variables locales
		BufferedWriter bufferedWriter = null;

		// Comienza la escritura del archivo
		strNombreArchivo = this.getStrPathSalida() + strNombreArchivo.trim();
		String strArchivo = strNombreArchivo.trim()
				+ System.currentTimeMillis() + this.CSV;
		try {
			bufferedWriter = new BufferedWriter(new FileWriter(strArchivo));
			logger.info("Creando el archivo " + strArchivo);
			if (strCabecera != null) {
				// Inserta la cabecera del archivo
				logger.info("Insertando Cabecera...");
				bufferedWriter.append(strCabecera);
				bufferedWriter.newLine();
			}
			// Lee la lista y escribe el archivo
			logger.info("Escribiendo los datos...");
			for (String strDatos : lista) {
				bufferedWriter.append(strDatos);
				bufferedWriter.newLine();
			}

		} catch (IOException e) {
			this.error(e, "");
		} finally {
			// Cierra el buffer de escritura
			try {
				bufferedWriter.close();
			} catch (IOException e) {
				this.error(e, "");
			}
		}
	}

	/**
	 * 
	 * @param lista
	 * @param strNombreArchivo
	 */
	public void guardarListaCSV(List<String> lista, String strNombreArchivo) {
		try {
			this.guardarListaCSV(lista, strNombreArchivo, null);
		} catch (Exception e) {
			this.error(e, "Problemas la guardar el archivo");
		}
	}

	/**
	 * Setea las rutas y las carpetas donde se moveran los archivos
	 * <p>
	 * 
	 * @param strDirectorioEntrada
	 *            Ruta donde se alojan los archivos
	 */
	private void setPath(String strDirectorioEntrada, String strDirectorioSalida) {

		logger.info("Seteando los directorios de entrada y salida...");
		setStrPathEntrada(strDirectorioEntrada);
		setStrPathSalida(strDirectorioSalida);
		System.out
				.println("Directorios verificados y listo para la indexacion...");
	}

	private void error(Exception e, String strMensaje) {
		e.printStackTrace();
		logger.error(strMensaje, e);
		System.exit(1);
	}

	/**
	 * 
	 * @return
	 */
	public String getStrPathEntrada() {
		return strPathEntrada;
	}

	/**
	 * 
	 * @param strPathEntrada
	 */
	public void setStrPathEntrada(String strPathEntrada) {
		this.strPathEntrada = strPathEntrada;
	}

	/**
	 * 
	 * @return
	 */
	public String getStrPathSalida() {
		return strPathSalida;
	}

	/**
	 * 
	 * @param strPathSalida
	 */
	public void setStrPathSalida(String strPathSalida) {
		this.strPathSalida = strPathSalida;
	}

	/**
	 * 
	 * @return
	 */
	public String getStrPrimeraLinea() {
		return strPrimeraLinea;
	}

	/**
	 * 
	 * @param strPrimeraLinea
	 */
	public void setStrPrimeraLinea(String strPrimeraLinea) {
		this.strPrimeraLinea = strPrimeraLinea;
	}

}
