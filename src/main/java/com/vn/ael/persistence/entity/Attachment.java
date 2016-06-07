package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * The persistent class for the attachment database table.
 * 
 */
@Entity
@NamedQuery(name="Attachment.findAll", query="SELECT a FROM Attachment a")
public class Attachment extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String description;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "docsgeneral")
	private Docsgeneral docsgeneral;

	private String fileName;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "offerPrice")
	private OfferPrice offerPrice;
	
	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL, mappedBy="attachment", fetch = FetchType.LAZY)
	private Realattachment data;

	public Attachment() {
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Docsgeneral getDocsgeneral() {
		return this.docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public OfferPrice getOfferPrice() {
		return this.offerPrice;
	}

	public void setOfferPrice(OfferPrice offerPrice) {
		this.offerPrice = offerPrice;
	}

	public Realattachment getData() {
		return data;
	}

	public void setData(Realattachment data) {
		this.data = data;
	}

}