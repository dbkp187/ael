package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.vn.ael.webapp.util.JsonAware;

@MappedSuperclass
public abstract class BaseEntity implements Serializable, JsonAware{
	private static final long serialVersionUID = -7515736720764006691L;
	
	@Expose
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    public Long getId() {
        return id;
    }

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getJson() {
        Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();        
        return gson.toJson(this);

    }
}
