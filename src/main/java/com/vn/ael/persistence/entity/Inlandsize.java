package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.FormatterPattern;


/**
 * The persistent class for the inlandsize database table.
 * 
 */
@Entity
@NamedQuery(name="Inlandsize.findAll", query="SELECT i FROM Inlandsize i")
public class Inlandsize extends BasedChildEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer deep;

	private Integer height;

	private Integer width;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private Double kg;
	
	//bi-directional many-to-one association to Inlandfcl
	@ManyToOne
	@JoinColumn(name="docsgeneral")
	private Docsgeneral docsgeneral;

	public Inlandsize() {
	}

	public Integer getDeep() {
		return this.deep;
	}

	public void setDeep(Integer deep) {
		this.deep = deep;
	}

	public Integer getHeight() {
		return this.height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getWidth() {
		return this.width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Double getKg() {
		return kg;
	}

	public void setKg(Double kg) {
		this.kg = kg;
	}

	public Docsgeneral getDocsgeneral() {
		return docsgeneral;
	}

	public void setDocsgeneral(Docsgeneral docsgeneral) {
		this.docsgeneral = docsgeneral;
	}
	
}