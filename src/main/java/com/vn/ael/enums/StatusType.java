package com.vn.ael.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum StatusType {

	NO("false","no"),
	YES("true","yes");
	
	private String value;
	private String label;
	
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
	private StatusType(String value, String label) {
		this.value = value;
		this.label = label;
	}
	 @Override
	public String toString() {
		 return String.valueOf(this.value);
	}
	 
	 public static Map<String, String> getLabelsMap(){
			Map<String, String> map = new LinkedHashMap<>();
			for (StatusType servicesType : StatusType.values()){
					map.put(servicesType.getValue(), servicesType.getLabel());
			}
			return map;
		}
		
		public static StatusType fromValue(String value){
			for (StatusType servicesType : StatusType.values()){
				if (servicesType.getValue().equals(value)){
					return servicesType;
				}
			}
			return null;
		}
}
