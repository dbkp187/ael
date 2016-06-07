package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.appfuse.model.User;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.enums.CollectMoneyStatusType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.webapp.formatter.FormatterUtil;


/**
 * The persistent class for the docsgeneral database table.
 * 
 */
@Entity
@NamedQuery(name="DocsAccounting.findAll", query="SELECT d FROM DocsAccounting d")
public class DocsAccounting extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	//profitloss here is ok!!!
	
	@OneToOne
	@JoinColumn(name = "docsgeneral")
	private Docsgeneral docsgeneral;
	
	private BigDecimal phiAelChuaThu = BigDecimal.ZERO;
	private BigDecimal phiChiHoChuaThu = BigDecimal.ZERO;
	
	private BigDecimal phiAelDaThu = BigDecimal.ZERO;
	private BigDecimal phiChiHoDaThu = BigDecimal.ZERO;
	private Integer collectMoneyStatus;
	
	@Transient
	private BigDecimal tong;
	/**
	 * @return the docsgeneral
	 */
	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	/**
	 * @param docsgeneral the docsgeneral to set
	 */
	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}
	
	public BigDecimal getPhiAelChuaThu() {
		return phiAelChuaThu;
	}
	public void setPhiAelChuaThu(BigDecimal phiAelChuaThu) {
		this.phiAelChuaThu = phiAelChuaThu;
	}
	public BigDecimal getPhiChiHoChuaThu() {
		return phiChiHoChuaThu;
	}

	public void setPhiChiHoChuaThu(BigDecimal phiChiHoChuaThu) {
		this.phiChiHoChuaThu = phiChiHoChuaThu;
	}

	/**
	 * @return the phiAelDaThu
	 */
	public BigDecimal getPhiAelDaThu() {
		return phiAelDaThu;
	}

	/**
	 * @param phiAelDaThu the phiAelDaThu to set
	 */
	public void setPhiAelDaThu(BigDecimal phiAelDaThu) {
		this.phiAelDaThu = phiAelDaThu;
	}

	/**
	 * @return the phiChiHoDaThu
	 */
	public BigDecimal getPhiChiHoDaThu() {
		return phiChiHoDaThu;
	}

	/**
	 * @param phiChiHoDaThu the phiChiHoDaThu to set
	 */
	public void setPhiChiHoDaThu(BigDecimal phiChiHoDaThu) {
		this.phiChiHoDaThu = phiChiHoDaThu;
	}

	/**
	 * @return the collectMoneyStatus
	 */
	public Integer getCollectMoneyStatus() {
		return collectMoneyStatus;
	}

	/**
	 * @param collectMoneyStatus the collectMoneyStatus to set
	 */
	public void setCollectMoneyStatus(Integer collectMoneyStatus) {
		this.collectMoneyStatus = collectMoneyStatus;
	}

	public BigDecimal getTong() {
		BigDecimal tong = BigDecimal.ZERO;
		BigDecimal s1 = this.getPhiAelChuaThu() == null ? tong : this.getPhiAelChuaThu();
		BigDecimal s2 = this.getPhiAelDaThu() == null ? tong : this.getPhiAelDaThu();
		BigDecimal s3 = this.getPhiChiHoChuaThu() == null ? tong : this.getPhiChiHoChuaThu();
		BigDecimal s4 = this.getPhiChiHoDaThu() == null ? tong : this.getPhiChiHoDaThu();
		
		tong = tong.add(s1).add(s2).add(s3).add(s4);
		return tong;
	}

	public void setTong(BigDecimal tong) {
		this.tong = tong;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
