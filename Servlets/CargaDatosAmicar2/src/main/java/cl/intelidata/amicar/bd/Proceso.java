package cl.intelidata.amicar.bd;

import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Proceso entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "proceso", catalog = "amicarcotizante2")
public class Proceso extends AbstractProceso implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Proceso() {
	}

	/** minimal constructor */
	public Proceso(Ejecutivos ejecutivos, Clientesdiario clientediarios, Vendedores vendedores) {
		super(ejecutivos, clientediarios, vendedores);
	}

	/** full constructor */
	public Proceso(Ejecutivos ejecutivos, Clientesdiario clientes, Vendedores vendedores, Timestamp fechaEnvio, Timestamp fechaAperturaMail, Timestamp fechaClickLink) {
		super(ejecutivos, clientes, vendedores, fechaEnvio, fechaAperturaMail, fechaClickLink);
	}

}
