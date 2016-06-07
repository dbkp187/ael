package com.vn.ael.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum ContractorPaymentStatusType {

	NO(0, "contractor.payment.type.no"), YES(1, "contractor.payment.type.yes"), STILL(2, "contractor.payment.type.still");

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

	private ContractorPaymentStatusType(Integer value, String label) {
		this.value = value;
		this.label = label;
	}

	@Override
	public String toString() {
		return String.valueOf(this.value);
	}

	public static Map<Integer, String> getLabelsMap() {
		Map<Integer, String> map = new LinkedHashMap<>();
		for (ContractorPaymentStatusType servicesType : ContractorPaymentStatusType.values()) {
			map.put(servicesType.getValue(), servicesType.getLabel());
		}
		return map;
	}

	public static ContractorPaymentStatusType fromValue(Integer value) {
		for (ContractorPaymentStatusType servicesType : ContractorPaymentStatusType.values()) {
			if (servicesType.getValue().equals(value)) {
				return servicesType;
			}
		}
		return null;
	}
}
