package com.vn.ael.webapp.controller;

import java.util.List;

import javax.persistence.EntityManager;
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
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.persistence.manager.ExhibitionManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.dto.Search;

@Controller
public class ExhibitionListController extends BaseFormController {

	private ExhibitionManager exhibitionManager = null;
	
	private EntityManager entityManager;
	
	@Autowired
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	 
    @Autowired
    public void setExhibitionManager(final ExhibitionManager exhibitionManager) {
        this.exhibitionManager = exhibitionManager;
    }
    
    public ExhibitionListController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.EXHIBITION_LIST);
    }

    @Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.EXHIBITION_LIST)
    public ModelAndView handleRequest() throws Exception {
        Model model = new ExtendedModelMap();
        Search searchExhibition = new Search();
        model.addAttribute("search", searchExhibition);
      //Add comment by Phuc
//        model.addAttribute(exhibitionManager.getAll());
      //End Add comment by Phuc
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
        return new ModelAndView(URLReference.EXHIBITION_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.EXHIBITION_SEARCH)
	public ModelAndView search(Search searchExhibition)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.EXHIBITION_LIST);
		
		List<Exhibition> exhibitions = exhibitionManager.searchInland(searchExhibition);
		mav.addObject(exhibitions);
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT,
        				ConfigurationType.EXH_NAME
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("enumStatus", StatusType.values());
		return mav;
	}
}

