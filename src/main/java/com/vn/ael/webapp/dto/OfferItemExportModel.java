package com.vn.ael.webapp.dto;

public class OfferItemExportModel {
private Integer index;
private String typeOfService;
private String feeWithVAT;
private String feeNoVAT;
private String currencyUnit;
private String feeUnitId;
/**
 * @param typeOfService
 * @param feeWithVAT
 * @param feeNoVAT
 * @param currencyUnit
 * @param feeUnitId
 */
public OfferItemExportModel(Integer index, String typeOfService, String feeWithVAT,
		String feeNoVAT, String currencyUnit, String feeUnitId) {
	super();
	this.index=index;
	this.typeOfService = typeOfService;
	this.feeWithVAT = feeWithVAT;
	this.feeNoVAT = feeNoVAT;
	this.currencyUnit = currencyUnit;
	this.feeUnitId = feeUnitId;
}
/**
 * @return the typeOfService
 */
public String getTypeOfService() {
	return typeOfService;
}
/**
 * @param typeOfService the typeOfService to set
 */
public void setTypeOfService(String typeOfService) {
	this.typeOfService = typeOfService;
}
/**
 * @return the feeWithVAT
 */
public String getFeeWithVAT() {
	return feeWithVAT;
}
/**
 * @param feeWithVAT the feeWithVAT to set
 */
public void setFeeWithVAT(String feeWithVAT) {
	this.feeWithVAT = feeWithVAT;
}
/**
 * @return the feeNoVAT
 */
public String getFeeNoVAT() {
	return feeNoVAT;
}
/**
 * @param feeNoVAT the feeNoVAT to set
 */
public void setFeeNoVAT(String feeNoVAT) {
	this.feeNoVAT = feeNoVAT;
}
/**
 * @return the currencyUnit
 */
public String getCurrencyUnit() {
	return currencyUnit;
}
/**
 * @param currencyUnit the currencyUnit to set
 */
public void setCurrencyUnit(String currencyUnit) {
	this.currencyUnit = currencyUnit;
}
/**
 * @return the feeUnitId
 */
public String getFeeUnitId() {
	return feeUnitId;
}
/**
 * @param feeUnitId the feeUnitId to set
 */
public void setFeeUnitId(String feeUnitId) {
	this.feeUnitId = feeUnitId;
}
/**
 * @return the index
 */
public Integer getIndex() {
	return index;
}
/**
 * @param index the index to set
 */
public void setIndex(Integer index) {
	this.index = index;
}


}
