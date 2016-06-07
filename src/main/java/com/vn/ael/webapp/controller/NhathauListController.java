package com.vn.ael.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.NhathauType;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.NhathauManager;

@Controller
@RequestMapping(URLReference.NHATHAU_LIST+"*")
public class NhathauListController extends BaseFormController {

	private NhathauManager nhathauManager;
	
	@Autowired
	public void setNhathauManager(NhathauManager nhathauManager){
		this.nhathauManager = nhathauManager;
	}
	
    public NhathauListController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.NHATHAU_LIST);
    }

    @Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handleRequest() throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute(nhathauManager.getAll());
        model.addAttribute("types",NhathauType.getLabelsMap());
        return new ModelAndView(URLReference.NHATHAU_LIST, model.asMap());
    }

}

