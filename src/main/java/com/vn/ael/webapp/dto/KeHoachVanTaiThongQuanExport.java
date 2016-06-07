package com.vn.ael.webapp.dto;

import java.util.Date;

public class KeHoachVanTaiThongQuanExport extends KeHoachVanTaiExport{
	
	private String shipper;
	private String importType;
	private String bill;
	private String pks;
	private String weight;
	private String freeTime;
	private Date cusDate;
	private String sotkhq;
	private Integer index;
	public String getShipper() {
		return shipper;
	}
	public void setShipper(String shipper) {
		this.shipper = shipper;
	}
	public String getImportType() {
		return importType;
	}
	public void setImportType(String importType) {
		this.importType = importType;
	}
	public String getBill() {
		return bill;
	}
	public void setBill(String bill) {
		this.bill = bill;
	}
	public String getPks() {
		return pks;
	}
	public void setPks(String pks) {
		this.pks = pks;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getFreeTime() {
		return freeTime;
	}
	public void setFreeTime(String freeTime) {
		this.freeTime = freeTime;
	}
	public Date getCusDate() {
		return cusDate;
	}
	public void setCusDate(Date cusDate) {
		this.cusDate = cusDate;
	}
	public String getSotkhq() {
		return sotkhq;
	}
	public void setSotkhq(String sotkhq) {
		this.sotkhq = sotkhq;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
}
