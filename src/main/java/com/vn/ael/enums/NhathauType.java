package com.vn.ael.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum NhathauType {
	
	NHATHAU(0,"nhathauType.nhathau"),
	HANGTAU(1,"nhathauType.hangtau");
	private int value;
	private String label;
	
	NhathauType(int val, String label){
		this.value = val;
		this.label = label;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Override
	public String toString(){
		return String.valueOf(this.value);
	}
	
//	private static Integer END_USAGE = 2;
	
	public static Map<Integer, String> getLabelsMap(){
		Map<Integer, String> map = new LinkedHashMap<>();
		for (NhathauType servicesType : NhathauType.values()){
				map.put(servicesType.getValue(), servicesType.getLabel());
		}
		return map;
	}
	
	public static NhathauType fromValue(int value){
		for (NhathauType servicesType : NhathauType.values()){
			if (servicesType.getValue() == value){
				return servicesType;
			}
		}
		return null;
	}

}
