package com.vn.ael.webapp.util;

import java.math.BigDecimal;

import com.vn.ael.constants.AELConst;

public class CalculationUtil {
	private static final BigDecimal PERCENT = new BigDecimal(AELConst.VAT_PERCENT);
	
	public static final BigDecimal getVatFee(BigDecimal vat, BigDecimal total){
		BigDecimal result =  ConvertUtil.getNotNullValue(vat).multiply((ConvertUtil.getNotNullValue(total)).divide(PERCENT));
		return result.setScale(0, BigDecimal.ROUND_HALF_UP);
	}
	
	public static final BigDecimal getTotalWithVat(BigDecimal vat, BigDecimal total){
		return getVatFee(vat, total).add(ConvertUtil.getNotNullValue(total));
	}

}
