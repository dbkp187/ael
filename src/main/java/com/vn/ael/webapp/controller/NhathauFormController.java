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
import com.vn.ael.enums.NhathauType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.Nhathau;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.persistence.manager.OfferItemManager;
import com.vn.ael.persistence.manager.OfferPriceManager;
import com.vn.ael.webapp.util.ConvertUtil;

@Controller
@RequestMapping(URLReference.NHATHAU_FORM+"*")
public class NhathauFormController extends BaseFormController {

	private NhathauManager nhathauManager = null;
	 
    @Autowired
    public void setOfferpriceManager(final NhathauManager nhathauManager) {
        this.nhathauManager = nhathauManager;
    }
    
    public NhathauFormController() {
        setCancelView("redirect:"+URLReference.NHATHAU_LIST);
        setSuccessView("redirect:"+URLReference.NHATHAU_LIST);
    }
 
    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        ModelAndView mav = new ModelAndView(URLReference.NHATHAU_FORM);
        Nhathau nhathau = null;
        if (!StringUtils.isBlank(id)) {
        	nhathau = nhathauManager.get(new Long(id));
        }else{
        	nhathau = new Nhathau();
        }
        if (nhathau == null){
        	Locale locale = request.getLocale();
        	saveMessage(request, getText("nhathau.error.wrongCustomer", locale));
        }
        mav.addObject("nhathau", nhathau);
        mav.addObject("types",NhathauType.getLabelsMap());        
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(Nhathau nhathau, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(nhathau, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.NHATHAU_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (nhathau.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            nhathauManager.remove(nhathau.getId());
            saveMessage(request, getText("nhathau.deleted", locale));
        } else {
        	nhathau = nhathauManager.save(nhathau);
            String key = (isNew) ? "nhathau.added" : "nhathau.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.NHATHAU_FORM+"?id=" + nhathau.getId();
        }
 
        return success;
    }

}
