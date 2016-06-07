package com.vn.ael.webapp.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.appfuse.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.BookType;
import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.SessionNames;
import com.vn.ael.constants.URLReference;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.persistence.entity.Bank;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.MoneyBook;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.manager.AccountingMoneyBookManager;
import com.vn.ael.persistence.manager.BankManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.RefundManager;
import com.vn.ael.persistence.service.PermissionCheckingService;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.util.ControllerUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class RefundFormController extends BaseFormController {

	private PermissionCheckingService permissionCheckingService;
	
	private DocsgeneralManager docsgeneralManager;
	
	private ExfeetableManager exfeetableManager;
	
	private BankManager bankManager;
	
	private AccountingMoneyBookManager accountingMoneyBookManager;
	
	@Autowired
	public void setPermissionChecking(PermissionCheckingService permissionCheckingService){
		this.permissionCheckingService = permissionCheckingService;
		
	}
	
	@Autowired
	public void setExfeetableManager(ExfeetableManager exfeetableManager, BankManager bankManager){
		this.exfeetableManager = exfeetableManager;
		this.bankManager = bankManager;
	}
	
	private RefundManager refundManager;
	
	@Autowired
	public void setRefundManager(RefundManager refundManager){
		this.refundManager = refundManager;
		
	}
		
	@Autowired
    public void setDocsgeneralManager(DocsgeneralManager docsgeneralManager) {
		this.docsgeneralManager = docsgeneralManager;
	}

	@Autowired
	public void setAccountingMoneyBookManager(AccountingMoneyBookManager accountingMoneyBookManager){
		this.accountingMoneyBookManager = accountingMoneyBookManager;
		
	}

	public RefundFormController() {
        setCancelView("redirect:"+URLReference.ADVANCE_REFUNDS);
        setSuccessView("redirect:"+URLReference.ADVANCE_REFUNDS);
    }
 
    /**
     * Based on request parameter, load offers
     * @param request
     * @return
     */
    /*private Refund loadRefundByRequest(HttpServletRequest request){
    	String id = request.getParameter("id");
    	User customer = getUserManager().getLoggedUser(request);
    	Refund refund = null;
        if (!StringUtils.isBlank(id)) {
        	refund = refundManager.get(new Long(id));
        	if (refund == null || !(refund.getEmployee().getId().compareTo(customer.getId()) ==0  
        			|| permissionCheckingService.couldViewUserAdvance(customer))){
        		return null;
        	}
        }else{
        		 //load user
        		 if (customer != null){
        			 refund = new Refund();
        			 refund.setEmployee(customer);
        		 }
        }
        refundManager.updateChilds(refund);
        return refund;
    }*/
    
    /**
     * Based on request parameter, load offers
     * @param request
     * @return
     */
    private Refund loadRefundByRequest(HttpServletRequest request){
    	String idStr = request.getParameter("id");
    	User customer = getUserManager().getLoggedUser(request);
    	Refund refund = new Refund();
    	List<Refund> listaf = new ArrayList<Refund>();
        if (!StringUtils.isBlank(idStr)) {
        	String[] ids = idStr.split(",");
        	for (String id : ids) {
        		Refund af = new Refund();
        		af = refundManager.get(new Long(id));
	        	if (af == null || !(af.getEmployee().getId().compareTo(customer.getId()) ==0  
	        			|| permissionCheckingService.couldViewUserAdvance(customer))){
	        		return null;
	        	}
	        	listaf.add(af);
        	}

        	if (listaf != null && listaf.size() > 0) {
        		StringBuilder refCodes = new StringBuilder();
        		StringBuilder reasons = new StringBuilder();
        		BigDecimal amount = BigDecimal.ZERO;

        		for (Refund a : listaf) {
        			if (!StringUtils.isEmpty(a.getRefCode())) {
        				refCodes.append(a.getRefCode() +", ");
        			} 
        			if (!StringUtils.isEmpty(a.getPayReason())) {
        				reasons.append(a.getPayReason() +", ");
        			} 
        			amount = amount.add(a.getTotal());
        		}
        		
        		//remove the last comma
        		String ref = refCodes.length() < 2 ? "" : refCodes.toString().substring(0, refCodes.length()-2);
        		String rea = reasons.length() < 2 ? "" : reasons.toString().substring(0, reasons.length()-2);
        		BeanUtils.copyProperties(listaf.get(0), refund);
        		refund.setRefCode(ref);
        		refund.setPayReason(rea);
        		refund.setTotal(amount);
        		refund.setMultipleIds(idStr);
        	}
        } else {
    		 //load user
    		 if (customer != null){
    			 refund = new Refund();
    			 refund.setEmployee(customer);
    		 }
        }
        refundManager.updateChilds(refund);
        return refund;
    }
    //users/refund
    @RequestMapping(method = RequestMethod.GET, value=URLReference.REFUND_FORM)
    public ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        ModelAndView mav = new ModelAndView(URLReference.REFUND_FORM);
        Refund refund = this.loadRefundByRequest(request);
        if (refund == null){
        	Locale locale = request.getLocale();
        	saveMessage(request, getText("offerPrice.error.wrongCustomer", locale));
        }
        
        if(refund.getIsAdmin() != null && refund.getIsAdmin()){
        	mav = new ModelAndView(URLReference.REFUND_FORM);
        	 //selection
            DocsSelection docsSelection = 
            		configurationManager.loadSelectionForDocsPage
            		(
            				ConfigurationType.MASTER_FEE,
            				ConfigurationType.FEE_NAMES
            		);
            docsSelection.getSelections().put(AELConst.SELECTION_DOCSGENERAL, docsgeneralManager.getJobForSelection());
            mav.addObject("docsSelection", docsSelection);
        }
        else{
        	//create selection
            DocsSelection docsSelection = 
            		configurationManager.loadSelectionForDocsPage(true);
            mav.addObject("docsSelection", docsSelection);
        }
        mav.addObject("refund", refund);
        return mav;
    }
 
    //users/refund
    @RequestMapping(method = RequestMethod.POST, value=URLReference.REFUND_FORM)
    public String onSubmit(Refund refund, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(refund, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.REFUND_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (refund.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
        refund.setIsAdmin(true);
        refund.setIsPhieuThu(false);
 
        if (request.getParameter("delete") != null) {
        	success = getSuccessView();
            refundManager.remove(refund.getId());
            saveMessage(request, getText("refund.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(refund, isNew, request);
        	refund = refundManager.saveWholePackage(refund);
            String key = (isNew) ? "refund.added" : "refund.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.REFUND_FORM+"?id=" + refund.getId();
        }

        return success;
    }
    @RequestMapping(method = RequestMethod.GET, value=URLReference.REFUND_FORM_DOWNLOAD)
    public void doDownload(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	Refund refund = this.loadRefundByRequest(request);
        if (refund != null && refund.getId() != null){
        	if (!refund.getIsPhieuThu() && refund.getIsAdmin()){
        		//update docsgeneral
        		if (refund.getRefunddetails() != null && !refund.getRefunddetails().isEmpty()){
        			for (Refunddetail refunddetail : refund.getRefunddetails()){
        				docsgeneralManager.updateContTruck(refunddetail.getDocs());
        			}
        		}
        		ReportUtil.dispatchReport(response, ReportTeamplates.ADVANCE_REFUND_ITEMS, ReportTeamplates.ADVANCE_REFUND_ITEMS_TEMPLATE, ReportUtil.prepareDataForRefundRequest(refund));
        	}else if (!refund.getIsPhieuThu() && !refund.getIsAdmin()){
        		//update docsgeneral
        		if (refund.getExfeetables() != null && !refund.getExfeetables().isEmpty()){
        			for (Exfeetable exfeetable : refund.getExfeetables()){
        				docsgeneralManager.updateContTruck(exfeetable.getDocsgeneral());
        			}
        		}
        		ReportUtil.dispatchReport(response, ReportTeamplates.ADVANCE_REFUND_ITEMS, ReportTeamplates.ADVANCE_REFUND_ITEMS_TEMPLATE, ReportUtil.prepareDataForJobRefundRequest(refund));
        	}
        	
        }
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.PHIEU_CHI_PRINT_REFUND)
    public @ResponseBody String phieuChiPrint(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	boolean isUNC = "1".equals(request.getParameter("unc"));
        Refund refund = this.loadRefundByRequest(request);
        request.getSession().setAttribute(SessionNames.REFUND_PRINT_PHIEU_CHI, refund);
        
        if (isUNC) {
        	return ControllerUtil.createJsonObject(VoucherType.UNC, refund, this.accountingMoneyBookManager, request);
        }
        return ControllerUtil.createJsonObject(VoucherType.PHIEUCHI, refund, this.accountingMoneyBookManager, request);
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.PHIEU_CHI_CREATE_MONEYBOOK_REFUND)
    public @ResponseBody String updateMoneyBook(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	
    	Refund refund = (Refund) request.getSession().getAttribute(SessionNames.REFUND_PRINT_PHIEU_CHI);
    	String validate = ControllerUtil.validateForm(request, VoucherType.PHIEUCHI, this.accountingMoneyBookManager);
    	if (validate.length() == 0) {
	        if (refund != null) {
		        MoneyBook mb = ControllerUtil.createMoneyBook(
		        		refund,
		    			VoucherType.PHIEUCHI,
		    			BookType.CASHBOOK,
		    			request);
			    
		    	MoneyBook moneyBook = this.accountingMoneyBookManager.insertMoneyBook(mb);
		        this.accountingMoneyBookManager.updateBasicAdvance(refund, moneyBook);
		        refund.setMoneyBook(moneyBook);
		        return "ok";
	        } 
    	} else {
    		return validate;
    	}
        return "error";
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.PHIEU_CHI_CREATE_MONEYBOOK_REFUND_UNC)
    public @ResponseBody String updateMoneyBookUNC(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	String bankId = request.getParameter("bankId");
    	
    	Refund refund = (Refund) request.getSession().getAttribute(SessionNames.REFUND_PRINT_PHIEU_CHI);
    	String validate = ControllerUtil.validateForm(request, VoucherType.PHIEUCHI, this.accountingMoneyBookManager);
    	if (validate.length() == 0) {
	        if (refund != null) {
		        MoneyBook mb = ControllerUtil.createMoneyBook(
		        		refund,
		    			VoucherType.UNC,
		    			BookType.BANKBOOK,
		    			request);
		        if (StringUtils.isNotEmpty(bankId)) {
		        	Long bId = Long.parseLong(bankId);
		        	Bank b = bankManager.get(bId);
				    mb.setBank(b);
		        }
			    
		    	MoneyBook moneyBook = this.accountingMoneyBookManager.insertMoneyBook(mb);
		        this.accountingMoneyBookManager.updateBasicAdvance(refund, moneyBook);
		        refund.setMoneyBook(moneyBook);
		        return "ok";
	        } 
    	} else {
    		return validate;
    	}
        return "error";
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.PHIEU_CHI_DOWNLOAD_REFUND)
    public void phieuChiDownload(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
        
    	Refund refund = (Refund) request.getSession().getAttribute(SessionNames.REFUND_PRINT_PHIEU_CHI);
    	String fileName = "Phieuchi" + refund.getMoneyBook().getVoucherNo() + ".xlsx";
        if (refund != null){
        	ReportUtil.dispatchReport(
    			response, 
    			fileName,
    			ReportTeamplates.PHIEU_CHI_ITEMS_TEMPLATE, 
    			ReportUtil.prepareDataForPhieuChi(refund));
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.REFUND_JOB_FORM)
    public ModelAndView showFormRefundJob(HttpServletRequest request)
    throws Exception {
        ModelAndView mav = new ModelAndView(URLReference.REFUND_JOB_FORM);
        Locale locale = request.getLocale();
        Refund refund = this.loadRefundByRequest(request);
        if (refund == null){
        	saveMessage(request, getText("offerPrice.error.wrongCustomer", locale));
        } else {
        	refund.setIsContainDuplicated(exfeetableManager.updateDuplicated(refund.getExfeetables()));
        	if (refund.getIsContainDuplicated()){
        		saveError(request, getText("errors.duplicatedFee", locale));
        	}
        }
        mav.addObject("refund", refund);
        //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.MASTER_FEE,
        				ConfigurationType.FEE_NAMES
        		);
        docsSelection.getSelections().put(AELConst.SELECTION_DOCSGENERAL, docsgeneralManager.getJobForSelection());
        mav.addObject("docsSelection", docsSelection);
        return mav;
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.REFUND_JOB_FORM)
    public String onSubmitJob(Refund refund, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(refund, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.REFUND_JOB_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (refund.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
        refund.setIsAdmin(false);
        refund.setIsPhieuThu(false);
 
        if (request.getParameter("delete") != null) {
        	success = getSuccessView();
            refundManager.remove(refund.getId());
            saveMessage(request, getText("refund.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(refund, isNew, request);
        	refund = refundManager.saveWholePackage(refund);
            String key = (isNew) ? "refund.added" : "refund.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.REFUND_JOB_FORM+"?id=" + refund.getId();
        }
 
        return success;
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.REFUND_JOB_FORM_DOWNLOAD)
    public void doDownloadPhieuChiRefundJob(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	 Refund refundForm = this.loadRefundByRequest(request);
	        if (refundForm != null){
	        	ReportUtil.dispatchReport(response, ReportTeamplates.PHIEU_CHI_ITEMS,ReportTeamplates.PHIEU_CHI_ITEMS_TEMPLATE, ReportUtil.prepareDataForPhieuThu(refundForm));
	        }
	        
    }
}

