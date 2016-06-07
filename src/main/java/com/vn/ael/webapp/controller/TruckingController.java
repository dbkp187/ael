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
import com.vn.ael.enums.ServicesType;
import com.vn.ael.enums.StatusType;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.dto.Search;

@Controller
public class TruckingController extends BaseFormController {

    private DocsgeneralManager docsgeneralManager;

    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }

    public TruckingController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.TRUCKING_LIST);
    }

    @Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.TRUCKING_LIST)
    public ModelAndView handleRequest() throws Exception {
        Model model = new ExtendedModelMap();
      //Add comment by Phuc
//      model.addAttribute(docsgeneralManager.findByDoDelivery(true));
    //End Add comment by Phuc
        Search searchTrucking = new Search();
        model.addAttribute("search", searchTrucking);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("enumStatus", StatusType.values());
        model.addAttribute("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        return new ModelAndView(URLReference.TRUCKING_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.TRUCKING_SEARCH)
	public ModelAndView searchTrucking(Search searchTrucking)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.TRUCKING_LIST);
		
		List<Docsgeneral> docsgenerals = docsgeneralManager.searchTrucking(searchTrucking);
		mav.addObject(docsgenerals);
		
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("enumStatus", StatusType.values());
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
		return mav;
	}
}

