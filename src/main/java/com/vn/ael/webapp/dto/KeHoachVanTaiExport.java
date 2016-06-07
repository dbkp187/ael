package com.vn.ael.webapp.dto;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class KeHoachVanTaiExport {
	private String jobNo;
	private Date dateDev;
	private String cusName;
	private String contNo;
	private String cont20;
	private String cont40;
	private String contO;
	private String departure;
	private String arrival;
	private BigDecimal total;
	private String nhathau;
	private String shipName;
	private Date etd;
	private Date eta;
	private String contL;
	private Date docReceiveDate;
	private List<FeeExportItem> convertedFee;
	
	
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
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public String getNhathau() {
		return nhathau;
	}
	public void setNhathau(String nhathau) {
		this.nhathau = nhathau;
	}
	public String getShipName() {
		return shipName;
	}
	public void setShipName(String shipName) {
		this.shipName = shipName;
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
	public String getContL() {
		return contL;
	}
	public void setContL(String contL) {
		this.contL = contL;
	}
	public Date getDocReceiveDate() {
		return docReceiveDate;
	}
	public void setDocReceiveDate(Date docReceiveDate) {
		this.docReceiveDate = docReceiveDate;
	}
	public List<FeeExportItem> getConvertedFee() {
		return convertedFee;
	}
	public void setConvertedFee(List<FeeExportItem> convertedFee) {
		this.convertedFee = convertedFee;
	}
	
}
