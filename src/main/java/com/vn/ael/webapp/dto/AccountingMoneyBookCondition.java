package com.vn.ael.webapp.dto;

import java.util.Date;

public class AccountingMoneyBookCondition {
	private Date startDate;
	private Date endDate;
	private Integer typeOfBook;
	private Integer typeOfVoucher;
	private Long bankId;
	/**
	 * @return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}
	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	/**
	 * @return the endDate
	 */
	public Date getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	/**
	 * @return the typeOfBook
	 */
	public Integer getTypeOfBook() {
		return typeOfBook;
	}
	/**
	 * @param typeOfBook the typeOfBook to set
	 */
	public void setTypeOfBook(Integer typeOfBook) {
		this.typeOfBook = typeOfBook;
	}
	/**
	 * @return the typeOfVoucher
	 */
	public Integer getTypeOfVoucher() {
		return typeOfVoucher;
	}
	/**
	 * @param typeOfVoucher the typeOfVoucher to set
	 */
	public void setTypeOfVoucher(Integer typeOfVoucher) {
		this.typeOfVoucher = typeOfVoucher;
	}
	public Long getBankId() {
		return bankId;
	}
	public void setBankId(Long bankId) {
		this.bankId = bankId;
	}

	
}
