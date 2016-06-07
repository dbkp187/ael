package com.vn.ael.webapp.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.vn.ael.constants.AELConst;

public class FeeExportItem {
	
	BigDecimal feeVal;
	String soHD;
	
	public FeeExportItem(){
		feeVal = BigDecimal.ZERO;
		soHD=AELConst.EMPTY_STRING;
	}
	public BigDecimal getFeeVal() {
		return feeVal;
	}
	public void setFeeVal(BigDecimal feeVal) {
		this.feeVal = feeVal;
	}
	public String getSoHD() {
		return soHD;
	}
	public void setSoHD(String soHD) {
		this.soHD = soHD;
	}
	
	public static List<FeeExportItem> createListBySize(int size){
		List<FeeExportItem> list = new ArrayList<>();
		for (int i=0; i<size; ++i){
			list.add(new FeeExportItem());
		}
		return list;
	}

}
