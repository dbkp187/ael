/**
 * 
 */
package com.vn.ael.webapp.dto;

import java.math.BigDecimal;

/**
 * @author hiendn1992
 *
 */
public class AccountingExhibitionItemExport {
	private String description;
	private String rate;
	private BigDecimal amount;
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
	 * @return the rate
	 */
	public String getRate() {
		return rate;
	}
	/**
	 * @param rate the rate to set
	 */
	public void setRate(String rate) {
		this.rate = rate;
	}
	/**
	 * @return the amount
	 */
	public BigDecimal getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	/**
	 * @param description
	 * @param type
	 * @param rate
	 * @param amount
	 */
	public AccountingExhibitionItemExport(String description,
			String rate, BigDecimal amount) {
		super();
		this.description = description;
		this.rate = rate;
		this.amount = amount;
	}
}
