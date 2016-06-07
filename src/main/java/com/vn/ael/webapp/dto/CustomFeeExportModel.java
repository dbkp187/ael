/**
 * 
 */
package com.vn.ael.webapp.dto;

import java.math.BigDecimal;

/**
 * @author hiendn1992
 *
 */
public class CustomFeeExportModel {
	private String feeName;
	private String feeDescription;
	private Integer numOf20;
	private Integer numOf40;
	private Integer numOfOther;
	private Integer numOfLCL;
	private BigDecimal total;
	private BigDecimal vat;
	private BigDecimal feevat;
	private BigDecimal feewithvat;
	private String note;
	private String invoice;
	private Integer index;
	private BigDecimal unitPrice;
	/**
	 * @return the feeName
	 */
	public String getFeeName() {
		return feeName;
	}
	/**
	 * @param feeName the feeName to set
	 */
	public void setFeeName(String feeName) {
		this.feeName = feeName;
	}
	/**
	 * @return the feeDescription
	 */
	public String getFeeDescription() {
		return feeDescription;
	}
	/**
	 * @param feeDescription the feeDescription to set
	 */
	public void setFeeDescription(String feeDescription) {
		this.feeDescription = feeDescription;
	}
	/**
	 * @return the numOf20
	 */
	public Integer getNumOf20() {
		return numOf20;
	}
	/**
	 * @param numOf20 the numOf20 to set
	 */
	public void setNumOf20(Integer numOf20) {
		this.numOf20 = numOf20;
	}
	/**
	 * @return the numOfOther
	 */
	public Integer getNumOfOther() {
		return numOfOther;
	}
	/**
	 * @param numOfOther the numOfOther to set
	 */
	public void setNumOfOther(Integer numOfOther) {
		this.numOfOther = numOfOther;
	}
	/**
	 * @return the numOf40
	 */
	public Integer getNumOf40() {
		return numOf40;
	}
	/**
	 * @param numOf40 the numOf40 to set
	 */
	public void setNumOf40(Integer numOf40) {
		this.numOf40 = numOf40;
	}
	/**
	 * @return the numOfLCL
	 */
	public Integer getNumOfLCL() {
		return numOfLCL;
	}
	/**
	 * @param numOfLCL the numOfLCL to set
	 */
	public void setNumOfLCL(Integer numOfLCL) {
		this.numOfLCL = numOfLCL;
	}
	/**
	 * @return the total
	 */
	public BigDecimal getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	/**
	 * @return the vat
	 */
	public BigDecimal getVat() {
		return vat;
	}
	/**
	 * @param vat the vat to set
	 */
	public void setVat(BigDecimal vat) {
		this.vat = vat;
	}
	/**
	 * @return the feevat
	 */
	public BigDecimal getFeevat() {
		return feevat;
	}
	/**
	 * @param feevat the feevat to set
	 */
	public void setFeevat(BigDecimal feevat) {
		this.feevat = feevat;
	}
	/**
	 * @return the feewithvat
	 */
	public BigDecimal getFeewithvat() {
		return feewithvat;
	}
	/**
	 * @param feewithvat the feewithvat to set
	 */
	public void setFeewithvat(BigDecimal feewithvat) {
		this.feewithvat = feewithvat;
	}
	/**
	 * @return the note
	 */
	public String getNote() {
		return note;
	}
	/**
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}
	/**
	 * @return the invoice
	 */
	public String getInvoice() {
		return invoice;
	}
	/**
	 * @param invoice the invoice to set
	 */
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	/**
	 * @param feeName
	 * @param feeDescription
	 * @param numOf20
	 * @param numOf40
	 * @param numOfLCL
	 * @param total
	 * @param vat
	 * @param feevat
	 * @param feewithvat
	 * @param note
	 * @param invoice
	 */
	public CustomFeeExportModel(String feeName, String feeDescription,
			Integer numOf20, Integer numOf40, Integer numOfOther, Integer numOfLCL, BigDecimal total,
			BigDecimal vat, String note,
			String invoice) {
		super();
		this.feeName = feeName;
		this.feeDescription = feeDescription;
		this.numOf20 = numOf20;
		this.numOf40 = numOf40;
		this.numOfOther = numOfOther;
		this.numOfLCL = numOfLCL;
		this.total = total;
		this.vat = vat;
		this.feevat = BigDecimal.valueOf(total.doubleValue()*vat.doubleValue()/100);
		this.feewithvat = BigDecimal.valueOf(total.doubleValue()+((total.doubleValue()*vat.doubleValue())/100));
		this.note = note;
		this.invoice = invoice;
	}
	/**
	 * @param feeName
	 * @param feeDescription
	 * @param numOf20
	 * @param numOf40
	 * @param numOfLCL
	 * @param total
	 * @param vat
	 * @param feevat
	 * @param feewithvat
	 * @param note
	 * @param invoice
	 */
	public CustomFeeExportModel(String feeName, String feeDescription,
			Integer numOf20, Integer numOf40, Integer numOfLCL, BigDecimal total,
			BigDecimal vat, String note,
			String invoice) {
		super();
		this.feeName = feeName;
		this.feeDescription = feeDescription;
		this.numOf20 = numOf20;
		this.numOf40 = numOf40;
		this.numOfLCL = numOfLCL;
		this.total = total;
		this.vat = vat;
		this.feevat = BigDecimal.valueOf(total.doubleValue()*vat.doubleValue()/100);
		this.feewithvat = BigDecimal.valueOf(total.doubleValue()+((total.doubleValue()*vat.doubleValue())/100));
		this.note = note;
		this.invoice = invoice;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public BigDecimal getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}
	
}
