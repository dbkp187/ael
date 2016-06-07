package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@MappedSuperclass
public class BasedChildEntity extends BaseEntity implements Serializable{

	@Transient
	private Boolean isAdded = false;
	
	@Transient
	private Boolean isDeleted = false;
	
	public Boolean getIsAdded() {
		return isAdded;
	}

	public void setIsAdded(Boolean isAdded) {
		this.isAdded = isAdded;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
}
