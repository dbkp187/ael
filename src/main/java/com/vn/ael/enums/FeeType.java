package com.vn.ael.enums;

public enum FeeType {
	NANG(288,"fee.chiphinang"),
	HA(289,"chiphiha");
	
	private int id;
	private String name;
	
	private FeeType(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
