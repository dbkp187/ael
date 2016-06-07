package com.vn.ael.webapp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.NhathauType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.persistence.manager.OfferItemManager;
import com.vn.ael.persistence.manager.OfferPriceManager;
import com.vn.ael.persistence.manager.TruckingserviceManager;
import com.vn.ael.webapp.util.ConvertUtil;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
@RequestMapping(URLReference.TRUCKING_SERVICE+"*")
public class TruckingFormController extends BaseFormController {

	private NhathauManager nhathauManager;
	
	@Autowired
	private void setNhauthauManager(NhathauManager nhathauManager){
		this.nhathauManager = nhathauManager;
	}
	
	private DocsgeneralManager docsgeneralManager = null;
	 
    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }
    
    private TruckingserviceManager truckingserviceManager = null;
	 
    @Autowired
    public void setTruckingserviceManager(final TruckingserviceManager truckingserviceManager) {
        this.truckingserviceManager = truckingserviceManager;
    }
    
    public TruckingFormController() {
        setCancelView("redirect:"+URLReference.TRUCKING_LIST);
        setSuccessView("redirect:"+URLReference.TRUCKING_LIST);
    }
 
    
    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("docId");
        ModelAndView mav = new ModelAndView(URLReference.TRUCKING_SERVICE);
        Truckingservice truckingservice = null;
        if (!StringUtils.isBlank(id)) {
        	//load docsgeneral
        	Docsgeneral docsgeneral = docsgeneralManager.find(id);
        	truckingservice = truckingserviceManager.createFromDocsgeneral(docsgeneral);
        }
        if (truckingservice == null){
        	Locale locale = request.getLocale();
        	saveMessage(request, getText("truckingservice.error.wrongDocsgenral", locale));
        }else{
        	 mav.addObject("contsealsSelection", EntityUtil.fromContseals(truckingservice.getDocsgeneral().getContseals()));
        }
        mav.addObject("truckingservice", truckingservice);
        //create selection
        mav.addObject("selections", configurationManager.createSelections(ConfigurationType.DOCS_SHIPPING_LINE, ConfigurationType.MASTER_FEE,ConfigurationType.FEE_NAMES));
        mav.addObject("nhathaus", EntityUtil.fromNhathauList2Map(nhathauManager.findByType(null)));
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(Truckingservice truckingservice, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(truckingservice, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.TRUCKING_SERVICE;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (truckingservice.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
        	log.debug("Delete delivery: actualy set delivery = 0, truckingservice.getId(): " + truckingservice.getId());
        	success = "redirect:"+URLReference.TRUCKING_LIST;
            
        	if (truckingservice.getId() != null) {
        		truckingserviceManager.remove(truckingservice.getId());
        	}
            docsgeneralManager.updateDelivery(truckingservice.getDocsgeneral());
            saveMessage(request, getText("truckingservice.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(truckingservice, isNew, request);
        	docsgeneralManager.updateAccounting(truckingservice.getDocsgeneral());
        	truckingserviceManager.saveWholePackage(truckingservice);
            String key = (isNew) ? "truckingservice.added" : "truckingservice.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.TRUCKING_SERVICE+"?docId=" + truckingservice.getDocsgeneral().getId();
        }
 
        return success;
    }
    //Add by Phuc
    @RequestMapping(method = RequestMethod.GET, value=URLReference.TRUCKING_SERVICE_DOWNLOAD)
    public void doDownload(HttpServletRequest request,  HttpServletResponse response)
    	    throws Exception {
    	String id = request.getParameter("id");
    	User customer = getUserManager().getLoggedUser(request);
    	Truckingservice truckingservice = null;
    	if (!StringUtils.isBlank(id)) {
    		//load docsgeneral
        	Docsgeneral docsgeneral = docsgeneralManager.find(id);
        	truckingservice = truckingserviceManager.createFromDocsgeneral(docsgeneral);
        	ReportUtil.dispatchReport(response, ReportTeamplates.ADVANCE_REFUND_ITEMS, ReportTeamplates.ADVANCE_REFUND_ITEMS_TEMPLATE, ReportUtil.prepareDataForRefundTrucking(truckingservice, customer));
    	}
    }
    //End Add by Phuc
}

