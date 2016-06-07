package com.vn.ael.webapp.controller;

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

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.NhathauType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.ExhibitionManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.util.EntityUtil;

@Controller
@RequestMapping(URLReference.EXHIBITION_FORM)
public class ExhibitionFormController extends BaseFormController {

	private NhathauManager nhathauManager;
	
	private ExfeetableManager exfeetableManager;
	
	@Autowired
	private void setExfeetableManager(ExfeetableManager exfeetableManager){
		this.exfeetableManager = exfeetableManager;
	}
	
	@Autowired
	private void setNhauthauManager(NhathauManager nhathauManager){
		this.nhathauManager = nhathauManager;
	}
	
	private ExhibitionManager exhibitionManager = null;
	
	private DocsgeneralManager docsgeneralManager;
	
	@Autowired
	public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
		this.docsgeneralManager = docsgeneralManager;
	}

    @Autowired
    public void setExhibitionManager(final ExhibitionManager exhibitionManager) {
        this.exhibitionManager = exhibitionManager;
    }
    
    public ExhibitionFormController() {
        setCancelView("redirect:"+URLReference.EXHIBITION_LIST);
        setSuccessView("redirect:"+URLReference.EXHIBITION_LIST);
    }
 
    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        Exhibition exhibition = null;
        if (!StringUtils.isBlank(id)) {
        	exhibition = exhibitionManager.findWholeObjects(id);
        }else{
        	exhibition= new Exhibition();
        }
        docsgeneralManager.updateChilds(exhibition.getDocsgeneral());
        if (exhibition != null ){
    		exhibition.getDocsgeneral().setIsContainDuplicated(exfeetableManager.updateDuplicated(exhibition.getDocsgeneral().getExfeetables()));
    		if (exhibition.getDocsgeneral().getIsContainDuplicated()){
    			saveError(request, getText("errors.duplicatedFee", request.getLocale()));
    		}
    	}
        ModelAndView mav = new ModelAndView(URLReference.EXHIBITION_FORM);
        mav.addObject("exhibition", exhibition);
        DocsSelection docsSelection = configurationManager.loadSelectionForDocsPage(
        		ConfigurationType.EXH_TYPE_OF_EXH,
        		ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        		ConfigurationType.TYPE_OF_IMPORT,
        		ConfigurationType.EXH_OPERATOR,
        		ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT,
        		ConfigurationType.DOCS_TYPE_OF_CONTAINER_CONT,
        		ConfigurationType.EXH_MASTER_FEE,
        		ConfigurationType.FEE_NAMES,
        		ConfigurationType.EXH_NAME,
        		ConfigurationType.EXH_PRODUCT_TYPE
        		);
        mav.addObject("hangtaus", EntityUtil.fromNhathauList2Map(nhathauManager.findByType(NhathauType.HANGTAU)));
        Map<String, Map<Long, String>> tempselect = docsSelection.getSelections();
        Map< Long, String> exhProType = docsSelection.getSelections().get("exhibitionProductTypes");
        docsSelection.getSelections().get("typeOfContainers").putAll(exhProType);
        mav.addObject("docsSelection", docsSelection);
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(Exhibition exhibition, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(exhibition, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.EXHIBITION_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (exhibition.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            exhibitionManager.removeWholeExh(exhibition);
            saveMessage(request, getText("exhibition.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(exhibition, isNew, request);
        	EntityUtil.updateFilesUpload(exhibition.getDocsgeneral().getAttachments(), request,AELConst.ATTACHMENT_PREFIX_DOCS);
        	docsgeneralManager.checkToDeleteChilds(exhibition.getDocsgeneral());
        	exhibition = exhibitionManager.saveWholeExh(exhibition);
            String key = (isNew) ? "exhibition.added" : "exhibition.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.EXHIBITION_FORM+"?id=" + exhibition.getId();
        }
 
        return success;
    }

}

