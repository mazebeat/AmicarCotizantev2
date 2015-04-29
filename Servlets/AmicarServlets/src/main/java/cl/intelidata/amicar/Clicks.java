package cl.intelidata.amicar;

import java.io.IOException;
import java.io.PrintWriter;

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
import cl.intelidata.amicar.util.Tools;

@SuppressWarnings("unused")
public class Clicks extends HttpServlet {

	public static Logger	logger	= LoggerFactory.getLogger(Clicks.class);

	/**
	 * Constructor of the object.
	 */
	public Clicks() {
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

//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the GET method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
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
		logger.info("INIT PROCESS");

		Configuracion.configLog4();
		Validator val = new Validator();
		char opt = 'A';

		try {
			String cotiz = request.getParameter(Texto.COTIZACION);
			String cli = request.getParameter(Texto.CLIENTE);

			logger.info("VALIDATE INPUTS");
			if (val.validateInputs(cli, cotiz)) {
				Proceso proceso = null;
				DB d = new DB();

				cotiz = val.desencryptInput(cotiz);
				logger.info("GET PROCESO");
				proceso = d.getProceso(Integer.parseInt(cotiz));

				if (proceso != null) {
					if (proceso.getFechaClickLink() == null) {
						d.actualizarProceso(proceso, 'c');

						logger.info("GENERATE MAIL FILE TO EJECUTIVO");
						Tools.mailEjecutivo(proceso);
						logger.info("REGISTER PROCESS: " + request.getParameter(Texto.CLIENTE) + " | " + request.getParameter(Texto.COTIZACION));
					} else {
						logger.info("COTIZACION YA REALIZADA", proceso);
					}
					opt = 'L';
				} else {
					logger.info("ERROR BD: NOT FOUND PROCESO", proceso);
				}
			} else {
				logger.error("ERROR: URL PARAMS NOT VALID");
			}

			// Tools.redirect(request, response, opt);
		} catch (Exception ex) {
			logger.error("ERROR PROCESS FAILED", ex);
		} finally {
			logger.info("FINISH PROCESS");
		}
	}

}
