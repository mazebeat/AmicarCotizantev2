package cl.intelidata.amicar.beans;

import static cl.intelidata.amicar.conf.Configuracion.logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import cl.intelidata.amicar.bd.Clientesdiario;
import cl.intelidata.amicar.bd.Correoserrorformato;
import cl.intelidata.amicar.bd.Ejecutivos;
import cl.intelidata.amicar.bd.Locales;
import cl.intelidata.amicar.bd.Proceso;
import cl.intelidata.amicar.bd.Vendedores;
import cl.intelidata.amicar.conf.EntityHelper;

/**
 * 
 * @author Maze
 */
public class ConsultasDB {

	/**
     *
     */
	public ConsultasDB() {

	}

	public Proceso procesoActivo(int iProcesoID) {
		Proceso proceso = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			proceso = em.find(Proceso.class, iProcesoID);
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
		return proceso;
	}

	public void updateProceso(Proceso proceso) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.merge(proceso);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public void saveProceso(Proceso proceso) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.persist(proceso);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public void saveLocal(Locales local) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.persist(local);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public Locales buscarLocalPorDescripcion(String nombreLocal) {
		Locales local = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Locales> locales = new ArrayList<Locales>();
			Query query = em.createQuery("SELECT c FROM Locales c WHERE c.nombreLocal = :nombreLocal");
			query.setParameter("nombreLocal", nombreLocal);
			locales = query.getResultList();

			for (Locales l : locales) {
				local = l;
			}

		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
		return local;
	}

	public void saveEjecutivo(Ejecutivos ejecutivo) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.persist(ejecutivo);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public void updateEjecutivo(Ejecutivos ejecutivo) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.merge(ejecutivo);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public Ejecutivos buscarEjecutivoPorEmail(String email) {
		Ejecutivos ejecutivo = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Ejecutivos> ejecutivos = new ArrayList<Ejecutivos>();
			Query query = em.createQuery("SELECT c FROM Clientesdiario c WHERE c.correEjecutivo = :correEjecutivo");
			query.setParameter("correEjecutivo", email);
			ejecutivos = query.getResultList();

			for (Ejecutivos e : ejecutivos) {
				ejecutivo = e;
			}
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
		return ejecutivo;
	}

	@SuppressWarnings("unchecked")
	public Ejecutivos buscarEjecutivoVigentePorLocal(String strDescripcion) {
		Ejecutivos ejecutivo = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Ejecutivos> ejecutivos = new ArrayList<Ejecutivos>();
			Query query = em.createQuery("SELECT e FROM Ejecutivos e WHERE e.locales.nombreLocal = :strLocal");
			query.setParameter("strLocal", strDescripcion);
			ejecutivos = query.getResultList();

			for (Ejecutivos e : ejecutivos) {
				ejecutivo = e;
			}

		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
		return ejecutivo;
	}

	public void saveCliente(Clientesdiario clienteDiario) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.persist(clienteDiario);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	private Clientesdiario clientD(String rut) throws Exception {
		Clientesdiario cliente = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Clientesdiario> clientes = new ArrayList<Clientesdiario>();
			Query query = em.createQuery("SELECT c FROM Clientesdiario c WHERE c.rutCliente = :rutCliente");
			query.setParameter("rutCliente", rut);
			clientes = query.getResultList();

			for (Clientesdiario cd : clientes) {
				cliente = cd;
			}
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}

		return cliente;
	}

	public Clientesdiario getClienteD(String rut) throws Exception {
		return this.clientD(rut);
	}

	public void saveVendedor(Vendedores vendedor) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			em.getTransaction().begin();
			em.persist(vendedor);
			em.getTransaction().commit();
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public Vendedores buscarVendedorPorRut(String rut) throws Exception {
		Vendedores vendedor = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Vendedores> vendedores = new ArrayList<Vendedores>();
			Query query = em.createQuery("SELECT v FROM Vendedores v WHERE v.rutVendedor = :rutVendedor");
			query.setParameter("rutVendedor", rut);
			vendedores = query.getResultList();

			for (Vendedores v : vendedores) {
				vendedor = v;
			}
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}

		return vendedor;
	}

	public Boolean procesoYaEnviadoHoy(Clientesdiario c, Date f) {
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Proceso> procesos = new ArrayList<Proceso>();
			Query query = em.createQuery("SELECT p FROM Proceso p WHERE p.clientesdiario = :clientesdiario AND p.fechaEnvio = :fechaEnvio");
			query.setParameter("clientesdiario", c);
			query.setParameter("fechaEnvio", f);
			procesos = query.getResultList();

			if (procesos.size() > 0) {
				return true;
			}
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}

		return false;
	}

	public String searchBodyIdByCliente(String rut, String email) {
		String id = "";
		EntityManager em = null;
		List<Clientesdiario> clientes = new ArrayList<Clientesdiario>();

		try {
			em = EntityHelper.getInstance().getEntityManager();

			Query query = em.createQuery("SELECT c.idBody FROM Clientesdiario c WHERE c.rutCliente = :rutCliente AND c.emailCliente = :emailCliente");
			query.setParameter("rutCliente", rut);
			query.setParameter("emailCliente", email);
			@SuppressWarnings("rawtypes")
			List list = query.getResultList();
			if (list == null || list.isEmpty()) {
				return "";
			} else {

				id = list.get(0).toString();

				if (id != "") {
					logger.info("SE HA ENCONTRADO CLIENTE: {}", id);
				}
			}
		} catch (Exception e) {
			logger.error("Error en consulta {}", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}

		return id;
	}

	public void runStoredProcedure() {
		EntityManager em = null;
		try {
			logger.info("Ejecutando SP");

			em = EntityHelper.getInstance().getEntityManager();
			String q = "CALL `amicarcotizante2`.`ADD_BODY_MAIL_AMICAR`();";
			Object o = em.createNativeQuery(q).getSingleResult();
			logger.info(o.toString());
			
			// StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("ADD_BODY_MAIL_AMICAR");
			// storedProcedure.execute();

		} catch (Exception e) {
			logger.error("Error en consulta {}", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}
	}

	public Ejecutivos buscarEjecutivoVigentePorRut(String rutEjecutivo) {
		Ejecutivos ejecutivo = null;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Ejecutivos> ejecutivos = new ArrayList<Ejecutivos>();
			Query query = em.createQuery("SELECT e FROM Ejecutivos e WHERE e.rutEjecutivo = :rutEjecutivo");
			query.setParameter("rutEjecutivo", rutEjecutivo);
			ejecutivos = query.getResultList();

			for (Ejecutivos v : ejecutivos) {
				ejecutivo = v;
			}
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}

		return ejecutivo;
    }

	@SuppressWarnings("unchecked")
    public boolean buscarClienteError(String rutCliente) {
		boolean response = false;
		EntityManager em = null;
		try {
			em = EntityHelper.getInstance().getEntityManager();
			List<Correoserrorformato> errores = new ArrayList<Correoserrorformato>();
			Query query = em.createQuery("SELECT c FROM Correoserrorformato c WHERE c.rutCliente = :rutCliente");
			query.setParameter("rutCliente", rutCliente);
			errores = query.getResultList();
			
			if(errores.size() > 0) {
				response = true;
			}
		} catch (Exception e) {
			logger.error("Error en consulta ", e);
		} finally {
			if (em != null && em.isOpen()) {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
				em.close();
			}
		}

		return response;
	    
    }
}
