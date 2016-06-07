package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.webapp.util.ConvertUtil;


/**
 * The persistent class for the truckingdetail database table.
 * 
 */
@Entity
@NamedQuery(name="Truckingdetail.findAll", query="SELECT t FROM Truckingdetail t")
public class Truckingdetail extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "consteal")
	private Contseal consteal;

	private String noOfVehicle;

	private String vehicleNo;
	
	@OneToOne(mappedBy = "truckingdetail", cascade = CascadeType.ALL)
	private Transreportext transreportext;
	
	//bi-directional many-to-one association to Truckingservice
	@ManyToOne
	@JoinColumn(name="trucking")
	private Truckingservice truckingservice;
	
	@ManyToOne
	@JoinColumn(name="nhathau")
	private Nhathau nhathau;
	
	@OneToOne(mappedBy = "truckingdetail",cascade = CascadeType.ALL)
	private TruckAccounting truckAccounting;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "truckingdetail")
	private List<Exfeetable> exfeetables;
	
	private Date dateDev;
	
	private String deliveryPlace;
	
	@Transient
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal chiho;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal phuthu;
	
	@Transient
	private BigDecimal total;	
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal otherFees;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal accountingPrice;
	
	private String placeGetCont;
	
	private String placePutCont;

	public Truckingdetail() {
	}

	public Contseal getConsteal() {
		return this.consteal;
	}

	public void setConsteal(Contseal consteal) {
		this.consteal = consteal;
	}

	public String getNoOfVehicle() {
		return this.noOfVehicle;
	}

	public void setNoOfVehicle(String noOfVehicle) {
		this.noOfVehicle = noOfVehicle;
	}

	public String getVehicleNo() {
		return this.vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public Truckingservice getTruckingservice() {
		return this.truckingservice;
	}

	public void setTruckingservice(Truckingservice truckingservice) {
		this.truckingservice = truckingservice;
	}

	public List<Exfeetable> getExfeetables() {
		return exfeetables;
	}

	public void setExfeetables(List<Exfeetable> exfeetables) {
		this.exfeetables = exfeetables;
	}

	public Nhathau getNhathau() {
		return nhathau;
	}

	public void setNhathau(Nhathau nhathau) {
		this.nhathau = nhathau;
	}

	public Date getDateDev() {
		return dateDev;
	}

	public void setDateDev(Date dateDev) {
		this.dateDev = dateDev;
	}

	public String getDeliveryPlace() {
		return deliveryPlace;
	}

	public void setDeliveryPlace(String deliveryPlace) {
		this.deliveryPlace = deliveryPlace;
	}

	public BigDecimal getPhuthu() {
		return phuthu;
	}

	public void setPhuthu(BigDecimal phuthu) {
		this.phuthu = phuthu;
	}

	public BigDecimal getTotal() {
//		this.total = BigDecimal.ZERO;
//		if(this.phuthu != null){
//			this.total = this.total.add(this.phuthu);
//		}		
//		if(this.exfeetables != null && !this.exfeetables.isEmpty()){
//			for (Exfeetable exfeetable : this.exfeetables) {
//				if(exfeetable.getTotal() != null){
//					this.total = this.total.add(exfeetable.getTotal());
//				}				
//			}
//		}
		return this.total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	
	public BigDecimal getAccountingPrice() {
		return accountingPrice;
	}

	public void setAccountingPrice(BigDecimal accountingPrice) {
		this.accountingPrice = accountingPrice;
	}

	public BigDecimal getOtherFees() {
		return otherFees;
	}

	public void setOtherFees(BigDecimal otherFees) {
		this.otherFees = otherFees;
	}

	public BigDecimal getChiho() {
		return chiho;
	}

	public void setChiho(BigDecimal chiho) {
		this.chiho = chiho;
	}		
	
	public String getPlaceGetCont() {
		return placeGetCont;
	}

	public void setPlaceGetCont(String placeGetCont) {
		this.placeGetCont = placeGetCont;
	}

	public String getPlacePutCont() {
		return placePutCont;
	}

	public void setPlacePutCont(String placePutCont) {
		this.placePutCont = placePutCont;
	}

	@Transient
	public BigDecimal getTotalTransReport(){
		return ConvertUtil.getNotNullValue(this.chiho).add(ConvertUtil.getNotNullValue(this.accountingPrice))
				.add(ConvertUtil.getNotNullValue(otherFees));
	}

	public Transreportext getTransreportext() {
		return transreportext;
	}

	public void setTransreportext(Transreportext transreportext) {
		this.transreportext = transreportext;
	}
	
	//just used for trans report
	@Transient
	private List<Exfeetable> chihoTruckings;

	public List<Exfeetable> getChihoTruckings() {
		return chihoTruckings;
	}

	public void setChihoTruckings(List<Exfeetable> chihoTruckings) {
		this.chihoTruckings = chihoTruckings;
	}

	public TruckAccounting getTruckAccounting() {
		return truckAccounting;
	}

	public void setTruckAccounting(TruckAccounting truckAccounting) {
		this.truckAccounting = truckAccounting;
	}
	
	

}
