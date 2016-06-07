package com.vn.ael.webapp.dto;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class AccountingNhathauExport {
	private String jobNo;
	private Date dateDev;
	private String cusName;
	private String contNo;
	private String importType;
	private String placeGetCont;
	private String placePutCont;
	private String cont20;
	private String cont40;
	private String contO;
	private String departure;
	private String arrival;
	private BigDecimal phuthu;
	private Integer index;
	private List<FeeExportItem> convertedFee;
	private BigDecimal total;
	
	public String getJobNo() {
		return jobNo;
	}
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	public Date getDateDev() {
		return dateDev;
	}
	public void setDateDev(Date dateDev) {
		this.dateDev = dateDev;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getContNo() {
		return contNo;
	}
	public void setContNo(String contNo) {
		this.contNo = contNo;
	}
	public String getImportType() {
		return importType;
	}
	public void setImportType(String importType) {
		this.importType = importType;
	}
	public String getPlaceGetCont() {
		return placeGetCont;
	}
	public void setPlaceGetCont(String placeGetCont) {
		this.placeGetCont = placeGetCont;
	}
	public String getPlacePutCont() {
		return placePutCont;
	}
	public void setPlacePutCont(String placePutCont) {
		this.placePutCont = placePutCont;
	}
	public String getCont20() {
		return cont20;
	}
	public void setCont20(String cont20) {
		this.cont20 = cont20;
	}
	public String getCont40() {
		return cont40;
	}
	public void setCont40(String cont40) {
		this.cont40 = cont40;
	}
	public String getContO() {
		return contO;
	}
	public void setContO(String contO) {
		this.contO = contO;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	public BigDecimal getPhuthu() {
		return phuthu;
	}
	public void setPhuthu(BigDecimal phuthu) {
		this.phuthu = phuthu;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public List<FeeExportItem> getConvertedFee() {
		return convertedFee;
	}
	public void setConvertedFee(List<FeeExportItem> convertedFee) {
		this.convertedFee = convertedFee;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	
}
