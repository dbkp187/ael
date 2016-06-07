/**
 * 
 */
package com.vn.ael.webapp.dto;

import java.math.BigDecimal;

/**
 * @author hiendn1992
 *
 */
public class AdvanceSumary {
	private Long id;
	private String employeeName;
	private BigDecimal totalAdvanceBefore;
	private BigDecimal totalRefundBefore;
	private BigDecimal totalAdvanceBetween;
	private BigDecimal totalRefundBetween;
	private BigDecimal totalAdvanceAfter;
	private BigDecimal totalRefundAfter;
	/**
	 * @return the employeeName
	 */
	public String getEmployeeName() {
		return employeeName;
	}
	/**
	 * @param employeeName the employeeName to set
	 */
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	/**
	 * @return the totalAdvanceBefore
	 */
	public BigDecimal getTotalAdvanceBefore() {
		return totalAdvanceBefore;
	}
	/**
	 * @param totalAdvanceBefore the totalAdvanceBefore to set
	 */
	public void setTotalAdvanceBefore(BigDecimal totalAdvanceBefore) {
		this.totalAdvanceBefore = totalAdvanceBefore;
	}
	/**
	 * @return the totalRefundBefore
	 */
	public BigDecimal getTotalRefundBefore() {
		return totalRefundBefore;
	}
	/**
	 * @param totalRefundBefore the totalRefundBefore to set
	 */
	public void setTotalRefundBefore(BigDecimal totalRefundBefore) {
		this.totalRefundBefore = totalRefundBefore;
	}
	/**
	 * @return the totalAdvanceBetween
	 */
	public BigDecimal getTotalAdvanceBetween() {
		return totalAdvanceBetween;
	}
	/**
	 * @param totalAdvanceBetween the totalAdvanceBetween to set
	 */
	public void setTotalAdvanceBetween(BigDecimal totalAdvanceBetween) {
		this.totalAdvanceBetween = totalAdvanceBetween;
	}
	/**
	 * @return the totalRefundBetween
	 */
	public BigDecimal getTotalRefundBetween() {
		return totalRefundBetween;
	}
	/**
	 * @param totalRefundBetween the totalRefundBetween to set
	 */
	public void setTotalRefundBetween(BigDecimal totalRefundBetween) {
		this.totalRefundBetween = totalRefundBetween;
	}
	/**
	 * @return the totalAdvanceAfter
	 */
	public BigDecimal getTotalAdvanceAfter() {
		return totalAdvanceAfter;
	}
	/**
	 * @param totalAdvanceAfter the totalAdvanceAfter to set
	 */
	public void setTotalAdvanceAfter(BigDecimal totalAdvanceAfter) {
		this.totalAdvanceAfter = totalAdvanceAfter;
	}
	/**
	 * @return the totalRefundAfter
	 */
	public BigDecimal getTotalRefundAfter() {
		return totalRefundAfter;
	}
	/**
	 * @param totalRefundAfter the totalRefundAfter to set
	 */
	public void setTotalRefundAfter(BigDecimal totalRefundAfter) {
		this.totalRefundAfter = totalRefundAfter;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @param employeeName
	 * @param totalAdvanceBefore
	 * @param totalRefundBefore
	 * @param totalAdvanceBetween
	 * @param totalRefundBetween
	 * @param totalAdvanceAfter
	 * @param totalRefundAfter
	 */
	public AdvanceSumary(Long id, String employeeName, BigDecimal totalAdvanceBefore,
			BigDecimal totalRefundBefore, BigDecimal totalAdvanceBetween,
			BigDecimal totalRefundBetween, BigDecimal totalAdvanceAfter,
			BigDecimal totalRefundAfter) {
		super();
		this.id = id;
		this.employeeName = employeeName;
		this.totalAdvanceBefore = totalAdvanceBefore;
		this.totalRefundBefore = totalRefundBefore;
		this.totalAdvanceBetween = totalAdvanceBetween;
		this.totalRefundBetween = totalRefundBetween;
		this.totalAdvanceAfter = totalAdvanceAfter;
		this.totalRefundAfter = totalRefundAfter;
	}
	
}
