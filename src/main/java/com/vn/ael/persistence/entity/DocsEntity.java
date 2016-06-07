package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class DocsEntity extends BasedEntityTracking implements Serializable{
	
	private Integer counting;

	public Integer getCounting() {
		return counting;
	}

	public void setCounting(Integer counting) {
		this.counting = counting;
	}

}
