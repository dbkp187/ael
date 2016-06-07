package com.vn.ael.webapp.formatter;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.persistence.service.PasswordTokenManagerImpl;

public class FormatterUtil {
	private static final Log log = LogFactory.getLog(FormatterUtil.class);
	private static final DecimalFormat numberHasExtension = new DecimalFormat(FormatterPattern.NUMBER_HAS_EXTENSION);
	private static final DecimalFormat numberHasExtension3Digit = new DecimalFormat(FormatterPattern.NUMBER_HAS_EXTENSION_3DIGIT);
	private static final DecimalFormat number = new DecimalFormat(FormatterPattern.NUMBER);
	private static final DateFormat dateFormat = new SimpleDateFormat(FormatterPattern.DATE_FOMART);
	private static final DateFormat dateTimeFormat = new SimpleDateFormat(FormatterPattern.DATE_FOMART);
	
	/**
	 * Return a String which represents the BigDecimal
	 * @param bigDecimal
	 * @return
	 */
	public static String formatBigDecimal(BigDecimal bigDecimal){
		return numberHasExtension.format(bigDecimal);
	}
	
	/**
	 * Return a String which represents the BigDecimal
	 * @param bigDecimal
	 * @return
	 */
	public static String formatBigDecimal(BigDecimal bigDecimal,boolean is3Dgit){
		if (is3Dgit){
			return numberHasExtension3Digit.format(bigDecimal);
		}
		return formatBigDecimal(bigDecimal);
	}
	
	/**
	 * Return a String which represents the Integer
	 * @param bigDecimal
	 * @return
	 */
	public static String formatInteger(Integer integer){
		return number.format(integer);
	}
	
	/**
	 * Format date objects
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date){
		try{
			if (date != null){
				return dateFormat.format(date);
			}
		}catch(Exception e){
			log.error(e);
		}
		return AELConst.EMPTY_STRING;
	}
	
	/**
	 * Format date objects
	 * @param date
	 * @return
	 */
	public static String formatDateTime(Date date){
		try{
			if (date != null){
				return dateTimeFormat.format(date);
			}
		}catch(Exception e){
			log.error(e);
		}
		return AELConst.EMPTY_STRING;
	}
	
	public static Date parseDateTime(String date){
		try{
			if (date != null){
				return dateTimeFormat.parse(date);
			}
		}catch(Exception e){
			log.error(e);
		}
		return null;
	}
}
