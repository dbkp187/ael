
package com.vn.ael.webapp.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.BookType;
import com.vn.ael.constants.URLReference;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.enums.CollectMoneyStatusType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Bank;
import com.vn.ael.persistence.entity.DocsAccounting;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.MoneyBook;
import com.vn.ael.persistence.manager.AccountingMoneyBookManager;
import com.vn.ael.persistence.manager.BankManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.DocsAccountingManager;
import com.vn.ael.webapp.dto.AccountingCollectMoneyCondition;
import com.vn.ael.webapp.util.ControllerUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AccountingCollectMoneyController extends BaseFormController {
	private AccountingMoneyBookManager accountingMoneyBookManager;

	@Autowired
	public void setAccountingMoneyBookManager(AccountingMoneyBookManager accountingMoneyBookManager){
		this.accountingMoneyBookManager = accountingMoneyBookManager;
		
	}

	private DocsAccountingManager docsAccountingManager;
	private BankManager bankManager = null;
    @Autowired
    public void setDocsAccountingManager(final DocsAccountingManager docsAccountingManager) {
        this.docsAccountingManager = docsAccountingManager;
    }
    
    private CustomerManager customerManager = null;
	 
    @Autowired
    public void setCustomerManager(final CustomerManager customerManager, final BankManager bankManager) {
        this.customerManager = customerManager;
        this.bankManager = bankManager;
    }
	@Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_MANAGE_DEBIT)
    public ModelAndView manageDebitRequest(HttpServletRequest request) throws Exception {
    	ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_MANAGE_DEBIT);
        //model.addAttribute(docsAccountingManager.findByDoAccounting(true));
    	AccountingCollectMoneyCondition searchAccFee = new AccountingCollectMoneyCondition();
        
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", CollectMoneyStatusType.getLabelsMap());
        mav.addObject("banks", bankManager.getAll());
        mav.addObject("customers", customerManager.getAll()); 
        mav.addObject("accountingCollectMoneyCondition", searchAccFee);
        //request.getSession().setAttribute(SessionNames.FORM_SEARCH_ACCOUNTING_COLLECT_MONEY, searchAccFee);
           
        //List<Docsgeneral> docsgenerals = docsAccountingManager.searchDebit(searchAccFee);
        //mav.addObject(docsgenerals);
        return mav;
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.ACCOUNT_SEARCH_DEBIT)
	public ModelAndView searchDebit(HttpServletRequest request, AccountingCollectMoneyCondition searchDebit, BindingResult errors)
			throws Exception {
		
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_MANAGE_DEBIT);
		
		mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", CollectMoneyStatusType.getLabelsMap());
        //mav.addObject("jobList", docsAccountingManager.getAllJob());
        mav.addObject("customers", customerManager.getAll()); 
        mav.addObject("banks", bankManager.getAll());
		List<Docsgeneral> docsgenerals = docsAccountingManager.searchDebit(searchDebit);
		mav.addObject(docsgenerals);

		return mav;
	}
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_COLLECT_MONEY_AJAX)
    public @ResponseBody String loadCollectMoney(HttpServletRequest request, HttpServletResponse response)
    	    throws Exception {    	 
    	try {
    		String moneyType = request.getParameter("moneyType");
    		String result = "";
    		if (moneyType.equals("0")) {
    			result = ControllerUtil.createJsonObject(VoucherType.PHIEUTHU, this.accountingMoneyBookManager);
    		} else {
    			result = ControllerUtil.createJsonObject(VoucherType.NTTK, this.accountingMoneyBookManager);
    		}
    		
    		return result;
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_SAVE_MONEYBOOK_AJAX)
    public @ResponseBody String updateMoneyBook(HttpServletRequest request, HttpServletResponse response)
    	    throws Exception {    	 
    	String moneyType = request.getParameter("moneyType");
		VoucherType voucherType;
		BookType bookType;
		if (moneyType.equals("0")) {
			voucherType = VoucherType.PHIEUTHU;
			bookType = BookType.CASHBOOK;
		} else {
			voucherType = VoucherType.NTTK;
			bookType = BookType.BANKBOOK;
		}
		
		Long bankId = null;
		if (request.getParameter("bankId") != null) {
			bankId = Long.parseLong(request.getParameter("bankId"));
		}
		
    	String validate = ControllerUtil.validateForm(request, voucherType, this.accountingMoneyBookManager);
    	try {
	    	if (validate.length() == 0) {
	    		
	    		Map<Long, DocsAccounting> accountingMap = new HashMap<Long, DocsAccounting>();
	    		 
		        String multiplePrice = request.getParameter("data");
		        
		        JSONObject jsonObject = JSONObject.fromObject(multiplePrice);
		        
		        JSONArray jsonArray = jsonObject.getJSONArray("moneys");
		        //System.out.println(jsonArray.toString());
		        for (int i = 0; i < jsonArray.length(); i++) {
		        	JSONObject jsonObj = jsonArray.getJSONObject(i);
		        	Long id = jsonObj.getLong("jobId");
		        	
		        	DocsAccounting docsAc = accountingMap.get(id);
		        	if (docsAc == null) {
		        		docsAc = new DocsAccounting();
		        	} 
		        	
		        	BigDecimal inputMoney = new BigDecimal(jsonObj.getDouble("inputAmount"));
		        	Integer type = jsonObj.getInt("type");
		        	if (type == 0) {
		        		docsAc.setPhiAelDaThu(inputMoney);
		        	} else {
		        		docsAc.setPhiChiHoDaThu(inputMoney);
		        	}
		        	docsAc.setCollectMoneyStatus(0);//init, calculate and change later
		        	accountingMap.put(id, docsAc);
				}
		        
		        try {
		        	//Long idLong = Long.parseLong(id);
			        MoneyBook mb = ControllerUtil.createMoneyBook(
			        		null,
			    			voucherType,
			    			bookType,
			    			request);
			        if (bankId != null) {
				        Bank bank = bankManager.get(bankId);
				        mb.setBank(bank);
			        }
			    	MoneyBook moneyBook = this.accountingMoneyBookManager.insertMoneyBook(mb);
			    	
			    	//statusReturn = this.docsAccountingManager.updateCollectMoneyStatus(idLong, feeTypeInt);
			    	this.docsAccountingManager.updateCollectMoneyStatus(accountingMap);
		        } catch (Exception e) {
		        	e.printStackTrace();
		        }
		        return "ok";
		        
	    	} else {
	    		return validate;
	    	}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
        return "error";
    }
}
