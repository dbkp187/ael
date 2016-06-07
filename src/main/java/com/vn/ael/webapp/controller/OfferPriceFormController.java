package com.vn.ael.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.OfferPriceManager;
import com.vn.ael.webapp.dto.OfferItemExportModel;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class OfferPriceFormController extends BaseFormController {

	private OfferPriceManager offerpriceManager = null;
	 
    @Autowired
    public void setOfferpriceManager(final OfferPriceManager offerpriceManager) {
        this.offerpriceManager = offerpriceManager;
    }
    
    private CustomerManager customerManager = null;
	 
    @Autowired
    public void setCustomerManager(final CustomerManager customerManager) {
        this.customerManager = customerManager;
    }
 
    public OfferPriceFormController() {
        setCancelView("redirect:"+URLReference.OFFERPRICE_LIST);
        setSuccessView("redirect:"+URLReference.OFFERPRICE_LIST);
    }
 
    /**
     * Based on request parameter, load offers
     * @param request
     * @return
     */
    private OfferPrice loadOffersByRequest(HttpServletRequest request){
    	String id = request.getParameter("id");
    	OfferPrice offerPrice = null;
        if (!StringUtils.isBlank(id)) {
        	offerPrice = offerpriceManager.get(new Long(id));
        }else{
        	id = request.getParameter("customerId");
        	 if (!StringUtils.isBlank(id)) {
        		 //load customer
        		 Customer customer = customerManager.find(id);
        		 if (customer != null){
        			 offerPrice = new OfferPrice();
        			 offerPrice.setCustomer(customer);
        		 }
        	 }
        }
        offerpriceManager.updateChilds(offerPrice);
        return offerPrice;
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.OFFERPRICE_FORM)
    public ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        ModelAndView mav = new ModelAndView(URLReference.OFFERPRICE_FORM);
        OfferPrice offerPrice = this.loadOffersByRequest(request);
        if (offerPrice == null){
        	Locale locale = request.getLocale();
        	saveMessage(request, getText("offerPrice.error.wrongCustomer", locale));
        }
        mav.addObject("offerPrice", offerPrice);
        //create selection
        mav.addObject("selections", configurationManager.createSelections(ConfigurationType.SALE_SERVICES,
        		ConfigurationType.UNIT, ConfigurationType.CURRENCY));
        mav.addObject("services", ServicesType.getUsageMap());
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST, value=URLReference.OFFERPRICE_FORM)
    public String onSubmit(OfferPrice offerPrice, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(offerPrice, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.OFFERPRICE_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (offerPrice.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
        	success = "redirect:"+URLReference.CUSTOMER_FORM+"?id=" + offerPrice.getCustomer().getId();
            offerpriceManager.remove(offerPrice.getId());
            saveMessage(request, getText("offerPrice.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(offerPrice, isNew, request);
        	if (!isNew){
        		offerPrice.setCustomer(customerManager.get(offerPrice.getCustomer().getId()));
        	}
        	EntityUtil.updateFilesUpload(offerPrice.getAttachments(), request);
        	offerpriceManager.saveWholePackage(offerPrice);
            String key = (isNew) ? "offerPrice.added" : "offerPrice.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.OFFERPRICE_FORM+"?id=" + offerPrice.getId();
        }
 
        return success;
    }
    
    @RequestMapping(method=RequestMethod.GET, value =URLReference.AJAX_REPORT_SALES)
    public void doDownload(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
    		OfferPrice offerPrice = this.loadOffersByRequest(request);
    		if(offerPrice!=null){
        		//offer the user the option of opening or downloading the resulting Excel file
    			ReportUtil.dispatchReport(response, ReportTeamplates.SALES_OFFER_ITEMS, ReportTeamplates.SALES_OFFER_ITEMS_TEMPLATE, ReportUtil.prepareDataForOffers(offerPrice));
    	    }
    }
    
}

