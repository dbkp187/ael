package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.springmodules.validation.bean.conf.loader.annotation.handler.Email;

import com.google.gson.annotations.Expose;


/**
 * The persistent class for the customers database table.
 * 
 */
@Entity
@Table(name="customers")
@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c")
public class Customer extends BasedEntityTracking implements Serializable {
	private static final long serialVersionUID = 1L;

	private String address;

	@Expose
	@ManyToOne
	@JoinColumn(name="companyType")
	private Configuration companyType;

	private String contact;

	@ManyToOne
	@JoinColumn(name="country")
	private Configuration country;

	@Email
	private String email;

	private String fax;

	@Expose
	private String name;

	private String taxno;

	private String tel;
	
	@Expose
	@Column(unique = true)
	private String code;
	
	public Customer() {
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Configuration getCompanyType() {
		return this.companyType;
	}

	public void setCompanyType(Configuration companyType) {
		this.companyType = companyType;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Configuration getCountry() {
		return this.country;
	}

	public void setCountry(Configuration country) {
		this.country = country;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTaxno() {
		return this.taxno;
	}

	public void setTaxno(String taxno) {
		this.taxno = taxno;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}