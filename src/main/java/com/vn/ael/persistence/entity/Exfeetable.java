package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.appfuse.model.User;
import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.webapp.util.CalculationUtil;

/**
 * The persistent class for the exfeetable database table.
 * 
 */
@Entity
@NamedQuery(name="Exfeetable.findAll", query="SELECT e FROM Exfeetable e")
public class Exfeetable extends ApprovableBasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal amount;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal vatAmount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "name")
	private Configuration name;

	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal vat;

	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal total;
	
	//bi-directional many-to-one association to Exhibition
	
	@ManyToOne
	@JoinColumn(name="docsgeneral")
	private Docsgeneral docsgeneral;
	
	@ManyToOne
	@JoinColumn(name="truckingdetail")
	private Truckingdetail truckingdetail;
	
	@ManyToOne
	@JoinColumn(name="masterFee")
	private Configuration masterFee;
	
	@OneToOne(mappedBy = "feeowner")
	private Extendfeeacc extendfeeacc;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal exhUsd;
	
	@ManyToOne
	@JoinColumn(name= "exhibition")
	private Exhibition exhibition;
	
	private Date dateChange;
	
	private String invoiceNo;
	
	private Date updatedOn;
	
	private String updatedBy;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="refund")
	private Refund refund;
	
	@Transient
	private String refCode;
	
	@Transient
	private String voucherNo;
	
	@Transient
	private String payDate;
	
	public String getRefCode() {
		if (this.refund != null) {
			return this.refund.getRefCode();
		} else if(this.getDocsgeneral() != null && this.getDocsgeneral().getId()!= null) {
				User e = refund.getEmployee();
				this.refCode = e.getUsername();
				this.refCode = e.getUsername()+AELConst.SPLASH +String.valueOf(this.getDocsgeneral().getId());
			return this.refCode;
		} else if(this.getTruckingdetail() != null && this.getTruckingdetail().getId()!= null) {
			if (this.getTruckingdetail().getNhathau() != null) {
				String ref = getTruckingdetail().getNhathau().getCode();
				return ref;
			}
		}
		
		return null;
	}
	
	public Exfeetable() {
	}

	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Configuration getName() {
		return this.name;
	}

	public void setName(Configuration name) {
		this.name = name;
	}

	public BigDecimal getVat() {
		return this.vat;
	}

	public void setVat(BigDecimal vat) {
		this.vat = vat;
	}

	@JsonIgnore
	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public Configuration getMasterFee() {
		return masterFee;
	}

	public void setMasterFee(Configuration masterFee) {
		this.masterFee = masterFee;
	}

	public BigDecimal getTotal(){
		return this.total;
	}
	
	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	@Transient
	public BigDecimal getVatFee(){
		if (this.vatAmount == null || this.vatAmount.compareTo(BigDecimal.ZERO) <= 0){
			return CalculationUtil.getVatFee(this.vat, this.amount);
		}
		return vatAmount;
	}

	@JsonIgnore
	public Extendfeeacc getExtendfeeacc() {
		return extendfeeacc;
	}

	public void setExtendfeeacc(Extendfeeacc extendfeeacc) {
		this.extendfeeacc = extendfeeacc;
	}

	@JsonIgnore
	public Truckingdetail getTruckingdetail() {
		return truckingdetail;
	}

	public void setTruckingdetail(Truckingdetail truckingdetail) {
		this.truckingdetail = truckingdetail;
	}

	@JsonIgnore
	public Exhibition getExhibition() {
		return exhibition;
	}

	public void setExhibition(Exhibition exhibition) {
		this.exhibition = exhibition;
	}

	

	public Date getDateChange() {
		return dateChange;
	}

	public void setDateChange(Date dateChange) {
		this.dateChange = dateChange;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public Refund getRefund() {
		return refund;
	}

	public void setRefund(Refund refund) {
		this.refund = refund;
	}

	public BigDecimal getExhUsd() {
		return exhUsd;
	}

	public void setExhUsd(BigDecimal exhUsd) {
		this.exhUsd = exhUsd;
	}

	public BigDecimal getVatAmount() {
		return this.getVatFee();
	}

	public void setVatAmount(BigDecimal vatAmount) {
		this.vatAmount = vatAmount;
	}
	
	//used for highlight duplicated row
	@Transient
	private boolean isDuplicated= false;

	public boolean getIsDuplicated() {
		return isDuplicated;
	}

	public void setIsDuplicated(boolean isDuplicated) {
		this.isDuplicated = isDuplicated;
	}
	
	@Transient
	public String getDocNo() {
		if (this.docsgeneral != null){
			return this.docsgeneral.getJobNo();
		}
		return "";
	}

	public String getVoucherNo() {
		if (this.refund != null && this.refund.getMoneyBook() != null) {
			return this.refund.getMoneyBook().getVoucherNoPrint();
		} else if (this.getTruckingdetail() != null){//chi phi trucking
			return "-";
		}
		return voucherNo;
	}

	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}

	public String getPayDate() {
		if (this.refund != null && this.refund.getMoneyBook() != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				return sdf.format(this.refund.getMoneyBook().getDate());
			} catch (Exception e) {
				e.printStackTrace();
				return payDate;
			}
		} else if (this.getTruckingdetail() != null){//chi phi trucking
			return "-";
		}
		
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	
	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
}
