package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.math.BigInteger;
import java.util.Date;


/**
 * The persistent class for the docservices database table.
 * 
 */
@Entity
@Table(name="docservices")
@NamedQuery(name="Docservice.findAll", query="SELECT d FROM Docservice d")
public class Docservice extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "nameOfServices")
	private Configuration nameOfServices;

	private Date regDate;

	private Date revDate;
	
	private String regNo;
	
	private Date getDate;
	
	private String typeCO;
	
	@ManyToOne
	@JoinColumn(name = "docsgeneral")
	private Docsgeneral docsgeneral;

	@Transient
	private Boolean isAdded = false;
	
	@Transient
	private Boolean isDeleted = false;

	
	public Docservice() {
	}

	public Configuration getNameOfServices() {
		return this.nameOfServices;
	}

	public void setNameOfServices(Configuration nameOfServices) {
		this.nameOfServices = nameOfServices;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getRevDate() {
		return this.revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public Date getGetDate() {
		return getDate;
	}

	public void setGetDate(Date getDate) {
		this.getDate = getDate;
	}

	public String getTypeCO() {
		return typeCO;
	}

	public void setTypeCO(String typeCO) {
		this.typeCO = typeCO;
	}

	public Boolean getIsAdded() {
		return isAdded;
	}

	public void setIsAdded(Boolean isAdded) {
		this.isAdded = isAdded;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
}