package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.*;

import com.google.gson.annotations.Expose;
import com.vn.ael.constants.AELConst;
import com.vn.ael.enums.ConfigurationType;


/**
 * The persistent class for the configuration database table.
 * 
 */
@Entity
@NamedQuery(name="Configuration.findAll", query="SELECT c FROM Configuration c")
public class Configuration extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String description;

	@Expose
	private Integer type;

	@Expose
	private String value;
	
	private Boolean enabled = true;
	
	public Configuration() {
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	@Transient
	public String getTextType(){
		return ConfigurationType.getTextByValue(this.type);
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
	@Transient
	public String getFullInfo(){
		return this.value + AELConst.SEPARATOR + this.description; 
	}

}