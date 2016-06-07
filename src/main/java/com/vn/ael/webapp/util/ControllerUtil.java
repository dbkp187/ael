package com.vn.ael.webapp.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.vn.ael.constants.BookType;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.persistence.entity.Bank;
import com.vn.ael.persistence.entity.BasicAdvance;
import com.vn.ael.persistence.entity.MoneyBook;
import com.vn.ael.persistence.manager.AccountingMoneyBookManager;

import net.sf.json.JSONObject;

public class ControllerUtil {
	public static String validateForm(HttpServletRequest request, VoucherType type, AccountingMoneyBookManager mbMa) {
		StringBuilder result = new StringBuilder();

		boolean voucherNoProblem = false;
		String voucherNoParam = request.getParameter("voucherNo");
		
    	String voucherNoStr = voucherNoParam.replaceAll("\\D+","");
    	if (voucherNoParam.length() < 4) {
			voucherNoProblem = true;
		}
    	
    	try {
    		Integer voucherNo = Integer.parseInt(voucherNoStr);
    		MoneyBook mb = mbMa.getMoneyBookByVoucherNoAndType(voucherNo, type);
    		if(mb != null) {
    			voucherNoProblem = true;
    		}
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    		voucherNoProblem = true;
		}
 
    	if (voucherNoProblem) {
    		result.append("- Sheet no is wrong format or existed \n");
    	}
		return result.toString();
    }
	
	public static MoneyBook createMoneyBook(
			BasicAdvance form,
			VoucherType voucherType,
			BookType bookType,
			HttpServletRequest request)
    	    throws Exception {    	
		
    	String voucherNoParam = request.getParameter("voucherNo");
    	String voucherNoStr = voucherNoParam.replaceAll("\\D+","");;
    	Integer voucherNo = Integer.parseInt(voucherNoStr);
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    	String dateStr=  request.getParameter("date");
    	Date date = sdf.parse(dateStr);
	 	String reason = request.getParameter("reason");
        //create moneybook
	 	MoneyBook moneyBook = new MoneyBook();
	 	moneyBook.setVoucherNo(voucherNo);
	 	moneyBook.setDate(date);
	 	moneyBook.setDescription(reason);
	 	moneyBook.setTypeOfBook(bookType);//cashbook
	 	moneyBook.setTypeOfVoucher(voucherType);
	 	moneyBook.setBalance(null);
	 	if (form != null) {
		    moneyBook.setRefNos(form.getMultipleRefCode());
		    if (voucherType.getValue() == 0) { 
		    	moneyBook.setPaymentMoney(form.getMultipleTotal());
		    } else {
		    	moneyBook.setReceptMoney(form.getMultipleTotal());
		    }
	 	} else {
	 		String refCode = request.getParameter("refNo");
	 		String amount = request.getParameter("amount");
	 		BigDecimal amountNumber = new BigDecimal(amount);
	 		moneyBook.setRefNos(refCode);
//	 		PHIEUCHI(0, "PC", 5, "moneybook.voucherType.phieuchi"), 
//	 		PHIEUTHU(1, "PT", 5, "moneybook.voucherType.phieuthu"), 
//	 		NTTK(2, "NTTK", 4, "moneybook.voucherType.nttk"), 
//	 		UNC(3, "UNC", 4, "moneybook.voucherType.unc");
	 		if (voucherType.getValue() == 0 || voucherType.getValue() == 3) {
	 			moneyBook.setPaymentMoney(amountNumber);
	 		} else {
	 			moneyBook.setReceptMoney(amountNumber);
	 		}
	 	}
	 	return moneyBook;
    }
	
	public static String createJsonObject(VoucherType type, BasicAdvance basicForm, AccountingMoneyBookManager mbMa, HttpServletRequest request)
    	    throws Exception {    	 
		JSONObject obj = new JSONObject();
		
		Integer voucherNo = mbMa.getMaxVoucherNo(type);
		String prefix = type.getPrefix();
		String number = CommonUtil.addZero(String.valueOf(voucherNo + 1), type.getLengthOfCounter());

		String voucherNoPrint = prefix + number ;
        obj.put("voucherNo", voucherNo);
        obj.put("voucherNoPrint", voucherNoPrint);
        obj.put("refCodes", basicForm.getRefCode());
        obj.put("reason", basicForm.getPayReason());
        obj.put("date", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
        obj.put("amount", basicForm.getMultipleTotal());
        return obj.toString();
    }
	
	//for NTTK & UNC
	public static String createJsonObject(VoucherType type, AccountingMoneyBookManager mbMa)
    	    throws Exception {    	 
		JSONObject obj = new JSONObject();
		
		Integer voucherNo = mbMa.getMaxVoucherNo(type);
		String prefix = type.getPrefix();
		String number = CommonUtil.addZero(String.valueOf(voucherNo + 1), type.getLengthOfCounter());

		String voucherNoPrint = prefix + number ;
        obj.put("voucherNo", voucherNo);
        obj.put("voucherNoPrint", voucherNoPrint);
        obj.put("date", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
        return obj.toString();
    }
	
}
