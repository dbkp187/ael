/**
 * 
 */
package com.vn.ael.webapp.dto;

import java.math.BigDecimal;

/**
 * @author hiendn1992
 *
 */
public class AdvanceRequestItem {
	private Integer index;
	private String jobNo;
	private String packageDetail;
	private String advanceReason;
	private BigDecimal amount;
	private BigDecimal remainAdvance;
	/**
	 * @return the jobNo
	 */
	public String getJobNo() {
		return jobNo;
	}
	/**
	 * @param jobNo the jobNo to set
	 */
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	/**
	 * @return the packageDetail
	 */
	public String getPackageDetail() {
		return packageDetail;
	}
	/**
	 * @param packageDetail the packageDetail to set
	 */
	public void setPackageDetail(String packageDetail) {
		this.packageDetail = packageDetail;
	}
	/**
	 * @return the advanceReason
	 */
	public String getAdvanceReason() {
		return advanceReason;
	}
	/**
	 * @param advanceReason the advanceReason to set
	 */
	public void setAdvanceReason(String advanceReason) {
		this.advanceReason = advanceReason;
	}
	/**
	 * @return the index
	 */
	public Integer getIndex() {
		return index;
	}
	/**
	 * @param index the index to set
	 */
	public void setIndex(Integer index) {
		this.index = index;
	}
	/**
	 * @param jobNo
	 * @param packageDetail
	 * @param advanceReason
	 * @param amount
	 * @param remainAdvance
	 */
	public AdvanceRequestItem(Integer index, String jobNo, String packageDetail,
			String advanceReason, BigDecimal amount, BigDecimal remainAdvance) {
		super();
		this.index = index;
		this.jobNo = jobNo;
		this.packageDetail = packageDetail;
		this.advanceReason = advanceReason;
		this.amount = amount;
		this.remainAdvance = remainAdvance;
	}
	public AdvanceRequestItem() {
		// TODO Auto-generated constructor stub
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getRemainAdvance() {
		return remainAdvance;
	}
	public void setRemainAdvance(BigDecimal remainAdvance) {
		this.remainAdvance = remainAdvance;
	}

}
