package com.vn.ael.webapp.formatter;

import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

import org.exolab.castor.types.DateTime;
import org.springframework.util.StringUtils;

public class CustomDateTimeFormat extends PropertyEditorSupport{
	private final int dateLength = 10;
	
	private final DateFormat dateFormat;

	private final boolean allowEmpty;

	private final int exactDateLength;

	private DateFormat dateTimeFormat;
	
	public CustomDateTimeFormat(DateFormat dateFormat, DateFormat dateTimeFormat, boolean allowEmpty,
			int exactDateLength) {
		this.dateFormat = dateFormat;
		this.allowEmpty = allowEmpty;
		this.exactDateLength = exactDateLength;
		this.dateTimeFormat = dateTimeFormat;
	}
	
	public CustomDateTimeFormat(DateFormat dateFormat, DateFormat dateTimeFormat, boolean allowEmpty) {
		this.dateFormat = dateFormat;
		this.allowEmpty = allowEmpty;
		this.dateTimeFormat = dateTimeFormat;
		this.exactDateLength = -1;
	}
	
	/**
	 * Parse the Date from the given text, using the specified DateFormat.
	 */
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (this.allowEmpty && !StringUtils.hasText(text)) {
			// Treat empty String as null value.
			setValue(null);
		}
		else if (text != null && this.exactDateLength >= 0 && text.length() != this.exactDateLength) {
			throw new IllegalArgumentException(
					"Could not parse date: it is not exactly" + this.exactDateLength + "characters long");
		}
		else {
			try {
				if (text.length() > this.dateLength){
					Date date = this.dateTimeFormat.parse(text);
					setValue(new DateTime(date));
				}else{
					setValue(this.dateFormat.parse(text));
				}
			}
			catch (ParseException ex) {
				throw new IllegalArgumentException("Could not parse date: " + ex.getMessage(), ex);
			}
		}
	}

	/**
	 * Format the Date as String, using the specified DateFormat.
	 */
	@Override
	public String getAsText() {
		Date value = null;
		if  (getValue() instanceof DateTime){
			value = ((DateTime) getValue()).toDate();
			return (value != null ? this.dateTimeFormat.format(value) : "");
		}
		
		value = (Date) getValue();
		return (value != null ? this.dateFormat.format(value) : "");
		
	}

}
