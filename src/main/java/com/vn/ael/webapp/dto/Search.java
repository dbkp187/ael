package com.vn.ael.webapp.dto;

import java.util.Date;

import com.vn.ael.enums.ServicesType;

public class Search {

	private Long customer;
	private Long nhathau;
	private Long typeOfImport;
	private Long typeOfContainer;
	private Boolean doDelivery;
	private Boolean doRelease;
	private Long typeOfEx;
	private Long typeOfDocs;
	private Boolean doAccounting;
	private ServicesType servicesType;
	private Long employee;
	private Date startDate;
	private Date endDate;
	private Date startTimeRefund;
	private Date endTimeRefund;
	private Boolean doApproval;
	private Date startPayDate;
	private Date endPayDate;
	private Boolean checkByAdmin;
	private Boolean approved;
	private Date startSumDate;
	private Date endSumDate;
	private String job = null;
	private Boolean isCollectMoney;
	private Boolean isDuplicated;
	private String cusDecOnNo;
	
	private Boolean hasRecord;
	//Add Phuc 1.8
	private String jobNo;
	/*private String contSeal;*/
	//Add Phuc 1.8
	public Long getCustomer() {
		return customer;
	}
	public void setCustomer(Long customer) {
		this.customer = customer;
	}
	public Long getTypeOfImport() {
		return typeOfImport;
	}
	public void setTypeOfImport(Long typeOfImport) {
		this.typeOfImport = typeOfImport;
	}
	public Long getTypeOfContainer() {
		return typeOfContainer;
	}
	public void setTypeOfContainer(Long typeOfContainer) {
		this.typeOfContainer = typeOfContainer;
	}
	public Boolean getDoDelivery() {
		return doDelivery;
	}
	public void setDoDelivery(Boolean doDelivery) {
		this.doDelivery = doDelivery;
	}
	public Boolean getDoRelease() {
		return doRelease;
	}
	public void setDoRelease(Boolean doRelease) {
		this.doRelease = doRelease;
	}
	public Long getTypeOfEx() {
		return typeOfEx;
	}
	public void setTypeOfEx(Long typeOfEx) {
		this.typeOfEx = typeOfEx;
	}
	public Long getTypeOfDocs() {
		return typeOfDocs;
	}
	public void setTypeOfDocs(Long typeOfDocs) {
		this.typeOfDocs = typeOfDocs;
	}
	public Boolean getDoAccounting() {
		return doAccounting;
	}
	public void setDoAccounting(Boolean doAccounting) {
		this.doAccounting = doAccounting;
	}
	public ServicesType getServicesType() {
		return servicesType;
	}
	public void setServicesType(ServicesType servicesType) {
		this.servicesType = servicesType;
	}
	public Long getEmployee() {
		return employee;
	}
	public void setEmployee(Long employee) {
		this.employee = employee;
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
	public Date getStartTimeRefund() {
		return startTimeRefund;
	}
	public void setStartTimeRefund(Date startTimeRefund) {
		this.startTimeRefund = startTimeRefund;
	}
	public Date getEndTimeRefund() {
		return endTimeRefund;
	}
	public void setEndTimeRefund(Date endTimeRefund) {
		this.endTimeRefund = endTimeRefund;
	}
	public Boolean getDoApproval() {
		return doApproval;
	}
	public void setDoApproval(Boolean doApproval) {
		this.doApproval = doApproval;
	}
	public Date getStartPayDate() {
		return startPayDate;
	}
	public void setStartPayDate(Date startPayDate) {
		this.startPayDate = startPayDate;
	}
	public Date getEndPayDate() {
		return endPayDate;
	}
	public void setEndPayDate(Date endPayDate) {
		this.endPayDate = endPayDate;
	}
	public Boolean getCheckByAdmin() {
		return checkByAdmin;
	}
	public void setCheckByAdmin(Boolean checkByAdmin) {
		this.checkByAdmin = checkByAdmin;
	}
	public Boolean getApproved() {
		return approved;
	}
	public void setApproved(Boolean approved) {
		this.approved = approved;
	}
	public Date getStartSumDate() {
		return startSumDate;
	}
	public void setStartSumDate(Date startSumDate) {
		this.startSumDate = startSumDate;
	}
	public Date getEndSumDate() {
		return endSumDate;
	}
	public void setEndSumDate(Date endSumDate) {
		this.endSumDate = endSumDate;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Boolean getIsCollectMoney() {
		return isCollectMoney;
	}
	public void setIsCollectMoney(Boolean isCollectMoney) {
		this.isCollectMoney = isCollectMoney;
	}
	public Boolean getIsDuplicated() {
		return isDuplicated;
	}
	public void setIsDuplicated(Boolean isDuplicated) {
		this.isDuplicated = isDuplicated;
	}
	public Boolean getHasRecord() {
		return hasRecord;
	}
	public void setHasRecord(Boolean hasRecord) {
		this.hasRecord = hasRecord;
	}	
	//Add Phuc 1.8
	public String getJobNo() {
		return jobNo;
	}
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	/*
	public String getContSeal() {
		return contSeal;
	}
	public void setContSeal(String contSeal) {
		this.contSeal = contSeal;
	}*/	
	//End Add Phuc 1.8
	public Long getNhathau() {
		return nhathau;
	}
	public void setNhathau(Long nhathau) {
		this.nhathau = nhathau;
	}
	public String getCusDecOnNo() {
		return cusDecOnNo;
	}
	public void setCusDecOnNo(String cusDecOnNo) {
		this.cusDecOnNo = cusDecOnNo;
	}
}
