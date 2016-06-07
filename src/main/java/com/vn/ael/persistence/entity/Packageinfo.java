package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.exolab.castor.types.DateTime;


/**
 * The persistent class for the packageinfo database table.
 * 
 */
@Entity
@NamedQuery(name="Packageinfo.findAll", query="SELECT p FROM Packageinfo p")
public class Packageinfo extends DocsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String billOfLading;
	
	private String contNo;

	@ManyToOne
	@JoinColumn(name = "colourApplying")
	private Configuration colourApplying;

	private String consignee;

	private String cusDecOnNo;

	private Date customsDate;

	@ManyToOne
	@JoinColumn(name = "customsDept")
	private Configuration customsDept;

	private Boolean doCheckPack;

	private Boolean doConDec;

	private Boolean doGetDO;

	private Boolean doGetTaxDec;

	private Boolean doPreDecDoc;

	private Boolean doRecFullDocs;

	private Boolean doRecOriginalDocs;

	private Boolean doRegAcc;

	private Boolean doRelease;

	private Boolean doSendDecDraft;
	
	private Date dateRevOrgDoc;
	
	private Date dateRevOrgTax;
	
	private Date dateFinCustom;
	
	private Date dateSend;	
	
	private Date dateActualDev;
	
	private Date dateStartECus;
	
	@ManyToOne
	@JoinColumn(name = "imExMode")
	private Configuration imExMode;

	public Configuration getImExMode() {
		return imExMode;
	}

	public void setImExMode(Configuration imExMode) {
		this.imExMode = imExMode;
	}

	private Date eta;

	private Date etd;
	
	private Date dateSendGood;
	
	private Date dateCloseGood;
	
	private Date closingTime;
	
	@Transient
	private DateTime closingTimeWrapper;
	
	private String closingPlace;
	
	private String bookingNo;

	private Integer freeDemDate;

	private Integer freeDetDate;

	private String invoice;

	private Integer noVehicle;

	private String po;

	private String portOfArrival;

	private String portOfLoading;

	private String shipper;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="typeOfTransport")
	private Configuration typeOfTransport;

	private String wareHouseNo;

	@OneToOne
	@JoinColumn(name = "docsgeneral")
	private Docsgeneral docsgeneral;
	
	public Packageinfo() {
		this.docsgeneral = new Docsgeneral();
	}

	public String getBillOfLading() {
		return this.billOfLading;
	}

	public void setBillOfLading(String billOfLading) {
		this.billOfLading = billOfLading;
	}

	public Configuration getColourApplying() {
		return this.colourApplying;
	}

	public void setColourApplying(Configuration colourApplying) {
		this.colourApplying = colourApplying;
	}

	public String getConsignee() {
		return this.consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getCusDecOnNo() {
		return this.cusDecOnNo;
	}

	public void setCusDecOnNo(String cusDecOnNo) {
		this.cusDecOnNo = cusDecOnNo;
	}

	public Date getCustomsDate() {
		return this.customsDate;
	}

	public void setCustomsDate(Date customsDate) {
		this.customsDate = customsDate;
	}

	public Configuration getCustomsDept() {
		return this.customsDept;
	}

	public void setCustomsDept(Configuration customsDept) {
		this.customsDept = customsDept;
	}

	public Boolean getDoCheckPack() {
		return this.doCheckPack;
	}

	public void setDoCheckPack(Boolean doCheckPack) {
		this.doCheckPack = doCheckPack;
	}

	public Boolean getDoConDec() {
		return this.doConDec;
	}

	public void setDoConDec(Boolean doConDec) {
		this.doConDec = doConDec;
	}

	public Boolean getDoGetDO() {
		return this.doGetDO;
	}

	public void setDoGetDO(Boolean doGetDO) {
		this.doGetDO = doGetDO;
	}

	public Boolean getDoGetTaxDec() {
		return this.doGetTaxDec;
	}

	public void setDoGetTaxDec(Boolean doGetTaxDec) {
		this.doGetTaxDec = doGetTaxDec;
	}

	public Boolean getDoPreDecDoc() {
		return this.doPreDecDoc;
	}

	public void setDoPreDecDoc(Boolean doPreDecDoc) {
		this.doPreDecDoc = doPreDecDoc;
	}

	public Boolean getDoRecFullDocs() {
		return this.doRecFullDocs;
	}

	public void setDoRecFullDocs(Boolean doRecFullDocs) {
		this.doRecFullDocs = doRecFullDocs;
	}

	public Boolean getDoRecOriginalDocs() {
		return this.doRecOriginalDocs;
	}

	public void setDoRecOriginalDocs(Boolean doRecOriginalDocs) {
		this.doRecOriginalDocs = doRecOriginalDocs;
	}

	public Boolean getDoRegAcc() {
		return this.doRegAcc;
	}

	public void setDoRegAcc(Boolean doRegAcc) {
		this.doRegAcc = doRegAcc;
	}

	public Boolean getDoRelease() {
		return this.doRelease;
	}

	public void setDoRelease(Boolean doRelease) {
		this.doRelease = doRelease;
	}

	public Boolean getDoSendDecDraft() {
		return this.doSendDecDraft;
	}

	public void setDoSendDecDraft(Boolean doSendDecDraft) {
		this.doSendDecDraft = doSendDecDraft;
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

	public Integer getFreeDemDate() {
		return this.freeDemDate;
	}

	public void setFreeDemDate(Integer freeDemDate) {
		this.freeDemDate = freeDemDate;
	}

	public Integer getFreeDetDate() {
		return this.freeDetDate;
	}

	public void setFreeDetDate(Integer freeDetDate) {
		this.freeDetDate = freeDetDate;
	}

	public String getInvoice() {
		return this.invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public Integer getNoVehicle() {
		return this.noVehicle;
	}

	public void setNoVehicle(Integer noVehicle) {
		this.noVehicle = noVehicle;
	}

	public String getPo() {
		return this.po;
	}

	public void setPo(String po) {
		this.po = po;
	}

	public String getPortOfArrival() {
		return this.portOfArrival;
	}

	public void setPortOfArrival(String portOfArrival) {
		this.portOfArrival = portOfArrival;
	}

	public String getPortOfLoading() {
		return this.portOfLoading;
	}

	public void setPortOfLoading(String portOfLoading) {
		this.portOfLoading = portOfLoading;
	}

	public String getShipper() {
		return this.shipper;
	}

	public void setShipper(String shipper) {
		this.shipper = shipper;
	}

	public Configuration getTypeOfTransport() {
		return this.typeOfTransport;
	}

	public void setTypeOfTransport(Configuration typeOfTransport) {
		this.typeOfTransport = typeOfTransport;
	}

	public String getWareHouseNo() {
		return this.wareHouseNo;
	}

	public void setWareHouseNo(String wareHouseNo) {
		this.wareHouseNo = wareHouseNo;
	}
	
	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public Date getDateSendGood() {
		return dateSendGood;
	}

	public void setDateSendGood(Date dateSendGood) {
		this.dateSendGood = dateSendGood;
	}

	public Date getDateCloseGood() {
		return dateCloseGood;
	}

	public void setDateCloseGood(Date dateCloseGood) {
		this.dateCloseGood = dateCloseGood;
	}

	public Date getClosingTime() {
		return closingTime;
	}

	public void setClosingTime(Date closingTime) {
		this.closingTime = closingTime;
		this.closingTimeWrapper = new DateTime(closingTime);
	}
	

	public DateTime getClosingTimeWrapper() {
		if (this.closingTimeWrapper == null && this.closingTime != null){
			this.closingTimeWrapper = new DateTime(this.closingTime);
		}
		return closingTimeWrapper;
	}

	public void setClosingTimeWrapper(DateTime closingTimeWrapper) {
		this.closingTimeWrapper = closingTimeWrapper;
		this.closingTime = closingTimeWrapper == null ? null : closingTimeWrapper.toDate();
	}

	public String getClosingPlace() {
		return closingPlace;
	}

	public void setClosingPlace(String closingPlace) {
		this.closingPlace = closingPlace;
	}

	public String getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(String bookingNo) {
		this.bookingNo = bookingNo;
	}

	public String getContNo() {
		return contNo;
	}

	public void setContNo(String contNo) {
		this.contNo = contNo;
	}

	public Date getDateRevOrgDoc() {
		return dateRevOrgDoc;
	}

	public void setDateRevOrgDoc(Date dateRevOrgDoc) {
		this.dateRevOrgDoc = dateRevOrgDoc;
	}

	public Date getDateRevOrgTax() {
		return dateRevOrgTax;
	}

	public void setDateRevOrgTax(Date dateRevOrgTax) {
		this.dateRevOrgTax = dateRevOrgTax;
	}

	public Date getDateFinCustom() {
		return dateFinCustom;
	}

	public void setDateFinCustom(Date dateFinCustom) {
		this.dateFinCustom = dateFinCustom;
	}

	public Date getDateSend() {
		return dateSend;
	}

	public void setDateSend(Date dateSend) {
		this.dateSend = dateSend;
	}

	public Date getDateActualDev() {
		return dateActualDev;
	}

	public void setDateActualDev(Date dateActualDev) {
		this.dateActualDev = dateActualDev;
	}

	public Date getDateStartECus() {
		return dateStartECus;
	}

	public void setDateStartECus(Date dateStartECus) {
		this.dateStartECus = dateStartECus;
	}
	
}
