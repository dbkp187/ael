package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the accountingcus database table.
 * 
 */
@Entity
@NamedQuery(name="Accountingcus.findAll", query="SELECT a FROM Accountingcus a")
public class Accountingcus extends BasedEntityTracking implements Serializable {
	private static final long serialVersionUID = 1L;

	@OneToOne
	@JoinColumn(name="docsgeneral")
	private Docsgeneral docsgeneral;

	private String refNo;

	//bi-directional many-to-one association to Accountingcusdetail
	@OneToMany(mappedBy="accountingcus", cascade = CascadeType.ALL)
	private List<Accountingcusdetail> accountingcusdetails;
	
	//bi-directional many-to-one association to Accountingcusdetail
	@OneToMany(mappedBy="accountingcus", cascade = CascadeType.ALL)
	private List<Extendfeeacc> extendfeeaccs;
	
	private Integer counting;

	public Accountingcus() {
	}


	public String getRefNo() {
		return this.refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public List<Accountingcusdetail> getAccountingcusdetails() {
		return this.accountingcusdetails;
	}

	public void setAccountingcusdetails(List<Accountingcusdetail> accountingcusdetails) {
		this.accountingcusdetails = accountingcusdetails;
	}

	public Accountingcusdetail addAccountingcusdetail(Accountingcusdetail accountingcusdetail) {
		getAccountingcusdetails().add(accountingcusdetail);
		accountingcusdetail.setAccountingcus(this);

		return accountingcusdetail;
	}

	public Accountingcusdetail removeAccountingcusdetail(Accountingcusdetail accountingcusdetail) {
		getAccountingcusdetails().remove(accountingcusdetail);
		accountingcusdetail.setAccountingcus(null);

		return accountingcusdetail;
	}

	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}


	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}

	public List<Extendfeeacc> getExtendfeeaccs() {
		return extendfeeaccs;
	}

	public void setExtendfeeaccs(List<Extendfeeacc> extendfeeaccs) {
		this.extendfeeaccs = extendfeeaccs;
	}


	public Integer getCounting() {
		return counting;
	}


	public void setCounting(Integer counting) {
		this.counting = counting;
	}
	
}