package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the truckingservice database table.
 * 
 */
@Entity
@NamedQuery(name="Truckingservice.findAll", query="SELECT t FROM Truckingservice t")
public class Truckingservice extends BasedEntityTracking implements Serializable {
	private static final long serialVersionUID = 1L;

	private String arrival;

	private String departure;
	
	private Boolean doRecInfo;
	
	private Boolean doPlaning;
	
	private Boolean doBooking;
	
	private Boolean doDelivery;
	
	private Boolean doDoneDeli;
	
	private Boolean doDonePack;
	
	private Boolean doCollectInfo;
	
	private Boolean doAccounting;
	
	private String contactDelivery;	
	
	private String infoInvoice;

	@OneToOne
	@JoinColumn(name = "docsgeneral")
	private Docsgeneral docsgeneral;

	//bi-directional many-to-one association to Truckingdetail
	@OneToMany(mappedBy="truckingservice", cascade = CascadeType.ALL)
	private List<Truckingdetail> truckingdetails;

	public Truckingservice() {
	}

	public String getArrival() {
		return this.arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public String getDeparture() {
		return this.departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public Docsgeneral getDocsgeneral() {
		return this.docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public List<Truckingdetail> getTruckingdetails() {
		return this.truckingdetails;
	}

	public void setTruckingdetails(List<Truckingdetail> truckingdetails) {
		this.truckingdetails = truckingdetails;
	}

	public Truckingdetail addTruckingdetail(Truckingdetail truckingdetail) {
		getTruckingdetails().add(truckingdetail);
		truckingdetail.setTruckingservice(this);

		return truckingdetail;
	}

	public Truckingdetail removeTruckingdetail(Truckingdetail truckingdetail) {
		getTruckingdetails().remove(truckingdetail);
		truckingdetail.setTruckingservice(null);

		return truckingdetail;
	}

	public Boolean getDoRecInfo() {
		return doRecInfo;
	}

	public void setDoRecInfo(Boolean doRecInfo) {
		this.doRecInfo = doRecInfo;
	}

	public Boolean getDoPlaning() {
		return doPlaning;
	}

	public void setDoPlaning(Boolean doPlaning) {
		this.doPlaning = doPlaning;
	}

	public Boolean getDoBooking() {
		return doBooking;
	}

	public void setDoBooking(Boolean doBooking) {
		this.doBooking = doBooking;
	}

	public Boolean getDoDelivery() {
		return doDelivery;
	}

	public void setDoDelivery(Boolean doDelivery) {
		this.doDelivery = doDelivery;
	}

	public Boolean getDoDoneDeli() {
		return doDoneDeli;
	}

	public void setDoDoneDeli(Boolean doDoneDeli) {
		this.doDoneDeli = doDoneDeli;
	}

	public Boolean getDoDonePack() {
		return doDonePack;
	}

	public void setDoDonePack(Boolean doDonePack) {
		this.doDonePack = doDonePack;
	}

	public Boolean getDoCollectInfo() {
		return doCollectInfo;
	}

	public void setDoCollectInfo(Boolean doCollectInfo) {
		this.doCollectInfo = doCollectInfo;
	}

	public Boolean getDoAccounting() {
		return doAccounting;
	}

	public void setDoAccounting(Boolean doAccounting) {
		this.doAccounting = doAccounting;
	}
	
	public String getContactDelivery() {
		return contactDelivery;
	}

	public void setContactDelivery(String contactDelivery) {
		this.contactDelivery = contactDelivery;
	}
	
	public String getInfoInvoice() {
		return infoInvoice;
	}

	public void setInfoInvoice(String infoInvoice) {
		this.infoInvoice = infoInvoice;
	}
}