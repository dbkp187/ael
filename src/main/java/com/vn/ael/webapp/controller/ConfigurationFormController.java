package com.vn.ael.webapp.controller;

import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.appfuse.model.User;
import org.directwebremoting.webwork.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.CustomerManager;

@Controller
public class ConfigurationFormController extends BaseFormController {

    public ConfigurationFormController() {
        setCancelView("redirect:"+URLReference.CONSTANST_LIST);
        setSuccessView("redirect:"+URLReference.CONSTANST_LIST);
    }
 
    @RequestMapping(method = RequestMethod.GET,value = URLReference.CONSTANST_FORM+"*")
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        ModelAndView mav = new ModelAndView(URLReference.CONSTANST_FORM);
        Configuration configuration;
        if (!StringUtils.isBlank(id)) {
        	configuration = configurationManager.get(new Long(id));
        }else{
        	configuration = new Configuration();
        }
 
        mav.addObject("configuration", configuration);
        mav.addObject("sericesType", ConfigurationType.getAllAsMap());
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST,value = URLReference.CONSTANST_FORM+"*")
    public String onSubmit(Configuration configuration, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(configuration, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.CONSTANST_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (configuration.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            configurationManager.remove(configuration.getId());
            saveMessage(request, getText("configuration.deleted", locale));
        } else {
        	configurationManager.saveConfig(configuration);
            String key = (isNew) ? "configuration.added" : "configuration.updated";
            saveMessage(request, getText(key, locale));
 
            if (!isNew) {
                success = "redirect:"+URLReference.CONSTANST_FORM+"?id=" + configuration.getId();
            }
        }
 
        return success;
    }
    
    @RequestMapping(method = RequestMethod.POST, value= URLReference.AJAX_ADD_CONSTANT)
    public @ResponseBody Configuration addByAjax(@RequestBody Configuration configuration,HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
    	return configurationManager.save(configuration);
    }
    
    

}

