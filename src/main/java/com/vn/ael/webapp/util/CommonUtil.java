package com.vn.ael.webapp.util;

import java.util.Calendar;
import java.util.Date;

import com.vn.ael.constants.AELConst;

public class CommonUtil {
	private static String ZERO = "0";
	private static int LENGTH_OF_MONTH_STRING = 2;
	public static int LENGTH_OF_COUNTER = 4;
	private static int YEAR_OFFSET = 1900;
	
	/**
	 * Get current year in String
	 * @return
	 */
	public static String getCurrentYear(){
		return getMonthString(Calendar.getInstance().getTime());
	}
	
	/**
	 * Get 2 chars of current month
	 * @return
	 */
	public static String getCurrentMonth(){
		return getYearString(Calendar.getInstance().getTime());
	}
	
	/**
	 * Get current year in String
	 * @return
	 */
	public static String getYearString(Date date){
		return String.valueOf(getYear(date) + YEAR_OFFSET);
	}
	
	/**
	 * Get 2 chars of current month
	 * @return
	 */
	public static String getMonthString(Date date){
		String month = String.valueOf(getMonth(date));
		return addZero(month, LENGTH_OF_MONTH_STRING);
	}
	
	/**
	 * Get current year in String
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static int getYear(Date date){
		return date.getYear() + YEAR_OFFSET;
	}
	
	/**
	 * Get 2 chars of current month
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static int getMonth(Date date){
		return date.getMonth()+1;
	}
	
	/**
	 * Add 0 at the beginning of input
	 * @param input
	 * @param len
	 * @return
	 */
	public static String addZero(String input, int len){
		if (input == null){
			input=AELConst.EMPTY_STRING;
		}
		
		while (input.length() < len){
			input=ZERO+input;
		}
		return input;
	}
	
	
	/**
	 * Return string for date, dd/mm/yyyy
	 * @param date
	 * @return
	 */
	public static String getDateString(Date date){
		if (date != null){
			return addZero(String.valueOf(date.getDate()),2) +AELConst.SPLASH+addZero(String.valueOf(date.getMonth()+1),2)
					+AELConst.SPLASH+String.valueOf(date.getYear()+YEAR_OFFSET);
		}
		return AELConst.EMPTY_STRING;
	}

	/**
	 * 
	 * @param counting
	 * @param lENGTH_OF_COUNTER2
	 * @return
	 */
	public static String addZero(int counting, int len) {
		return addZero(String.valueOf(counting), len);
	}
	
	
	public static String concate(String s1, String s2){
		return s1 + AELConst.SPACE+ s2 + AELConst.NEW_LINE_REPORT;
	}
	
	public static int getCurrentYearYYYY() {
		Calendar c = Calendar.getInstance();
		return c.get(Calendar.YEAR);
	}
}
