package com.vn.ael.webapp.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.vn.ael.webapp.util.ConvertUtil;

public class FeeNameExport {
	private List<String> name;
	private List<List<FeeExportItem>> values;
	
	public FeeNameExport(){
		name = new ArrayList<>();
		values = new ArrayList<>();
	}
	
	public FeeNameExport(int sizeC,int size) {
		name = new ArrayList<>();
		values = new ArrayList<>();
		for (int i=0; i<size; ++i){
			values.add(FeeExportItem.createListBySize(sizeC));
		}
	}

	public List<String> getName() {
		return name;
	}
	public void setName(List<String> name) {
		this.name = name;
	}

	public List<List<FeeExportItem>> getValues() {
		return values;
	}

	public void setValues(List<List<FeeExportItem>> values) {
		this.values = values;
	}
	
	
}
