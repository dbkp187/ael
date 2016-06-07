package com.vn.ael.webapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Nhathau;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.persistence.manager.ContsealManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.persistence.manager.TruckingserviceManager;
import com.vn.ael.webapp.dto.AccountingTrans;
import com.vn.ael.webapp.dto.AccountingTransCondition;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.formatter.FormatterUtil;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class AccountingNhathauController extends BaseFormController{
	
	private NhathauManager nhathauManager = null;
	
	private TruckingserviceManager truckingserviceManager;
	
	private ExfeetableManager exfeetableManager;
	
	private DocsgeneralManager docsgeneralManager;
		
	@Autowired
	public void setExfeetableManager(ExfeetableManager exfeetableManager) {
		this.exfeetableManager = exfeetableManager;
	}
	
	private ContsealManager contsealManager;

    public AccountingNhathauController() {
    	setCancelView("redirect:"+URLReference.ACCOUNTING_NHATHAU_LIST);
        setSuccessView("redirect:"+URLReference.ACCOUNTING_NHATHAU_LIST);
	}
        
    @Autowired
	public void setNhathauManager(NhathauManager nhathauManager) {
		this.nhathauManager = nhathauManager;
	}    
        
    @Autowired
	public void setTruckingserviceManager(
			TruckingserviceManager truckingserviceManager) {
		this.truckingserviceManager = truckingserviceManager;
	}

    @Autowired
	public void setContsealManager(ContsealManager contsealManager) {
		this.contsealManager = contsealManager;
	}    

    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }

	@RequestMapping(method = RequestMethod.GET, value = URLReference.ACCOUNTING_NHATHAU_SEARCH)
    protected ModelAndView showForm(HttpServletRequest request, AccountingTransCondition accountingTransCondition)
    throws Exception {
        ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_NHATHAU_LIST);        
        AccountingTrans accountingTrans = this.setUpdata(request, accountingTransCondition);
        List<Nhathau> nhathaus = new ArrayList<>();
        //list nhathau id after fetch
        Set<Long> nhathauIds = new HashSet<>();
        //get distinct nhathau
        if(accountingTrans.getTruckingdetails() != null && !accountingTrans.getTruckingdetails().isEmpty()){
        	for (Truckingdetail truckingdetail : accountingTrans.getTruckingdetails()) {
				nhathauIds.add(truckingdetail.getNhathau().getId());
			}
        	for (Long id : nhathauIds) {
        		Nhathau nhathau = nhathauManager.get(id);
        		nhathaus.add(nhathau);
			}
        }
        mav.addObject("conditions", accountingTransCondition);
        mav.addObject("listNhathau", nhathaus);
        mav.addObject("accountingNhathau", accountingTrans);
        mav.addObject("nhathauList", nhathauManager.getAll());
        mav.addObject("jobList", docsgeneralManager.getAllJob());
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        mav.addObject("docsSelection", docsSelection);
        return mav;
    }	
	
	@RequestMapping(method = RequestMethod.GET, value = URLReference.ACCOUNTING_NHATHAU_DETAIL)
    protected ModelAndView nhathauDetail(HttpServletRequest request)
    throws Exception {
		String dateStart = request.getParameter("startDate");
		String dateEnd = request.getParameter("endDate");
		String nhathauId = request.getParameter("nhathauId");
		String customerId = request.getParameter("customerId");
		Long idNT = null;
		Long idCus = null;
		if(nhathauId != null && !"".equals(nhathauId)){
			idNT = Long.valueOf(nhathauId);
		}
		if(customerId != null && !"".equals(customerId)){
			idCus = Long.valueOf(customerId);
		}
		if(dateStart != null){
			dateStart = dateStart.replace("%2F", "/");
		}
		if(dateEnd != null){
			dateEnd = dateEnd.replace("%2F", "/");
		}
		Date startDate = FormatterUtil.parseDateTime(dateStart);
        Date endDate = FormatterUtil.parseDateTime(dateEnd);
		AccountingTransCondition accountingTransCondition = new AccountingTransCondition();
		accountingTransCondition.setNhathauId(idNT);
		accountingTransCondition.setStartDate(startDate);
		accountingTransCondition.setEndDate(endDate);
		accountingTransCondition.setCustomerId(idCus);
		accountingTransCondition.setJob(request.getParameter("job"));
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_NHATHAU_DETAIL);        
        AccountingTrans accountingTrans = this.setUpdata(request, accountingTransCondition);
        mav.addObject("accountingNhathau", accountingTrans);
        mav.addObject("selections", configurationManager.createSelections(ConfigurationType.DOCS_SHIPPING_LINE, ConfigurationType.MASTER_FEE,ConfigurationType.FEE_NAMES));
        return mav;
    }	

	@RequestMapping(method = RequestMethod.POST, value = URLReference.ACCOUNTING_NHATHAU)
    public String onSubmit(AccountingTrans accountingTrans, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(accountingTrans, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.ACCOUNTING_NHATHAU;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        String success = getSuccessView();
        Locale locale = request.getLocale();
        truckingserviceManager.saveTruckingdetail(accountingTrans.getTruckingdetails());
        
        String key = "accountingnhathau.updated";
        saveMessage(request, getText(key, locale));
        
        /*String startDate = FormatterUtil.formatDate(accountingTrans.getCondition().getStartDate());        
        String endDate = FormatterUtil.formatDate(accountingTrans.getCondition().getEndDate());
        success = "redirect:"+URLReference.ACCOUNTING_NHATHAU+"?nhathauId=" + accountingTrans.getCondition().getNhathauId() + 
        		"&customerId=" + accountingTrans.getCondition().getCustomerId() +
        		"&job=" + accountingTrans.getCondition().getJob() + 
        		"&startDate=" + startDate +
        		"&endDate=" + endDate;
        success = success.replace("null", "");
        return success;*/
        
        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
    }
	
	/**
	 * Prepare data for nhathay
	 * @param request
	 * @return
	 */
	private AccountingTrans setUpdata(HttpServletRequest request, AccountingTransCondition accountingTransCondition){
		//Set up command
        List<Truckingdetail> truckdetails = new ArrayList<>();
        List<Exfeetable> exfeetables = new ArrayList<>();
        
        List<Truckingdetail> truckingdetails = this.truckingserviceManager.searchNhathau(accountingTransCondition);
        if(truckingdetails != null && !truckingdetails.isEmpty()){        	
        	for (Truckingdetail truckingdetail : truckingdetails) {
        		BigDecimal total = BigDecimal.ZERO;
        		//set phuthu into fee
        		if(truckingdetail.getPhuthu() != null){
        			total = total.add(truckingdetail.getPhuthu());
        		}
        		exfeetables = exfeetableManager.findByTruckingdetail(truckingdetail.getId());
        		if(exfeetables != null && !exfeetables.isEmpty()){
        			for (Exfeetable exfeetable : exfeetables) {
        				if(exfeetable.getTotal() != null){
        					total = total.add(exfeetable.getTotal());
        				}
					}
        		}
        		truckingdetail.setTotal(total);
        		truckingdetail.setExfeetables(exfeetables);
        		//set no cont
        		Truckingservice truckingservice = truckingdetail.getTruckingservice();
				if(truckingservice != null){
					Docsgeneral docsgeneral = truckingservice.getDocsgeneral();
					if(docsgeneral != null){
						List<Contseal> contseals = contsealManager.findByDocsgeneral(docsgeneral);
						docsgeneral.setContseals(contseals);
						EntityUtil.countCont(contseals, docsgeneral);
						truckingservice.setDocsgeneral(docsgeneral);
						truckingdetail.setTruckingservice(truckingservice);
					}
				}
        		truckdetails.add(truckingdetail);
			}
        }
        
        AccountingTrans accountingTrans = new AccountingTrans();
        accountingTrans.setNhathau(accountingTransCondition.getNhathauId() != null ? nhathauManager.get(accountingTransCondition.getNhathauId()) : null);
        accountingTrans.setCondition(accountingTransCondition);
        accountingTrans.setTruckingdetails(truckdetails);
        return accountingTrans;
	}
	
	 @RequestMapping(method=RequestMethod.GET, value =URLReference.AJAX_REPORT_ACCOUNTING_NHATHAU)
	    public void doDownload(HttpServletRequest request, HttpServletResponse response,
	            AccountingTransCondition accountingTransCondition) throws IOException {
	    	AccountingTrans accountingTrans = this.setUpdata(request, accountingTransCondition);
	       if (accountingTrans!=null) {
	    	   ReportUtil.dispatchReport(response, ReportTeamplates.ACCOUNTING_NHATHAU_ITEMS, ReportTeamplates.ACCOUNTING_NHATHAU_ITEMS_TEMPLATE, ReportUtil.prepareDataForBangKeNhaThau(accountingTrans));
	       }
	    }
}
