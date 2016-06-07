
package com.vn.ael.webapp.controller;

import java.math.BigDecimal;
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
import com.vn.ael.enums.ContractorPaymentStatusType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Bank;
import com.vn.ael.persistence.entity.MoneyBook;
import com.vn.ael.persistence.entity.TruckAccounting;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.manager.AccountingMoneyBookManager;
import com.vn.ael.persistence.manager.BankManager;
import com.vn.ael.persistence.manager.DocsAccountingManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.webapp.dto.AccountingContractorPaymentCondition;
import com.vn.ael.webapp.util.ControllerUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AccountingContractorPaymentController extends BaseFormController {
	private AccountingMoneyBookManager accountingMoneyBookManager;

	@Autowired
	public void setAccountingMoneyBookManager(AccountingMoneyBookManager accountingMoneyBookManager){
		this.accountingMoneyBookManager = accountingMoneyBookManager;
		
	}
    
    private DocsAccountingManager docsAccountingManager;

    @Autowired
    public void setDocsAccountingManager(final DocsAccountingManager docsAccountingManager) {
        this.docsAccountingManager = docsAccountingManager;
    }
    
    private NhathauManager nhathauManager = null;
    private BankManager bankManager = null;
    
    @Autowired
    public void setManager(final NhathauManager nhathauManager, final BankManager bankManager) {
        this.nhathauManager = nhathauManager;
        this.bankManager = bankManager;
    }
    
	@Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_MANAGE_CONTRACTOR_PAYMENT)
    public ModelAndView manageContractorPaymentRequest(HttpServletRequest request) throws Exception {
    	ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_MANAGE_CONTRACTOR_PAYMENT);
    	AccountingContractorPaymentCondition searchAccFee = new AccountingContractorPaymentCondition();
        
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", ContractorPaymentStatusType.getLabelsMap());
        mav.addObject("nhathauList", nhathauManager.getAll()); 
        mav.addObject("banks", bankManager.getAll());
        mav.addObject("accountingContractorPaymentCondition", searchAccFee);
        //request.getSession().setAttribute(SessionNames.FORM_SEARCH_ACCOUNTING_CONTRACTOR_PAYMENT, searchAccFee);
           
        //List<Truckingdetail> docsgenerals = docsAccountingManager.searchDocsTruckingFee(searchAccFee);
        //mav.addObject("truckings", docsgenerals);
        return mav;
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.ACCOUNT_SEARCH_TRUCKING_FEE)
	public ModelAndView searchContractorPayment(HttpServletRequest request, AccountingContractorPaymentCondition searchAccFee, BindingResult errors)
			throws Exception {
		
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_MANAGE_CONTRACTOR_PAYMENT);
		
		mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", ContractorPaymentStatusType.getLabelsMap());
        mav.addObject("nhathauList", nhathauManager.getAll()); 
        List<Truckingdetail> truckings = docsAccountingManager.searchDocsTruckingFee(searchAccFee);
        mav.addObject("banks", bankManager.getAll());
        mav.addObject("truckings", truckings);

		return mav;
	}
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_PAY_MONEY_AJAX)
    public @ResponseBody String loadCollectMoney(HttpServletRequest request, HttpServletResponse response)
    	    throws Exception {    	 
    	try {
    		String moneyType = request.getParameter("moneyType");
    		String result = "";
    		if (moneyType.equals("0")) {
    			result = ControllerUtil.createJsonObject(VoucherType.PHIEUCHI, this.accountingMoneyBookManager);
    		} else {
    			result = ControllerUtil.createJsonObject(VoucherType.UNC, this.accountingMoneyBookManager);
    		}
    		
    		return result;
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_SAVE_TRUCKING_MONEYBOOK_AJAX)
    public @ResponseBody String updateMoneyBook(HttpServletRequest request, HttpServletResponse response)
    	    throws Exception {    	 
    	String moneyType = request.getParameter("moneyType");
		VoucherType voucherType;
		BookType bookType;
		Long bankId = null;
		if (request.getParameter("bankId") != null) {
			bankId = Long.parseLong(request.getParameter("bankId"));
		}
		if (moneyType.equals("0")) {
			voucherType = VoucherType.PHIEUCHI;
			bookType = BookType.CASHBOOK;
		} else {
			voucherType = VoucherType.UNC;
			bookType = BookType.BANKBOOK;
		}
		

    	String validate = ControllerUtil.validateForm(request, voucherType, this.accountingMoneyBookManager);
    	try {
	    	if (validate.length() == 0) {
		        
		        Map<Long, TruckAccounting> accountingMap = new HashMap<Long, TruckAccounting>();
	    		 
		        String multiplePrice = request.getParameter("data");
		        
		        JSONObject jsonObject = JSONObject.fromObject(multiplePrice);
		        
		        JSONArray jsonArray = jsonObject.getJSONArray("moneys");
		        //System.out.println(jsonArray.toString());
		        for (int i = 0; i < jsonArray.length(); i++) {
		        	JSONObject jsonObj = jsonArray.getJSONObject(i);
		        	Long id = jsonObj.getLong("jobId");
		        	TruckAccounting truckAc = accountingMap.get(id);
		        	if (truckAc == null) {
		        		truckAc = new TruckAccounting();
		        	} 
		        	
		        	BigDecimal inputMoney = new BigDecimal(jsonObj.getDouble("inputAmount"));
		        	Integer type = jsonObj.getInt("type");
		        	if (type == 0) {
		        		truckAc.setPhiAelDaChi(inputMoney);
		        	} else {
		        		truckAc.setPhiChiHoDaChi(inputMoney);
		        	}
		        	truckAc.setPayMoneyStatus(0);//init, calculate and change later
		        	accountingMap.put(id, truckAc);
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
			    	this.docsAccountingManager.updatePayMoneyStatus(accountingMap);
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
