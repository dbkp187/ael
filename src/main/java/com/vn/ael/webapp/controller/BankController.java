package com.vn.ael.webapp.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.persistence.entity.Bank;
import com.vn.ael.persistence.manager.BankManager;

@Controller
public class BankController extends BaseFormController {

	private BankManager bankManager;
	
	@Autowired
	public void setBankManager(BankManager bankManager){
		this.bankManager = bankManager;
	}
	
    public BankController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.BANK_LIST);
    }
    
    @RequestMapping(method = RequestMethod.GET, value = URLReference.BANK_LIST)
    public ModelAndView handleRequest() throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute(bankManager.getAll());
        return new ModelAndView(URLReference.BANK_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value = URLReference.BANK_FORM)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        ModelAndView mav = new ModelAndView(URLReference.BANK_FORM);
        Bank bank = null;
        if (!StringUtils.isBlank(id)) {
        	bank = bankManager.get(new Long(id));
        } else {
        	bank = new Bank();
        }
        mav.addObject("bank", bank);     
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST, value = URLReference.BANK_FORM)
    public String onSubmit(Bank bank, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        log.debug("entering 'onSubmit' method...");
 
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            bankManager.remove(bank.getId());
            saveMessage(request, getText("bank.deleted", locale));
        } else {
        	bank = bankManager.save(bank);
            success = "redirect:"+URLReference.BANK_LIST;
        }
 
        return success;
    }

}

