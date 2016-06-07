package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.webapp.util.CalculationUtil;
import com.vn.ael.webapp.util.ConvertUtil;


/**
 * The persistent class for the refund database table.
 * 
 */
@Entity
@NamedQuery(name="Refund.findAll", query="SELECT r FROM Refund r")
public class Refund extends BasicAdvance implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Refunddetail
	@OneToMany(mappedBy = "refund", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Refunddetail> refunddetails;
	
	@JsonIgnore
	@OneToMany(mappedBy = "refund", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Exfeetable> exfeetables;
	
	private Boolean isRAdmin;
	
	private Boolean isPhieuThu;
	
	private Boolean isAdmin;

	public Refund() {
	}

	public List<Refunddetail> getRefunddetails() {
		return this.refunddetails;
	}

	public void setRefunddetails(List<Refunddetail> refunddetails) {
		this.refunddetails = refunddetails;
	}	

	public List<Exfeetable> getExfeetables() {
		return exfeetables;
	}

	public void setExfeetables(List<Exfeetable> exfeetables) {
		this.exfeetables = exfeetables;
	}

	public Refunddetail addRefunddetail(Refunddetail refunddetail) {
		getRefunddetails().add(refunddetail);
		refunddetail.setRefund(this);

		return refunddetail;
	}

	public Refunddetail removeRefunddetail(Refunddetail refunddetail) {
		getRefunddetails().remove(refunddetail);
		refunddetail.setRefund(null);
		return refunddetail;
	}
	
	@Transient
	private BigDecimal totalAmount;
	
	public BigDecimal getTotalAmount(){
		this.totalAmount = BigDecimal.ZERO;
		if (this.getId() != null){
			if (((this.isPhieuThu != null && this.isPhieuThu ) ||(this.isAdmin !=null && this.isAdmin)) && this.refunddetails != null && !this.refunddetails.isEmpty()){
				for (Refunddetail refunddetail : this.refunddetails){
					this.totalAmount = this.totalAmount.add(ConvertUtil.getNotNullValue(refunddetail.getAmount()));
				}
			}else
			if ((this.isAdmin != null && !this.isAdmin)){
				if (this.exfeetables != null && !this.exfeetables.isEmpty()){
					for (Exfeetable exfeetable : this.exfeetables){
						if (exfeetable.getVatAmount() != null && exfeetable.getVatAmount() != BigDecimal.ZERO) {
							this.totalAmount = this.totalAmount.add(exfeetable.getAmount()).add(exfeetable.getVatAmount());
						} else {
							this.totalAmount = this.totalAmount.add(CalculationUtil.getTotalWithVat(exfeetable.getVat(),exfeetable.getAmount()));
						}
					}
				}
			}
		}
		
		return this.totalAmount;
	}
	
	@Transient
	private BigDecimal totalOAmount;
	
	public BigDecimal getTotalOAmount(){
		this.totalOAmount = BigDecimal.ZERO;
		if (((this.isPhieuThu != null && this.isPhieuThu ) ||(this.isAdmin !=null && this.isAdmin)) && this.refunddetails != null && !this.refunddetails.isEmpty()){
			for (Refunddetail refunddetail : this.refunddetails){
				this.totalOAmount = this.totalOAmount.add(ConvertUtil.getNotNullValue(refunddetail.getOAmount()));
			}
		}
		return this.totalOAmount;
	}
	
	@Transient
	@NumberFormat(pattern =FormatterPattern.NUMBER)
	private BigDecimal total;
	
	public BigDecimal getTotal(){
		this.total = BigDecimal.ZERO;
		if (this.getId() != null){
			if (((this.isPhieuThu != null && this.isPhieuThu ) ||(this.isAdmin !=null && this.isAdmin)) && this.refunddetails != null && !this.refunddetails.isEmpty()){
				return this.getTotalAmount().add(this.getTotalOAmount());
			}else if (((this.isPhieuThu == null || !this.isPhieuThu ) &&(this.isAdmin ==null || !this.isAdmin))){
				return ConvertUtil.getNotNullValue(this.getTotalAmount());
			}
		}
		
		return total;
	}

	@Override
	public BigDecimal getMultipleTotal() {
		return this.total;
	}
	
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	/**
	 * @return the isPhieuThu
	 */
	public Boolean getIsPhieuThu() {
		return isPhieuThu;
	}

	/**
	 * @param isPhieuThu the isPhieuThu to set
	 */
	public void setIsPhieuThu(Boolean isPhieuThu) {
		this.isPhieuThu = isPhieuThu;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Boolean getIsRAdmin() {
		return isRAdmin;
	}

	public void setIsRAdmin(Boolean isRAdmin) {
		this.isRAdmin = isRAdmin;
	}
	
	
	//used to defind dulicated job
	@Transient
	private boolean containDuplicated  = false;

	public boolean getIsContainDuplicated() {
		return containDuplicated;
	}

	public void setIsContainDuplicated(boolean containDuplicated) {
		this.containDuplicated = containDuplicated;
	}
	
}
