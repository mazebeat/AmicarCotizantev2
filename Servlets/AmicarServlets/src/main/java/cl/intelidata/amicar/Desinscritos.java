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
import cl.intelidata.amicar.db.Clientes;
import cl.intelidata.amicar.util.Texto;

@SuppressWarnings("unused")
public class Desinscritos extends HttpServlet {

	public static Logger	logger	= LoggerFactory.getLogger(Desinscritos.class);

	/**
	 * Constructor of the object.
	 */
	public Desinscritos() {
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

		Clientes cliente = null;
		Validator val = new Validator();
		DB t = new DB();
		char opt = 'A';

		logger.info("INIT PROCESS");
		try {
			String cotiz = request.getParameter(Texto.COTIZACION);
			String cli = request.getParameter(Texto.CLIENTE);

			logger.info("VALIDATE INPUTS");
			if (val.validateInputs(cli, cotiz)) {
				cli = val.desencryptInput(cli);
				logger.info("GET CLIENTE");
				cliente = t.getCliente(Integer.parseInt(cli));

				if (cliente != null) {
					if (!cliente.getDesinscrito()) {
						logger.info("UPDATE CLIENTE");
						t.actualizarCliente(cliente);
						logger.info("REGISTER CLIENTE {}", cliente);
						opt = 'L';
					} else {
						logger.warn("CLIENTE YA DESISNCRITO {}", cliente);
					}
				} else {
					logger.info("ERROR DB: NOT FOUND CLIENTE {}", cliente);
				}
			} else {
				logger.warn("ERROR: URL PARAMS NOT VALID");
			}

			logger.info("REGISTER PROCESS: " + request.getParameter(Texto.CLIENTE) + " | " + request.getParameter(Texto.COTIZACION));

			// Tools.redirect(request, response, opt);
		} catch (Exception ex) {
			logger.error("ERROR PROCESS FAILED {}", ex);
		} finally {
			logger.info("FINISH PROCESS");
		}

	}

}
