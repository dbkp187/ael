package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.webapp.util.CalculationUtil;
import com.vn.ael.webapp.util.ConvertUtil;

import java.math.BigDecimal;


/**
 * The persistent class for the accountingcusdetail database table.
 * 
 */
@Entity
@NamedQuery(name="Accountingcusdetail.findAll", query="SELECT a FROM Accountingcusdetail a")
public class Accountingcusdetail extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="description")
	private Configuration description;

//	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal generalVat;

	private String invoice;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="name")
	private Configuration name;

	private String note;

	private Integer quantity20;

	private Integer quantity40;

	private Integer quantityLCL;
	
	private Integer quantityOt;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal vatAmount;
	
	public BigDecimal getVatAmount() {
		return vatAmount;
	}

	public void setVatAmount(BigDecimal vatAmount) {
		this.vatAmount = vatAmount;
	}

	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal unitPrice;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER)
	private BigDecimal total;

	//bi-directional many-to-one association to Accountingcus
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="accountingcus")
	private Accountingcus accountingcus;

	public Accountingcusdetail() {
	}

	public BigDecimal getGeneralVat() {
		return this.generalVat;
	}

	public void setGeneralVat(BigDecimal generalVat) {
		this.generalVat = generalVat;
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
		return this.accountingcus;
	}

	public void setAccountingcus(Accountingcus accountingcusBean) {
		this.accountingcus = accountingcusBean;
	}

	public Configuration getDescription() {
		return description;
	}

	public void setDescription(Configuration description) {
		this.description = description;
	}

	public Configuration getName() {
		return name;
	}

	public void setName(Configuration name) {
		this.name = name;
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

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public Integer getQuantityOt() {
		return quantityOt;
	}

	public void setQuantityOt(Integer quantityOt) {
		this.quantityOt = quantityOt;
	}
	
	@Transient
	public BigDecimal getFeevat(){
		if (this.generalVat != null && this.generalVat.compareTo(BigDecimal.ZERO) >0){
			return CalculationUtil.getVatFee(this.generalVat, this.total);
		}
		return this.vatAmount;
	}
	
	@Transient
	public BigDecimal getFeewithvat(){
		if (this.generalVat != null && this.generalVat.compareTo(BigDecimal.ZERO) >0){
			return CalculationUtil.getTotalWithVat(this.generalVat, this.total);
		}
		return ConvertUtil.getNotNullValue(this.vatAmount).add(ConvertUtil.getNotNullValue(this.total));
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}
	
}