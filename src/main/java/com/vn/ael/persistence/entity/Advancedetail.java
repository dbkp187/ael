package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;

import java.math.BigDecimal;


/**
 * The persistent class for the advancedetail database table.
 * 
 */
@Entity
@NamedQuery(name="Advancedetail.findAll", query="SELECT a FROM Advancedetail a")
public class Advancedetail extends ApprovableBasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal amount;

	private String description;
	
	private String goodDes;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="docs")
	private Docsgeneral docs;

	//bi-directional many-to-one association to Advanceform
	@ManyToOne
	@JoinColumn(name="advanceForm")
	private Advanceform advanceform;

	public Advancedetail() {
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

	public Advanceform getAdvanceform() {
		return this.advanceform;
	}

	public void setAdvanceform(Advanceform advanceform) {
		this.advanceform = advanceform;
	}

	public String getGoodDes() {
		return goodDes;
	}

	public void setGoodDes(String goodDes) {
		this.goodDes = goodDes;
	}
	
	@Transient
	public String getJobNo(){
		if (this.docs != null){
			return this.docs.getJobNo();
		}
		return AELConst.EMPTY_STRING;
	}
	
}