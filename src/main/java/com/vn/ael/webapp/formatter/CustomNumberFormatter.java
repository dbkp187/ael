package com.vn.ael.webapp.formatter;

import java.text.NumberFormat;

import org.springframework.beans.propertyeditors.CustomNumberEditor;

public class CustomNumberFormatter extends CustomNumberEditor{

	public CustomNumberFormatter(Class<? extends Number> numberClass,
			NumberFormat numberFormat, boolean allowEmpty)
			throws IllegalArgumentException {
		super(numberClass, numberFormat, allowEmpty);
	}
	
	/**
	 * Parse the Number from the given text, using the specified NumberFormat.
	 */
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text != null){
			text = text.replace(",", "");
		}
		super.setAsText(text);
	}

}
