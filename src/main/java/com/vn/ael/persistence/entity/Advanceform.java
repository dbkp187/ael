package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.appfuse.model.User;
import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.webapp.util.ConvertUtil;


/**
 * The persistent class for the advanceform database table.
 * 
 */
@Entity
@NamedQuery(name="Advanceform.findAll", query="SELECT a FROM Advanceform a")
public class Advanceform extends BasicAdvance implements Serializable {
	private static final long serialVersionUID = 1L;

	private Date timeRefund;

	private Boolean isAdmin;
	
	//bi-directional many-to-one association to Advancedetail
	@JsonIgnore
	@OneToMany(mappedBy="advanceform", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Advancedetail> advancedetails;
	
	public Advanceform() {
	}

	public Date getTimeRefund() {
		return this.timeRefund;
	}

	public void setTimeRefund(Date timeRefund) {
		this.timeRefund = timeRefund;
	}

	public List<Advancedetail> getAdvancedetails() {
		return this.advancedetails;
	}

	public void setAdvancedetails(List<Advancedetail> advancedetails) {
		this.advancedetails = advancedetails;
	}

	public Advancedetail addAdvancedetail(Advancedetail advancedetail) {
		getAdvancedetails().add(advancedetail);
		advancedetail.setAdvanceform(this);

		return advancedetail;
	}

	public Advancedetail removeAdvancedetail(Advancedetail advancedetail) {
		getAdvancedetails().remove(advancedetail);
		advancedetail.setAdvanceform(null);

		return advancedetail;
	}

	@Transient
	@NumberFormat(pattern =FormatterPattern.NUMBER)
	private BigDecimal total;
	
	public BigDecimal getTotal(){
		this.total = BigDecimal.ZERO;
		if (this.advancedetails != null && !this.advancedetails.isEmpty()){
			for (Advancedetail advancedetail : this.advancedetails){
				this.total = this.total.add(ConvertUtil.getNotNullValue(advancedetail.getAmount()));
			}
		}
		return this.total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	
	@Override
	public BigDecimal getMultipleTotal() {
		return this.total;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

}