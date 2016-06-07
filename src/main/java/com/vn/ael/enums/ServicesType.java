package com.vn.ael.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum ServicesType {
	
	DVTQ(0,"CUS","serviceType.cus","DBHQ"),
	DVVT(1,"VTT","serviceType.vtt","BKVC"),
	EXHS(2,"EXH","serviceType.exh",null),
	OTHERS(3,"OTHERS","serviceType.others",null),
	DVVT_INLAND(4,"INLAND","serviceType.vttnd","BKVC"),
	DVVT_SEALAND(5,"SEALAND","serviceType.vttb","BKVC");
	
	private int value;
	private String label;
	private String textKey;
	private String debit;
	
	ServicesType(int val, String label, String text,String debit){
		this.value = val;
		this.label = label;
		this.textKey = text;
		this.debit = debit;
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

	public String getTextKey() {
		return textKey;
	}

	public void setTextKey(String textKey) {
		this.textKey = textKey;
	}
	
	@Override
	public String toString(){
		return String.valueOf(this.value);
	}
	
	private static Integer END_USAGE = 2;
	
	public static Map<Integer, String> getUsageMap(){
		Map<Integer, String> map = new LinkedHashMap<>();
		for (ServicesType servicesType : ServicesType.values()){
			if (servicesType.getValue() <= END_USAGE){
				map.put(servicesType.getValue(), servicesType.getTextKey());
			}
		}
		return map;
	}
	
	public static ServicesType fromValue(int value){
		for (ServicesType servicesType : ServicesType.values()){
			if (servicesType.getValue() == value){
				return servicesType;
			}
		}
		return null;
	}
	
	public static Map<Integer, String> getUsageMapVT(){
		Map<Integer, String> map = new LinkedHashMap<>();
		for (ServicesType servicesType : ServicesType.values()){
			if (servicesType.getValue() == 4 || servicesType.getValue() == 5){
				map.put(servicesType.getValue(), servicesType.getTextKey());
			}
		}
		return map;
	}
	
	public static Map<Integer, String> getUsageMapSearchTruck(){
		Map<Integer, String> map = new LinkedHashMap<>();
		for (ServicesType servicesType : ServicesType.values()){
			if (servicesType.getValue() == 4 || servicesType.getValue() == 5 || servicesType.getValue() == 0 || servicesType.getValue() == 2){
				map.put(servicesType.getValue(), servicesType.getTextKey());
			}
		}
		return map;
	}

	public String getDebit() {
		return debit;
	}

	public void setDebit(String debit) {
		this.debit = debit;
	}
	
}
