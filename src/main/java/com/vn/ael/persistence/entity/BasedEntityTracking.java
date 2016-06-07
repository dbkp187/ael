package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import org.appfuse.model.User;

@MappedSuperclass
public class BasedEntityTracking extends BaseEntity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8279839395912239266L;

	@ManyToOne
	@JoinColumn(name = "creator")
	private User creator;
	
	@ManyToOne
	@JoinColumn(name = "updator")
	private User updator;
	
	private Date createdDate;
	
	private Date lastUpdateDate;

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public User getUpdator() {
		return updator;
	}

	public void setUpdator(User updator) {
		this.updator = updator;
	}
	
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
}
