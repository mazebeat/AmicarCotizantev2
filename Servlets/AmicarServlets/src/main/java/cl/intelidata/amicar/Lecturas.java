package cl.intelidata.amicar;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cl.intelidata.amicar.componentes.DB;
import cl.intelidata.amicar.componentes.Validator;
import cl.intelidata.amicar.conf.Configuracion;
import cl.intelidata.amicar.db.Proceso;
import cl.intelidata.amicar.util.Texto;

public class Lecturas extends HttpServlet {

	public static Logger	logger	= LoggerFactory.getLogger(Lecturas.class);

	/**
	 * Constructor of the object.
	 */
	public Lecturas() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	@Override
    public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.processRequest(request, response);

		// response.setContentType("text/html");
		// PrintWriter out = response.getWriter();
		// out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		// out.println("<HTML>");
		// out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		// out.println("  <BODY>");
		// out.print("    This is ");
		// out.print(this.getClass());
		// out.println(", using the GET method");
		// out.println("  </BODY>");
		// out.println("</HTML>");
		// out.flush();
		// out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	@Override
    public void init() throws ServletException {
		// Put your code here
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Configuracion.configLog4();

		Proceso proc = null;
		Validator val = new Validator();
		DB t = new DB();

		logger.info("INIT PROCESS");
		try {
			String cotiz = request.getParameter(Texto.COTIZACION);
			String cli = request.getParameter(Texto.CLIENTE);

			logger.info("VALIDATE INPUTS");
			if (val.validateInputs(cli, cotiz)) {
				cotiz = val.desencryptInput(cotiz);
				logger.info("GET PROCESO");
				proc = t.getProceso(Integer.parseInt(cotiz));

				if (proc != null) {
					t.actualizarProceso(proc, 'r');
				} else {
					logger.info("ERROR BD: NOT FOUND PROCESO {}", proc);
				}
			} else {
				logger.error("ERROR: URL PARAMS NOT VALID");
			}

			logger.info("REGISTER PROCESS: {} | {}", request.getParameter(Texto.CLIENTE) + " | " + request.getParameter(Texto.COTIZACION));
			this.returnImage(response);
		} catch (Exception ex) {
			logger.error("ERROR PROCESS FAILED {}", ex);
		} finally {
			logger.info("FINISH PROCESS");
		}
	}

	private void returnImage(HttpServletResponse response) throws Exception {
		logger.info("SHOW IMAGE");
		OutputStream out = null;

		try {
			response.setContentType("image/png");
			String pathToWeb = getServletContext().getRealPath(File.separator);

			File f = new File(pathToWeb + "blank.png");
			logger.info("GET IMAGE", f.getAbsolutePath());
			BufferedImage bi = ImageIO.read(f);
			out = response.getOutputStream();
			ImageIO.write(bi, "png", out);
		} catch (Exception ex) {
			logger.error("ERROR SHOW IMAGE FAILED {}", ex);
		} finally {
			out.close();
		}
	}

}
