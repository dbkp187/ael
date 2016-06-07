package com.vn.ael.persistence.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the nhathau database table.
 * 
 */
@Entity
@NamedQuery(name="Nhathau.findAll", query="SELECT n FROM Nhathau n")
public class Nhathau extends com.vn.ael.persistence.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String contactName;

	private String name;

	private String phoneNumber;
	
	private String taxNo;
	
	private Integer type;
	
	private String address;
	
	private String code;

	private String info;
	
	public Nhathau() {
	}

	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getTaxNo() {
		return taxNo;
	}

	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	
	@Transient
	public String getFullInfo(){
		return this.contactName+" "+this.name+" "+this.phoneNumber;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
}