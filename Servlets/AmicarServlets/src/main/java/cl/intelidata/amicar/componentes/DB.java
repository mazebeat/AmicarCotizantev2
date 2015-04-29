package cl.intelidata.amicar.componentes;

import javax.persistence.EntityManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cl.intelidata.amicar.conf.EntityHelper;
import cl.intelidata.amicar.db.Clientes;
import cl.intelidata.amicar.db.Proceso;
import cl.intelidata.amicar.util.Tools;

/**
 *
 * @author Maze
 */
public class DB {

    /**
     *
     */
    public static Logger logger = LoggerFactory.getLogger(DB.class);

    /**
     * EXAMPLE
     * <p>
     * EntityManager em = null; try { em =
     * EntityHelper.getInstance().getEntityManager(); // Toda la consulta aca
     * Clientes c = em.find(Clientes.class, 1);
     * System.out.println(c.getFonoParticular());
     * <p>
     * } catch (Exception e) { throw new Exception("Error en consulta ", e); }
     * finally { //necesario para cada consulta si queda abierto consume una *
     * conexion a la bd if (em != null && em.isOpen()) { if
     * (em.getTransaction().isActive()) { em.getTransaction().rollback(); }
     * em.close(); } }
     * <p>
     * @param args
     */
    public static void main(String... args) {
    }

    private Proceso process(Integer iProcesoID) throws Exception {
        Proceso proceso = null;
        EntityManager em = null;

        try {
            em = EntityHelper.getInstance().getEntityManager();
            proceso = em.find(Proceso.class, iProcesoID);
//            List<Proceso> procesos = new ArrayList<Proceso>();
//            Query query = em.createQuery("SELECT p FROM Proceso p WHERE p.idProceso = :idProceso");
//            query.setParameter("idProceso", iProcesoID);
//            procesos = query.getResultList();
//
//            for (Proceso p : procesos) {
//                proceso = p;
//            }

        } catch (Exception e) {
            throw new Exception("Error en consulta ", e);
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

    private void updateProcess(Proceso process, char what) throws Exception {
        EntityManager em = null;

        try {
            em = EntityHelper.getInstance().getEntityManager();
            em.getTransaction().begin();

            switch (what) {
                case 'c':
                    if (process.getFechaClickLink() != null) {
                        logger.warn("CORREO YA CONTIENE CLICK {}", process);
                    } else {
                        process.setFechaClickLink(Tools.nowDate());
                    }
                    break;
                case 'r':
                    if (process.getFechaAperturaMail() != null) {
                        logger.warn("CORREO YA LEIDO {}", process);
                    } else {
                        process.setFechaAperturaMail(Tools.nowDate());
                    }
                    break;
            }

            em.merge(process);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new Exception("ERROR: CONSULTA DB ", e);
        } finally {
            if (em != null && em.isOpen()) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                em.close();
            }
        }
    }

    private Clientes client(Integer iClienteID) throws Exception {
        Clientes cliente = null;
        EntityManager em = null;
        try {
            em = EntityHelper.getInstance().getEntityManager();
            cliente
                    = em.find(Clientes.class, iClienteID);
        } catch (Exception e) {
            throw new Exception("Error en consulta ", e);
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

    private void updateClient(Clientes client) throws Exception {
        EntityManager em = null;

        try {
            em = EntityHelper.getInstance().getEntityManager();
            em.getTransaction().begin();
            client.setDesinscrito(true);
            em.merge(client);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new Exception("Error en consulta ", e);
        } finally {
            if (em != null && em.isOpen()) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                em.close();
            }
        }
    }

    /**
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Clientes getCliente(Integer id) throws Exception {
        return this.client(id);
    }

    /**
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Proceso getProceso(Integer id) throws Exception {
        return this.process(id);
    }

    /**
     * Actualiza proceso
     * <p>
     * @param proceso
     * @param queFecha char Puede ser r para actualizar fecha lectura o c para
     * la fecha click
     * @throws Exception
     */
    public void actualizarProceso(Proceso proceso, char queFecha) throws Exception {
        this.updateProcess(proceso, queFecha);
    }

    /**
     *
     * @param cliente
     * @throws Exception
     */
    public void actualizarCliente(Clientes cliente) throws Exception {
        this.updateClient(cliente);
    }
}
