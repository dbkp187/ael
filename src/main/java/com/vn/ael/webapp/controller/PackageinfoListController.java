package com.vn.ael.webapp.controller;

import java.util.List;

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
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.StatusType;
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.manager.PackageinfoManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.dto.Search;

@Controller
public class PackageinfoListController extends BaseFormController {

    private PackageinfoManager packageinfoManager;

    @Autowired
    public void setPackageinfoManager(final PackageinfoManager packageinfoManager) {
        this.packageinfoManager = packageinfoManager;
    }
        
	public PackageinfoListController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.PACKAGEINFO_LIST);
    }

    @Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.PACKAGEINFO_LIST)
    public ModelAndView handleRequest(HttpServletRequest request) throws Exception {
        Model model = new ExtendedModelMap();
      //Add comment by Phuc
//      model.addAttribute(inlandManager.getAll());
    //End Add comment by Phuc
        Search searchPackageInfo = new Search();
        model.addAttribute("search", searchPackageInfo);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("enumStatus", StatusType.values());
        return new ModelAndView(URLReference.PACKAGEINFO_LIST, model.asMap());
    }
    
	@RequestMapping(method = RequestMethod.POST, value = URLReference.PACKAGEINFO_SEARCH)
	public ModelAndView searchPackageInfo(Search searchPackageInfo)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.PACKAGEINFO_LIST);
		
		List<Packageinfo> packageinfos = packageinfoManager.searchPackageInfo(searchPackageInfo);
		mav.addObject(packageinfos);

		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("enumStatus", StatusType.values());
		return mav;
	}
}

