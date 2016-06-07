package com.vn.ael.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum CollectMoneyStatusType {

	NO(0, "debit.type.no"), YES(1, "debit.type.yes"), STILL(2, "debit.type.still");

	private Integer value;
	private String label;

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	private CollectMoneyStatusType(Integer value, String label) {
		this.value = value;
		this.label = label;
	}

	@Override
	public String toString() {
		return String.valueOf(this.value);
	}

	public static Map<Integer, String> getLabelsMap() {
		Map<Integer, String> map = new LinkedHashMap<>();
		for (CollectMoneyStatusType servicesType : CollectMoneyStatusType.values()) {
			map.put(servicesType.getValue(), servicesType.getLabel());
		}
		return map;
	}

	public static CollectMoneyStatusType fromValue(Integer value) {
		for (CollectMoneyStatusType servicesType : CollectMoneyStatusType.values()) {
			if (servicesType.getValue().equals(value)) {
				return servicesType;
			}
		}
		return null;
	}
}
