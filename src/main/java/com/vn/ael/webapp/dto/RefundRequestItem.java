/**
 * 
 */
package com.vn.ael.webapp.dto;

import java.math.BigDecimal;

/**
 * @author hiendn1992
 *
 */
public class RefundRequestItem {
	private int index;
	private String fileCus;
	private String description;
	private BigDecimal amount;
	private BigDecimal oAmount;
	private String cont;
	/**
	 * @param index
	 * @param fileCus
	 * @param description
	 * @param amount
	 * @param oAmount
	 */
	public RefundRequestItem(int index, String fileCus, String description,
			BigDecimal amount, BigDecimal oAmount) {
		super();
		this.index = index;
		this.fileCus = fileCus;
		this.description = description;
		this.amount = amount;
		this.oAmount = oAmount;
	}
	public RefundRequestItem() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the index
	 */
	public int getIndex() {
		return index;
	}
	/**
	 * @param index the index to set
	 */
	public void setIndex(int index) {
		this.index = index;
	}
	/**
	 * @return the fileCus
	 */
	public String getFileCus() {
		return fileCus;
	}
	/**
	 * @param fileCus the fileCus to set
	 */
	public void setFileCus(String fileCus) {
		this.fileCus = fileCus;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the cont
	 */
	public String getCont() {
		return cont;
	}
	/**
	 * @param cont the cont to set
	 */
	public void setCont(String cont) {
		this.cont = cont;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getoAmount() {
		return oAmount;
	}
	public void setoAmount(BigDecimal oAmount) {
		this.oAmount = oAmount;
	}
	
	
}
