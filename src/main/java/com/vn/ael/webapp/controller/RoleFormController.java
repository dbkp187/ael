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
import com.vn.ael.persistence.manager.RoleManager;

@Controller
@RequestMapping("/admin/roles*")
public class RoleFormController extends BaseFormController {

    private RoleManager roleManager;

    @Autowired
    public void setRoleManager(final RoleManager roleManager) {
        this.roleManager = roleManager;
    }

    public RoleFormController() {
        setCancelView("redirect:/home");
        setSuccessView("redirect:/admin/roles");
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
        model.addAttribute(roleManager.getAll());
        return new ModelAndView("admin/roleList", model.asMap());
    }

}

