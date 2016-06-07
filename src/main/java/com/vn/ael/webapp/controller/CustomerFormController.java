package com.vn.ael.webapp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.OfferPriceManager;
import com.vn.ael.webapp.util.ConvertUtil;

@Controller
@RequestMapping(URLReference.CUSTOMER_FORM+"*")
public class CustomerFormController extends BaseFormController {

	private CustomerManager customerManager = null;
	 
    @Autowired
    public void setCustomerManager(final CustomerManager customerManager) {
        this.customerManager = customerManager;
    }
    
    private OfferPriceManager offerpriceManager = null;
	 
    @Autowired
    public void setOfferpriceManager(final OfferPriceManager offerpriceManager) {
        this.offerpriceManager = offerpriceManager;
    }
 
    public CustomerFormController() {
        setCancelView("redirect:"+URLReference.CUSTOMER_LIST);
        setSuccessView("redirect:"+URLReference.CUSTOMER_LIST);
    }
 
    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        Customer customer = null;
        List<OfferPrice> offerPrices = new ArrayList<>();
        if (!StringUtils.isBlank(id)) {
        	customer= customerManager.get(new Long(id));
        	offerPrices = offerpriceManager.findByCustomer(customer);
        }else{
        	customer= new Customer();
        }
        
        ModelAndView mav = new ModelAndView(URLReference.CUSTOMER_FORM);
        mav.addObject("customer", customer);
        mav.addObject("offerPrices", offerPrices);
        //create selection
        mav.addObject("selections", configurationManager.createSelections(ConfigurationType.COMPANY_TYPE,ConfigurationType.COUNTRY));
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(Customer customer, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(customer, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.CUSTOMER_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (customer.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            customerManager.remove(customer.getId());
            saveMessage(request, getText("customer.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(customer, isNew, request);
        	customerManager.saveCustomer(customer);
            String key = (isNew) ? "customer.added" : "customer.updated";
            saveMessage(request, getText(key, locale));
 
            if (!isNew) {
                success = "redirect:"+URLReference.CUSTOMER_FORM+"?id=" + customer.getId();
            }
        }
 
        return success;
    }

}

