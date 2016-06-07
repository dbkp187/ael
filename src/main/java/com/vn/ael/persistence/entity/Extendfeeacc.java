package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the extendfeeacc database table.
 * 
 */
@Entity
@NamedQuery(name="Extendfeeacc.findAll", query="SELECT e FROM Extendfeeacc e")
public class Extendfeeacc extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "description")
	private Configuration description;

	@OneToOne
	@JoinColumn(name= "feeowner")
	private Exfeetable feeowner;

	private String invoice;

	private String note;
	
	@ManyToOne
	@JoinColumn(name="accountingcus")
	private Accountingcus accountingcus;
	
	private Integer quantity20;

	private Integer quantity40;

	private Integer quantityLCL;

	public Extendfeeacc() {
	}

	public Configuration getDescription() {
		return this.description;
	}

	public void setDescription(Configuration description) {
		this.description = description;
	}

	public Exfeetable getFeeowner() {
		return this.feeowner;
	}

	public void setFeeowner(Exfeetable feeowner) {
		this.feeowner = feeowner;
	}

	public String getInvoice() {
		return this.invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Accountingcus getAccountingcus() {
		return accountingcus;
	}

	public void setAccountingcus(Accountingcus accountingcus) {
		this.accountingcus = accountingcus;
	}

	public Integer getQuantity20() {
		return quantity20;
	}

	public void setQuantity20(Integer quantity20) {
		this.quantity20 = quantity20;
	}

	public Integer getQuantity40() {
		return quantity40;
	}

	public void setQuantity40(Integer quantity40) {
		this.quantity40 = quantity40;
	}

	public Integer getQuantityLCL() {
		return quantityLCL;
	}

	public void setQuantityLCL(Integer quantityLCL) {
		this.quantityLCL = quantityLCL;
	}
	
}