package com.vn.ael.persistence.entity;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.webapp.util.ConvertUtil;


/**
 * The persistent class for the transreportext database table.
 * 
 */
@Entity
@NamedQuery(name="Transreportext.findAll", query="SELECT t FROM Transreportext t")
public class Transreportext extends BasedChildEntity {
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal price;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal priceUnit;

	private String note;
	
	@OneToOne
	@JoinColumn(name = "truckingdetail")
	private Truckingdetail truckingdetail;

	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal vat;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal otherFee;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal vatValue;

	public Transreportext() {
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public Truckingdetail getTruckingdetail() {
		return truckingdetail;
	}

	public void setTruckingdetail(Truckingdetail truckingdetail) {
		this.truckingdetail = truckingdetail;
	}

	public BigDecimal getVat() {
		return vat;
	}

	public void setVat(BigDecimal vat) {
		this.vat = vat;
	}

	public BigDecimal getVatValue() {
		return vatValue;
	}

	public void setVatValue(BigDecimal vatValue) {
		this.vatValue = vatValue;
	}
	
	@Transient
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal total;

	public BigDecimal getTotal() {
		return ConvertUtil.getNotNullValue(this.priceUnit).add(ConvertUtil.getNotNullValue(this.vatValue));
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public BigDecimal getOtherFee() {
		return otherFee;
	}

	public void setOtherFee(BigDecimal otherFee) {
		this.otherFee = otherFee;
	}
	

}