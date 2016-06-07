package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;

import java.math.BigInteger;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the contseal database table.
 * 
 */
@Entity
@NamedQuery(name="Contseal.findAll", query="SELECT c FROM Contseal c")
public class Contseal extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String noOfCont;

	private Integer noOfPKGS;

	private String noSeal;
	
	private String depotDev;

	@ManyToOne
	@JoinColumn(name="typeOfCont")
	private Configuration typeOfCont;

	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal weight;

	//bi-directional many-to-one association to Packageinfo
	@ManyToOne
	@JoinColumn(name="docsgeneral")
	private Docsgeneral docsgeneral;
	
	public Contseal() {
	}

	public String getNoOfCont() {
		return this.noOfCont;
	}

	public void setNoOfCont(String noOfCont) {
		this.noOfCont = noOfCont;
	}

	public Integer getNoOfPKGS() {
		return this.noOfPKGS;
	}

	public void setNoOfPKGS(Integer noOfPKGS) {
		this.noOfPKGS = noOfPKGS;
	}

	public String getNoSeal() {
		return this.noSeal;
	}

	public void setNoSeal(String noSeal) {
		this.noSeal = noSeal;
	}

	public Configuration getTypeOfCont() {
		return this.typeOfCont;
	}

	public void setTypeOfCont(Configuration typeOfCont) {
		this.typeOfCont = typeOfCont;
	}

	public BigDecimal getWeight() {
		return this.weight;
	}

	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}

	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public String getDepotDev() {
		return depotDev;
	}

	public void setDepotDev(String depotDev) {
		this.depotDev = depotDev;
	}

}