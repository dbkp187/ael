package com.vn.ael.webapp.dto;

import java.math.BigDecimal;
import java.util.List;

public class AccountingTransportExport {
	private Long jobId;
	private String jobNo;
	private String dateDev;
	private String placeRev1;
	private String placeDelivery1;
	private Integer noOf20Cont;
	private Integer noOf40Cont;
	private Integer noOfOthCont;
	private String isLCL;
	private String vehicleNo;
	private String noOfCont;
	private String volumn;
	private String kg;
	private String placegetcont;
	private String placeputcont;
	private BigDecimal chiho;
	private BigDecimal accountingPrice;
	private BigDecimal vat;
	private BigDecimal vatAmount;
	private String note;
	private BigDecimal total;
	private Integer index;
	private BigDecimal feeWithVat;
	private String invoiceTruck = "";
	private String invoiceMani = "";
	private BigDecimal otherFee;
	private List<FeeExportItem> convertedFeeThu;
	
	private BigDecimal aelTotal;
	/**
	 * @return the jobId
	 */
	public Long getJobId() {
		return jobId;
	}
	/**
	 * @param jobId the jobId to set
	 */
	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}
	/**
	 * @return the noOfOthCont
	 */
	public Integer getNoOfOthCont() {
		return noOfOthCont;
	}
	/**
	 * @param noOfOthCont the noOfOthCont to set
	 */
	public void setNoOfOthCont(Integer noOfOthCont) {
		this.noOfOthCont = noOfOthCont;
	}
	/**
	 * @param noOf20Cont the noOf20Cont to set
	 */
	public void setNoOf20Cont(Integer noOf20Cont) {
		this.noOf20Cont = noOf20Cont;
	}
	/**
	 * @param noOf40Cont the noOf40Cont to set
	 */
	public void setNoOf40Cont(Integer noOf40Cont) {
		this.noOf40Cont = noOf40Cont;
	}
	/**
	 * @param noOfCont the noOfCont to set
	 */
	public void setNoOfCont(String noOfCont) {
		this.noOfCont = noOfCont;
	}
	/**
	 * @param string the volumn to set
	 */
	public void setVolumn(String string) {
		this.volumn = string;
	}
	/**
	 * @param kg the kg to set
	 */
	public void setKg(String kg) {
		this.kg = kg;
	}
	/**
	 * @param string the chiho to set
	 */
	public void setChiho(BigDecimal string) {
		this.chiho = string;
	}
	/**
	 * @param accountingPrice the accountingPrice to set
	 */
	public void setAccountingPrice(BigDecimal accountingPrice) {
		this.accountingPrice = accountingPrice;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	/**
	 * @return the jobNo
	 */
	public String getJobNo() {
		return jobNo;
	}
	/**
	 * @param jobNo the jobNo to set
	 */
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	/**
	 * @return the dateDev
	 */
	public String getDateDev() {
		return dateDev;
	}
	/**
	 * @param dateDev the dateDev to set
	 */
	public void setDateDev(String dateDev) {
		this.dateDev = dateDev;
	}
	/**
	 * @return the placeRev1
	 */
	public String getPlaceRev1() {
		return placeRev1;
	}
	/**
	 * @param placeRev1 the placeRev1 to set
	 */
	public void setPlaceRev1(String placeRev1) {
		this.placeRev1 = placeRev1;
	}
	/**
	 * @return the placeDelivery1
	 */
	public String getPlaceDelivery1() {
		return placeDelivery1;
	}
	/**
	 * @param placeDelivery1 the placeDelivery1 to set
	 */
	public void setPlaceDelivery1(String placeDelivery1) {
		this.placeDelivery1 = placeDelivery1;
	}
	/**
	 * @return the noOf20Cont
	 */
	public Integer getNoOf20Cont() {
		return noOf20Cont;
	}
	/**
	 * @return the noOf40Cont
	 */
	public Integer getNoOf40Cont() {
		return noOf40Cont;
	}
	
	/**
	 * @return the isLCL
	 */
	public String getIsLCL() {
		return isLCL;
	}
	/**
	 * @param isLCL the isLCL to set
	 */
	public void setIsLCL(String isLCL) {
		this.isLCL = isLCL;
	}
	/**
	 * @return the vehicleNo
	 */
	public String getVehicleNo() {
		return vehicleNo;
	}
	/**
	 * @param vehicleNo the vehicleNo to set
	 */
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	/**
	 * @return the noOfCont
	 */
	public String getNoOfCont() {
		return noOfCont;
	}
	
	/**
	 * @return the volumn
	 */
	public String getVolumn() {
		return volumn;
	}
	
	/**
	 * @return the kg
	 */
	public String getKg() {
		return kg;
	}
	/**
	 * @return the placegetcont
	 */
	public String getPlacegetcont() {
		return placegetcont;
	}
	/**
	 * @param placegetcont the placegetcont to set
	 */
	public void setPlacegetcont(String placegetcont) {
		this.placegetcont = placegetcont;
	}
	/**
	 * @return the placeputcont
	 */
	public String getPlaceputcont() {
		return placeputcont;
	}
	/**
	 * @param placeputcont the placeputcont to set
	 */
	public void setPlaceputcont(String placeputcont) {
		this.placeputcont = placeputcont;
	}
	/**
	 * @return the chiho
	 */
	public BigDecimal getChiho() {
		return chiho;
	}
	
	/**
	 * @return the accountingPrice
	 */
	public BigDecimal getAccountingPrice() {
		return accountingPrice;
	}
	
	/**
	 * @return the total
	 */
	public BigDecimal getTotal() {
		return total;
	}
	
	/**
	 * @param jobNo
	 * @param dateDev
	 * @param placeRev1
	 * @param placeDelivery1
	 * @param noOf20Cont
	 * @param noOf40Cont
	 * @param isLCL
	 * @param vehicleNo
	 * @param noOfCont
	 * @param volumn
	 * @param kg
	 * @param placegetcont
	 * @param placeputcont
	 * @param chiho
	 * @param accountingPrice
	 * @param otherfee
	 * @param total
	 */
	public AccountingTransportExport(String jobNo, String dateDev,
			String placeRev1, String placeDelivery1, Integer noOf20Cont,
			Integer noOf40Cont, String isLCL, String vehicleNo, String noOfCont,
			String volumn, String kg, String placegetcont, String placeputcont,
			BigDecimal chiho, BigDecimal accountingPrice, BigDecimal otherfee, BigDecimal total) {
		super();
		this.jobNo = jobNo;
		this.dateDev = dateDev;
		this.placeRev1 = placeRev1;
		this.placeDelivery1 = placeDelivery1;
		this.noOf20Cont = noOf20Cont;
		this.noOf40Cont = noOf40Cont;
		this.isLCL = isLCL;
		this.vehicleNo = vehicleNo;
		this.noOfCont = noOfCont;
		this.volumn = volumn;
		this.kg = kg;
		this.placegetcont = placegetcont;
		this.placeputcont = placeputcont;
		this.chiho = chiho;
		this.accountingPrice = accountingPrice;
		this.total = total;
	}
	public AccountingTransportExport() {
		// TODO Auto-generated constructor stub
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public BigDecimal getVat() {
		return vat;
	}
	public void setVat(BigDecimal vat) {
		this.vat = vat;
	}
	public BigDecimal getVatAmount() {
		return vatAmount;
	}
	public void setVatAmount(BigDecimal vatAmount) {
		this.vatAmount = vatAmount;
	}
	public List<FeeExportItem> getConvertedFeeThu() {
		return convertedFeeThu;
	}
	public void setConvertedFeeThu(List<FeeExportItem> convertedFeeThu) {
		this.convertedFeeThu = convertedFeeThu;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public BigDecimal getFeeWithVat() {
		return feeWithVat;
	}
	public void setFeeWithVat(BigDecimal feeWithVat) {
		this.feeWithVat = feeWithVat;
	}
	public String getInvoiceTruck() {
		return invoiceTruck;
	}
	public void setInvoiceTruck(String invoiceTruck) {
		this.invoiceTruck = invoiceTruck;
	}
	public String getInvoiceMani() {
		return invoiceMani;
	}
	public void setInvoiceMani(String invoiceMani) {
		this.invoiceMani = invoiceMani;
	}
	public BigDecimal getOtherFee() {
		return otherFee;
	}
	public void setOtherFee(BigDecimal otherFee) {
		this.otherFee = otherFee;
	}
	public BigDecimal getAelTotal() {
		return aelTotal;
	}
	public void setAelTotal(BigDecimal aelTotal) {
		this.aelTotal = aelTotal;
	}
}
