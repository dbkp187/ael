package com.vn.ael.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum ConfigurationType {
	SALE_SERVICES(0,"configuration.services","services"),
	CURRENCY(1,"configuration.currency","currencies"),
	UNIT(3,"configuration.unit","units"),
	COMPANY_TYPE(4,"configuration.companyType","companyTypes"),
	COUNTRY(5,"configuration.country","countries"),
	DOCS_TYPE_OF_TRANSPORT(6,"configuration.typeOfTransport","typeOfTransports"),
	DOCS_TYPE_OF_CONTAINER(7,"configuration.typeOfContainer","typeOfContainers"),
	DOCS_COLOUR_APPLYING(8,"configuration.colourApplying","colourApplyings",true),
	DOCS_ATTACH_SERCICES(9,"configuration.attachServices","attachServices"),
	DOCS_TYPE_OF_CONTAINER_CONT(10,"configuration.typeOfContainerCont","typeOfContainerConts"),
	DOCS_CODE_IME(11,"configuration.imExMode","imExModes"),
	DOCS_SHIPPING_LINE(12,"configuration.shippingLine","shippingLines"),
	DOCS_SHIPPING_CUSTOM_DEPT(13,"configuration.customDept","customDepts"),
	DOCS_TRANS_TYPE_OF_SER(14,"configuration.typeOfServices","docsTypeOfServices"),
	DOCS_ROUTE(15,"configuration.route","routes"),
//	TRUCK_NHA_THAU(16,"configuration.nhathau","nhathau"),
	EXH_TYPE_OF_EXH(17,"configuration.typeOfExh","typeOfExhs"),
	EXH_ATTACH_SERVICES(18,"configuration.attachServicesEXH","attachServicesEXHs"),
	FEE_NAMES(19,"configuration.exhFeeName","exhFeeNames"),
	MASTER_FEE(20,"configuration.masterFee","masterFees"),
	EXH_MASTER_FEE(21,"configuration.exhmasterFee","exhmasterFees"),
	EXH_OPERATOR(22,"configuration.operatorExh","operatorExhs"),
	DEBIT_GENERAL_FEE(23,"configuration.debitFeeName","debitfees"),
	DEBIT_FEE_DESCRIPTION(24,"configuration.debitFeeDes","debitfeesDes"),
	EXH_MASTER_FEE_REPORT(25,"configuration.exhmasterFeeReport","exhmasterFeesReport"),
	EXH_FEE_NAMES_REPORT(26,"configuration.exhFeeNameReport","exhFeeNamesReport"),
	TYPE_OF_IMPORT(27,"configuration.typeOfImport","importTypes"),
	TYPE_OF_IMPORT_SEA(28,"configuration.typeOfImportSea","importTypeSeas"),
	EXH_NAME(29,"configuration.exhibitionName","exhibitionNames"),
	EXH_PRODUCT_TYPE(30,"configuration.exhibitionProductType","exhibitionProductTypes")
	;
	
	private int value;
	private String textKey;
	private String key;
	private boolean isDisplayWithDes = false;
	
	static Map<Integer,String> ALL_CONFIG = null;
	
	ConfigurationType(int value, String text, String key){
		this.value = value;
		this.textKey = text;
		this.key = key;
	}
	
	ConfigurationType(int value, String text, String key, boolean isDisplayWithDes){
		this.value = value;
		this.textKey = text;
		this.key = key;
		this.isDisplayWithDes = isDisplayWithDes;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getTextKey() {
		return textKey;
	}

	public void setTextKey(String textKey) {
		this.textKey = textKey;
	}
	
	/**
	 * Get all key of this Enum as Map
	 * @return
	 */
	public static Map<Integer,String> getAllAsMap(){
		if (ALL_CONFIG == null){
			ALL_CONFIG = new LinkedHashMap<>();
			for (ConfigurationType type: values()){
				ALL_CONFIG.put(type.getValue(), type.getTextKey());
			}
		}
		return ALL_CONFIG;
	}
	
	/**
	 * Get text key by value
	 * @param value
	 * @return 
	 */
	public static String getTextByValue(int value){
		for (ConfigurationType type: values()){
			if (type.getValue() == value){
				return type.getTextKey();
			}
		}
		return String.valueOf(value);
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public boolean isDisplayWithDes() {
		return isDisplayWithDes;
	}

	public void setDisplayWithDes(boolean isDisplayWithDes) {
		this.isDisplayWithDes = isDisplayWithDes;
	}
}
