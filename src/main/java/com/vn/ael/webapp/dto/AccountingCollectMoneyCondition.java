package com.vn.ael.webapp.dto;

import java.util.Date;

public class AccountingCollectMoneyCondition {

	private Long typeOfDocs;
	private String job = null;
	private Long customer;
	private Integer collectMoneyStatus;
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
	 * @return the collectMoneyStatus
	 */
	public Integer getCollectMoneyStatus() {
		return collectMoneyStatus;
	}
	/**
	 * @param collectMoneyStatus the collectMoneyStatus to set
	 */
	public void setCollectMoneyStatus(Integer collectMoneyStatus) {
		this.collectMoneyStatus = collectMoneyStatus;
	}
	public Long getCustomer() {
		return customer;
	}
	public void setCustomer(Long customer) {
		this.customer = customer;
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
