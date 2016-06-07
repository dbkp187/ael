package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the inland database table.
 * 
 */
@Entity
@NamedQuery(name="Inland.findAll", query="SELECT i FROM Inland i")
public class Inland extends DocsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String nameOfPack;

	private String otherInfo;

	private String refNo;
	
	private Date dateRecPack;
	
	private Date dateDevPack;
	
	private Date dateCutOff;
	
	private Date dateExpired;

	@ManyToOne
	@JoinColumn(name = "typeOfInland")
	private Configuration typeOfInland;

	@OneToOne
	@JoinColumn(name = "docsgeneral")
	private Docsgeneral docsgeneral;
	
	private Boolean isInland;
	
	@ManyToOne
	@JoinColumn(name = "route")
	private Configuration route;

	private Date etd;
	
	private Date eta;
	
	private Integer freeTimeInHCM;
	
	private Integer freeTimeInHP;
	
	private String attachServices;
	
	public Inland() {
		this.docsgeneral= new Docsgeneral();
	}

	public Configuration getTypeOfInland() {
		return this.typeOfInland;
	}

	public void setTypeOfInland(Configuration typeOfInland) {
		this.typeOfInland = typeOfInland;
	}

	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public String getNameOfPack() {
		return nameOfPack;
	}

	public void setNameOfPack(String nameOfPack) {
		this.nameOfPack = nameOfPack;
	}

	public String getOtherInfo() {
		return otherInfo;
	}

	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}

	public String getRefNo() {
		return refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public Date getDateRecPack() {
		return dateRecPack;
	}

	public void setDateRecPack(Date dateRecPack) {
		this.dateRecPack = dateRecPack;
	}

	public Date getDateDevPack() {
		return dateDevPack;
	}

	public void setDateDevPack(Date dateDevPack) {
		this.dateDevPack = dateDevPack;
	}

	public Date getDateCutOff() {
		return dateCutOff;
	}

	public void setDateCutOff(Date dateCutOff) {
		this.dateCutOff = dateCutOff;
	}

	public Date getDateExpired() {
		return dateExpired;
	}

	public void setDateExpired(Date dateExpired) {
		this.dateExpired = dateExpired;
	}

	public Boolean getIsInland() {
		return isInland;
	}

	public void setIsInland(Boolean isInland) {
		this.isInland = isInland;
	}

	public Configuration getRoute() {
		return route;
	}

	public void setRoute(Configuration route) {
		this.route = route;
	}

	public Date getEtd() {
		return etd;
	}

	public void setEtd(Date etd) {
		this.etd = etd;
	}

	public Date getEta() {
		return eta;
	}

	public void setEta(Date eta) {
		this.eta = eta;
	}

	public Integer getFreeTimeInHCM() {
		return freeTimeInHCM;
	}

	public void setFreeTimeInHCM(Integer freeTimeInHCM) {
		this.freeTimeInHCM = freeTimeInHCM;
	}

	public Integer getFreeTimeInHP() {
		return freeTimeInHP;
	}

	public void setFreeTimeInHP(Integer freeTimeInHP) {
		this.freeTimeInHP = freeTimeInHP;
	}

	public String getAttachServices() {
		return attachServices;
	}

	public void setAttachServices(String attachServices) {
		this.attachServices = attachServices;
	}

}