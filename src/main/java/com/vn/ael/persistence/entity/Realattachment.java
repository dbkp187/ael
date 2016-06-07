package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;


/**
 * The persistent class for the realattachment database table.
 * 
 */
@Entity
@NamedQuery(name="Realattachment.findAll", query="SELECT r FROM Realattachment r")
public class Realattachment extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "attachment")
	private Attachment attachment;

	@Lob
	@Basic(fetch = FetchType.LAZY)
	private byte[] data;
	
	private String extension;

	public Realattachment() {
	}

	public Attachment getAttachment() {
		return this.attachment;
	}

	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}

	public byte[] getData() {
		return this.data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

}