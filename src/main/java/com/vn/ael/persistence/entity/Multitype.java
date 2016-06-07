package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;

import java.util.Date;


/**
 * The persistent class for the multitypes database table.
 * 
 */
@Entity
@Table(name="multitypes")
@NamedQuery(name="Multitype.findAll", query="SELECT m FROM Multitype m")
public class Multitype extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer amount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="type")
	private Configuration type;
	
	@ManyToOne
	@JoinColumn(name="docsgeneral")
	private Docsgeneral docsgeneral;
	
	public Multitype() {
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Configuration getType() {
		return this.type;
	}

	public void setType(Configuration type) {
		this.type = type;
	}

	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}
	
}