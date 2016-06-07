package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Transient;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.enums.ConfigurationType;


/**
 * The persistent class for the offeritem database table.
 * 
 */
@Entity
@NamedQuery(name="OfferItem.findAll", query="SELECT o FROM OfferItem o")
public class OfferItem extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal feeNoVAT;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "feeUnit")
	private Configuration feeUnit;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal feeWithVAT;

	@ManyToOne
	@JoinColumn(name="nameOfService")
	private Configuration nameOfService;
	
	@ManyToOne
	@JoinColumn(name="currency")
	private Configuration currency;

	@ManyToOne
	@JoinColumn(name="offerPrice")
	private OfferPrice offerPrice;

	public OfferItem() {
	}

	public BigDecimal getFeeNoVAT() {
		return this.feeNoVAT;
	}

	public void setFeeNoVAT(BigDecimal feeNoVAT) {
		this.feeNoVAT = feeNoVAT;
	}

	public Configuration getFeeUnit() {
		return this.feeUnit;
	}

	public void setFeeUnit(Configuration feeUnit) {
		this.feeUnit = feeUnit;
	}

	public BigDecimal getFeeWithVAT() {
		return this.feeWithVAT;
	}

	public void setFeeWithVAT(BigDecimal feeWithVAT) {
		this.feeWithVAT = feeWithVAT;
	}

	public Configuration getNameOfService() {
		return this.nameOfService;
	}

	public void setNameOfService(Configuration nameOfService) {
		this.nameOfService = nameOfService;
	}

	public OfferPrice getOfferPrice() {
		return this.offerPrice;
	}

	public void setOfferPrice(OfferPrice offerPrice) {
		this.offerPrice = offerPrice;
	}
	
	public Configuration getCurrency() {
		return currency;
	}

	public void setCurrency(Configuration currency) {
		this.currency = currency;
	}
	
}