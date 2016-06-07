package com.vn.ael.webapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.appfuse.model.User;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.BookType;
import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.SessionNames;
import com.vn.ael.constants.URLReference;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.MoneyBook;
import com.vn.ael.persistence.manager.AccountingMoneyBookManager;
import com.vn.ael.persistence.manager.AdvanceFormManager;
import com.vn.ael.persistence.service.PermissionCheckingService;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.util.ControllerUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class AdvanceFormController extends BaseFormController {

	private PermissionCheckingService permissionCheckingService;
	
	@Autowired
	public void setPermissionChecking(PermissionCheckingService permissionCheckingService){
		this.permissionCheckingService = permissionCheckingService;
		
	}
	
	private AdvanceFormManager advanceFormManager;
	
	private AccountingMoneyBookManager accountingMoneyBookManager;
	
	@Autowired
	public void setAdvanceFormManager(AdvanceFormManager advanceFormManager){
		this.advanceFormManager = advanceFormManager;
		
	}
	
	@Autowired
	public void setAccountingMoneyBookManager(AccountingMoneyBookManager accountingMoneyBookManager){
		this.accountingMoneyBookManager = accountingMoneyBookManager;
		
	}
	
    public AdvanceFormController() {
        setCancelView("redirect:"+URLReference.ADVANCE_REFUNDS);
        setSuccessView("redirect:"+URLReference.ADVANCE_REFUNDS);
    }
 
    /**
     * Based on request parameter, load offers
     * @param request
     * @return
     */
    private Advanceform loadAdvancesByRequest(HttpServletRequest request){
    	String idStr = request.getParameter("id");
    	User customer = getUserManager().getLoggedUser(request);
    	Advanceform advanceform = new Advanceform();
    	List<Advanceform> listaf = new ArrayList<Advanceform>();
        if (!StringUtils.isBlank(idStr)) {
        	String[] ids = idStr.split(",");
        	for (String id : ids) {
        		Advanceform af = new Advanceform();
        		af = advanceFormManager.get(new Long(id));
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

        		for (Advanceform a : listaf) {
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
        		BeanUtils.copyProperties(listaf.get(0), advanceform);
        		advanceform.setRefCode(ref);
        		advanceform.setPayReason(rea);
        		advanceform.setTotal(amount);
        		advanceform.setMultipleIds(idStr);
        	}
        } else {
    		 //load user
    		 if (customer != null){
    			 advanceform = new Advanceform();
    			 advanceform.setEmployee(customer);
    		 }
        }
        advanceFormManager.updateChilds(advanceform);
        return advanceform;
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ADVANCE_FORM)
    public ModelAndView showForm(HttpServletRequest request, @RequestParam(value="isAdmin", required= false) Boolean isAdmin)
    throws Exception {
        ModelAndView mav = new ModelAndView(URLReference.ADVANCE_FORM);
        Advanceform advanceform = this.loadAdvancesByRequest(request);
        if (advanceform == null){
        	Locale locale = request.getLocale();
        	saveMessage(request, getText("offerPrice.error.wrongCustomer", locale));
        }
        if (advanceform != null && advanceform.getId() == null){
        	 advanceform.setIsAdmin(isAdmin);
        }
        mav.addObject("advanceform", advanceform);
        //create selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage(true);
        mav.addObject("docsSelection", docsSelection);
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ADVANCE_FORM)
    public String onSubmit(Advanceform advanceform, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(advanceform, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.ADVANCE_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (advanceform.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
        	success = getSuccessView();
            advanceFormManager.remove(advanceform.getId());
            saveMessage(request, getText("advanceform.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(advanceform, isNew, request);
        	advanceform = advanceFormManager.saveWholePackage(advanceform);
            String key = (isNew) ? "advanceform.added" : "advanceform.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.ADVANCE_FORM+"?id=" + advanceform.getId();
        }
 
        return success;
    }
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ADVANCE_FORM_DOWNLOAD)
    public void doDownload(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	        Advanceform advanceform = this.loadAdvancesByRequest(request);
    	        Map<Integer, BigDecimal> listRemainAdvancebyJob = new HashMap<Integer, BigDecimal>();
    	        if (advanceform != null){
    	        	if (!advanceform.getAdvancedetails().isEmpty()) {
						for (Advancedetail adv : advanceform.getAdvancedetails()) {
							BigDecimal val = BigDecimal.ZERO;
							try {
								val = this.advanceFormManager.calculateRemainAdvance(adv.getDocs().getId(),adv.getAdvanceform().getEmployee().getId(), advanceform.getDate(), advanceform.getId());
								listRemainAdvancebyJob.put(adv.getDocs().getId().intValue(), val);
							} catch (Exception e) {
								// TODO: handle exception
								log.error("ERROR: FAILED TO GET REMAIN ADVANCE");
							}						
						}
					}
    	        	ReportUtil.dispatchReport(response, ReportTeamplates.ADVANCE_REQUEST_ITEMS, ReportTeamplates.ADVANCE_REQUEST_ITEMS_TEMPLATE, ReportUtil.prepareDataForAdvanceRequest(advanceform, listRemainAdvancebyJob));
    	        }
    	    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.PHIEU_CHI_PRINT_ADVANCE_FORM)
    public @ResponseBody String phieuChiPrint(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
        Advanceform advanceform = this.loadAdvancesByRequest(request);
        request.getSession().setAttribute(SessionNames.ADVANCE_FORM_PRINT_PHIEU_CHI, advanceform);
        return ControllerUtil.createJsonObject(VoucherType.PHIEUCHI, advanceform, this.accountingMoneyBookManager, request);
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.PHIEU_CHI_CREATE_MONEYBOOK_ADVANCE_FORM)
    public @ResponseBody String updateMoneyBook(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
    	
    	Advanceform advanceform = (Advanceform) request.getSession().getAttribute(SessionNames.ADVANCE_FORM_PRINT_PHIEU_CHI);
    	String validate = ControllerUtil.validateForm(request, VoucherType.PHIEUCHI, this.accountingMoneyBookManager);
    	if (validate.length() == 0) {
	        if (advanceform != null) {
		        MoneyBook mb = ControllerUtil.createMoneyBook(
		        	advanceform,
		    		VoucherType.PHIEUCHI,
		    		BookType.CASHBOOK,
		    		request);
		    	MoneyBook moneyBook = this.accountingMoneyBookManager.insertMoneyBook(mb);
		        this.accountingMoneyBookManager.updateBasicAdvance(advanceform, moneyBook);
		        advanceform.setMoneyBook(moneyBook);
		        return "ok";
	        }
    	} else {
    		return validate;
    	}
        return "notok";
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.PHIEU_CHI_DOWNLOAD_ADVANCE_FORM)
    public void phieuChiDownload(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {    	 
        
    	Advanceform advanceform = (Advanceform) request.getSession().getAttribute(SessionNames.ADVANCE_FORM_PRINT_PHIEU_CHI);
    	String fileName = "Phieuchi" + advanceform.getMoneyBook().getVoucherNo() + ".xlsx";
        if (advanceform != null){
        	ReportUtil.dispatchReport(
    			response, 
    			fileName,
    			ReportTeamplates.PHIEU_CHI_ITEMS_TEMPLATE, 
    			ReportUtil.prepareDataForPhieuChi(advanceform));
        }
    }
    
   /* @RequestMapping( method = RequestMethod.GET, value = "/users/advanceForm/getRemainAdvance")
    public @ResponseBody String getList(@RequestParam(value="docIdList") String[] docIdList) {
    	Map<Long, BigDecimal> map = new HashMap<Long, BigDecimal>();
    	ObjectMapper mapper = new ObjectMapper();
    	for (String docId : docIdList) {
			try {
				Long id = Long.parseLong(docId);
				BigDecimal result = this.advanceFormManager.calculateRemainAdvance(id);
				map.put(id, result)	;		
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
    	 String json = "";
    	 try {
             json = mapper.writeValueAsString(map);
         } catch (JsonProcessingException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         return json;
    }*/
    
    @RequestMapping(value = "/users/advanceForm/getRemainAdvance", method = RequestMethod.GET)
    public @ResponseBody String processAJAXRequest(
    			@RequestParam("docIdList") String[] docIdList, @RequestParam("userId") String userId, @RequestParam("date") String date) {
    	Date advanceDate = new Date();
    	DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
    	try {
    		advanceDate = (Date)format.parse(date);  
		} catch (Exception e) {
			// TODO: handle exception
		}
    	
    	
    	Map<Long, BigDecimal> map = new HashMap<Long, BigDecimal>();
    	ObjectMapper mapper = new ObjectMapper();
    	if (docIdList.length>0) {
    		for (String docId : docIdList) {
    			try {
    				Long uId = Long.parseLong(userId);
    				Long id = Long.parseLong(docId);
    				BigDecimal result = this.advanceFormManager.calculateRemainAdvance(id, uId, advanceDate);
    				map.put(id, result)	;		
    			} catch (Exception e) {
    				// TODO: handle exception
    			}
    		}
		}    	
        String json = "";
        try {
            json = mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return json;
    	}
}

