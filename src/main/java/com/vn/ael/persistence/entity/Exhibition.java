package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the exhibition database table.
 * 
 */
@Entity
@NamedQuery(name="Exhibition.findAll", query="SELECT e FROM Exhibition e")
public class Exhibition extends BasedEntityTracking implements Serializable {
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "cusDept")
	private Configuration cusDept;

	private String demdet;

	private Date devDate;

	@OneToOne
	@JoinColumn(name= "docsgeneral")
	private Docsgeneral docsgeneral;

	private Date endDate;

	private Date eta;

	private Date etd;

	private String exhibitor;

	private String exhPlace;

	private String exName;

	private String location;
	
	private String albwNo;

	private Date openDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "operator")
	private Configuration operator;

	private String poa;

	private String pol;

	private Date tkhqDate;

	private String tkhqNo;
	
	private Integer counting;
	
	@OneToMany(mappedBy = "exhibition", cascade = CascadeType.ALL)
	private List<Exfeetable> exfeetables;
	
	@Transient
	private List<Exfeetable> feeChiHo;
	
	@ManyToOne
	@JoinColumn(name="mode")
	private Configuration mode;
	
	private Date dateRe;
	
	private String accountNo;
	
	private String attn;

	public Exhibition(){
		this.docsgeneral = new Docsgeneral();
	}
	public Integer getCounting() {
		return counting;
	}

	public void setCounting(Integer counting) {
		this.counting = counting;
	}

	@ManyToOne(fetch= FetchType.EAGER)
	@JoinColumn(name = "typeOfEx")
	private Configuration typeOfEx;

	private Boolean doRecDocs;
	
	private Boolean doPrepareDocs;
	
	private Boolean doRequestDocs;
	
	private Boolean doBooking;
	
	private Boolean doTrans;
	
	private Boolean doCus;
	
	private Boolean doPacking;
	
	public Boolean getDoRecDocs() {
		return doRecDocs;
	}

	public void setDoRecDocs(Boolean doRecDocs) {
		this.doRecDocs = doRecDocs;
	}

	public Boolean getDoPrepareDocs() {
		return doPrepareDocs;
	}

	public void setDoPrepareDocs(Boolean doPrepareDocs) {
		this.doPrepareDocs = doPrepareDocs;
	}

	public Boolean getDoRequestDocs() {
		return doRequestDocs;
	}

	public void setDoRequestDocs(Boolean doRequestDocs) {
		this.doRequestDocs = doRequestDocs;
	}

	public Boolean getDoBooking() {
		return doBooking;
	}

	public void setDoBooking(Boolean doBooking) {
		this.doBooking = doBooking;
	}

	public Boolean getDoTrans() {
		return doTrans;
	}

	public void setDoTrans(Boolean doTrans) {
		this.doTrans = doTrans;
	}

	public Boolean getDoCus() {
		return doCus;
	}

	public void setDoCus(Boolean doCus) {
		this.doCus = doCus;
	}

	public Boolean getDoPacking() {
		return doPacking;
	}

	public void setDoPacking(Boolean doPacking) {
		this.doPacking = doPacking;
	}

	public Configuration getCusDept() {
		return this.cusDept;
	}

	public void setCusDept(Configuration cusDept) {
		this.cusDept = cusDept;
	}

	public String getDemdet() {
		return this.demdet;
	}

	public void setDemdet(String demdet) {
		this.demdet = demdet;
	}

	public Date getDevDate() {
		return this.devDate;
	}

	public void setDevDate(Date devDate) {
		this.devDate = devDate;
	}

	public Docsgeneral getDocsgeneral() {
		return this.docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getEta() {
		return this.eta;
	}

	public void setEta(Date eta) {
		this.eta = eta;
	}

	public Date getEtd() {
		return this.etd;
	}

	public void setEtd(Date etd) {
		this.etd = etd;
	}

	public String getExhibitor() {
		return this.exhibitor;
	}

	public void setExhibitor(String exhibitor) {
		this.exhibitor = exhibitor;
	}

	public String getExhPlace() {
		return this.exhPlace;
	}

	public void setExhPlace(String exhPlace) {
		this.exhPlace = exhPlace;
	}

	public String getExName() {
		return this.exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getOpenDate() {
		return this.openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Configuration getOperator() {
		return this.operator;
	}

	public void setOperator(Configuration operator) {
		this.operator = operator;
	}

	public String getPoa() {
		return this.poa;
	}

	public void setPoa(String poa) {
		this.poa = poa;
	}

	public String getPol() {
		return this.pol;
	}

	public void setPol(String pol) {
		this.pol = pol;
	}

	public Date getTkhqDate() {
		return this.tkhqDate;
	}

	public void setTkhqDate(Date tkhqDate) {
		this.tkhqDate = tkhqDate;
	}

	public String getTkhqNo() {
		return this.tkhqNo;
	}

	public void setTkhqNo(String tkhqNo) {
		this.tkhqNo = tkhqNo;
	}

	public Configuration getTypeOfEx() {
		return this.typeOfEx;
	}

	public void setTypeOfEx(Configuration typeOfEx) {
		this.typeOfEx = typeOfEx;
	}

	public String getAlbwNo() {
		return albwNo;
	}

	public void setAlbwNo(String albwNo) {
		this.albwNo = albwNo;
	}
	
	public List<Exfeetable> getExfeetables() {
		return exfeetables;
	}
	
	public void setExfeetables(List<Exfeetable> exfeetables) {
		this.exfeetables = exfeetables;
	}
	
	public Configuration getMode() {
		return mode;
	}
	
	public void setMode(Configuration mode) {
		this.mode = mode;
	}
	
	public String getAccountNo() {
		return accountNo;
	}
	
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAttn() {
		return attn;
	}
	public void setAttn(String attn) {
		this.attn = attn;
	}
	public Date getDateRe() {
		return dateRe;
	}
	public void setDateRe(Date dateRe) {
		this.dateRe = dateRe;
	}
	public List<Exfeetable> getFeeChiHo() {
		return feeChiHo;
	}
	public void setFeeChiHo(List<Exfeetable> feeChiHo) {
		this.feeChiHo = feeChiHo;
	}
}