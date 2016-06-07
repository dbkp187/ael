package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vn.ael.constants.FormatterPattern;

import java.math.BigDecimal;

/**
 * The persistent class for the refunddetail database table.
 * 
 */
@Entity
@NamedQuery(name = "Refunddetail.findAll", query = "SELECT r FROM Refunddetail r")
public class Refunddetail extends ApprovableBasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal amount;

	private String description;

	@ManyToOne
	@JoinColumn(name = "docs")
	private Docsgeneral docs;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal oAmount;

	// bi-directional many-to-one association to Refund
	@ManyToOne
	@JoinColumn(name = "refundForm")
	private Refund refund;

	public Refunddetail() {
	}

	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@JsonIgnore
	public Docsgeneral getDocs() {
		return this.docs;
	}

	public void setDocs(Docsgeneral docs) {
		this.docs = docs;
	}

	public BigDecimal getOAmount() {
		return this.oAmount;
	}

	public void setOAmount(BigDecimal oAmount) {
		this.oAmount = oAmount;
	}

	@JsonIgnore
	public Refund getRefund() {
		return this.refund;
	}

	public void setRefund(Refund refund) {
		this.refund = refund;
	}

	@Transient
	public String getDocNo() {
		if (this.docs != null){
			return this.docs.getJobNo();
		}
		return "";
	}

}
