package com.vn.ael.webapp.dto;

import java.util.Date;
import java.util.List;

public class AccountingTransCondition {
	
	Long customerId;
	Integer month;
	Integer year;
	Date startDate;
	Date endDate;
	Long nhathauId;
	Long transId;
	String job = null;
	Long typeOfImport;
	String consignee;
	String shipper;
	Long typeOfDocs;
	List<Long> jobList;
	
	
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Long getNhathauId() {
		return nhathauId;
	}
	public void setNhathauId(Long nhathauId) {
		this.nhathauId = nhathauId;
	}
	public Long getTransId() {
		return transId;
	}
	public void setTransId(Long transId) {
		this.transId = transId;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Long getTypeOfImport() {
		return typeOfImport;
	}
	public void setTypeOfImport(Long typeOfImport) {
		this.typeOfImport = typeOfImport;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getShipper() {
		return shipper;
	}
	public void setShipper(String shipper) {
		this.shipper = shipper;
	}
	public Long getTypeOfDocs() {
		return typeOfDocs;
	}
	public void setTypeOfDocs(Long typeOfDocs) {
		this.typeOfDocs = typeOfDocs;
	}
	public List<Long> getJobList() {
		return this.jobList;
	}
	public void setJobList(List<Long> jobList) {
		this.jobList = jobList;
	}

}
