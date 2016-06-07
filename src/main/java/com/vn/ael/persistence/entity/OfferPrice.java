package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import com.google.gson.annotations.Expose;
import com.vn.ael.enums.ServicesType;


/**
 * The persistent class for the offerprice database table.
 * 
 */
@Entity
@NamedQuery(name="Offerprice.findAll", query="SELECT o FROM OfferPrice o")
public class OfferPrice extends BasedEntityTracking implements Serializable {
	private static final long serialVersionUID = 1L;

	private Date dateOffer;

	@Enumerated(EnumType.ORDINAL)
	private ServicesType typeOfService;
	
	@ManyToOne
	@JoinColumn(name = "customer")
	private Customer customer;

	//bi-directional many-to-one association to Contseal
	@JsonIgnore
	@OneToMany(mappedBy="offerPrice", cascade = CascadeType.ALL)
	private List<OfferItem> offerItems;
	
	@JsonIgnore
	@OneToMany(mappedBy="offerPrice", cascade = CascadeType.ALL)
	private List<Attachment> attachments;
	
	private Boolean isValid;
		
	public OfferPrice() {
	}

	public Date getDateOffer() {
		return this.dateOffer;
	}

	public void setDateOffer(Date dateOffer) {
		this.dateOffer = dateOffer;
	}

	public ServicesType getTypeOfService() {
		return this.typeOfService;
	}

	public void setTypeOfService(ServicesType typeOfService) {
		this.typeOfService = typeOfService;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<OfferItem> getOfferItems() {
		return offerItems;
	}

	public void setOfferItems(List<OfferItem> offerItems) {
		this.offerItems = offerItems;
	}
	
	@Transient
	public String getTypeOfServiveText(){
		return this.typeOfService != null ? this.typeOfService.getTextKey() : "";
	}

	public Boolean getIsValid() {
		return isValid;
	}

	public void setIsValid(Boolean isValid) {
		this.isValid = isValid;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	
}