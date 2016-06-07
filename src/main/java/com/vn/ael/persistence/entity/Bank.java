package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


/**
 * The persistent class for the nhathau database table.
 * 
 */
@Entity
@NamedQuery(name="Bank.findAll", query="SELECT n FROM Bank n")
public class Bank extends com.vn.ael.persistence.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String name;

	private String code;
	
	private String accountNo;
	
	private String branch;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "bank")
	private List<MoneyBook> moneyBooks;
	
	public Bank() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}
}