package com.vn.ael.webapp.dto;

import java.util.Date;

public class AccountingContractorPaymentCondition {

	private Long typeOfDocs;
	private String job = null;
	private Long nhathauId;
	private Integer payMoneyStatus;
	private Date startDate;
	private Date endDate;
	
	/**
	 * @return the typeOfDocs
	 */
	public Long getTypeOfDocs() {
		return typeOfDocs;
	}
	/**
	 * @param typeOfDocs the typeOfDocs to set
	 */
	public void setTypeOfDocs(Long typeOfDocs) {
		this.typeOfDocs = typeOfDocs;
	}
	/**
	 * @return the job
	 */
	public String getJob() {
		return job;
	}
	/**
	 * @param job the job to set
	 */
	public void setJob(String job) {
		this.job = job;
	}
	/**
	 * @return the payMoneyStatus
	 */
	public Integer getPayMoneyStatus() {
		return payMoneyStatus;
	}
	/**
	 * @param payMoneyStatus the payMoneyStatus to set
	 */
	public void setPayMoneyStatus(Integer payMoneyStatus) {
		this.payMoneyStatus = payMoneyStatus;
	}
	
	public Long getNhathauId() {
		return nhathauId;
	}
	public void setNhathauId(Long nhathauId) {
		this.nhathauId = nhathauId;
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
	
	
}
