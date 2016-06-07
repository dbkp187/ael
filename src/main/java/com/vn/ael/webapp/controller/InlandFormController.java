package com.vn.ael.webapp.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.NhathauType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.entity.Multitype;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.InlandManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.util.EntityUtil;

@Controller
public class InlandFormController extends BaseFormController {

	private ExfeetableManager exfeetableManager;
	
	@Autowired
	private void setExfeetableManager(ExfeetableManager exfeetableManager){
		this.exfeetableManager = exfeetableManager;
	}
	
	private NhathauManager nhathauManager;
	
	@Autowired
	private void setNhauthauManager(NhathauManager nhathauManager){
		this.nhathauManager = nhathauManager;
	}
	
	private InlandManager inlandManager = null;
	 
    @Autowired
    public void setInlandManager(final InlandManager inlandManager) {
        this.inlandManager = inlandManager;
    }
    
    public InlandFormController() {
        setCancelView("redirect:"+URLReference.INLAND_LIST);
        setSuccessView("redirect:"+URLReference.INLAND_LIST);
    }
    
    private DocsgeneralManager docsgeneralManager;
    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }
 
    @RequestMapping(method = RequestMethod.GET, value = URLReference.INLAND_FORM)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        Inland inland = null;
        if (!StringUtils.isBlank(id)) {
        	inland = inlandManager.find(id);
        }else{
        	inland= new Inland();
        	String type = request.getParameter("type");
			if (type != null
					&& type.equalsIgnoreCase(ServicesType.DVVT_SEALAND
							.getLabel())) {
				inland.setIsInland(false);
			} else {
				inland.setIsInland(true);
			}
        }
        docsgeneralManager.updateChilds(inland.getDocsgeneral());
        if (inland != null ){
    		inland.getDocsgeneral().setIsContainDuplicated(exfeetableManager.updateDuplicated(inland.getDocsgeneral().getExfeetables()));
    		if (inland.getDocsgeneral().getIsContainDuplicated()){
    			saveError(request, getText("errors.duplicatedFee", request.getLocale()));
    		}
    	}
        ModelAndView mav = new ModelAndView(URLReference.INLAND_FORM);
        mav.addObject("inland", inland);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.TYPE_OF_IMPORT_SEA,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT,
        				ConfigurationType.DOCS_TRANS_TYPE_OF_SER,
        				ConfigurationType.DOCS_ROUTE,
        				ConfigurationType.MASTER_FEE,
        				ConfigurationType.FEE_NAMES,
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER_CONT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("hangtaus", EntityUtil.fromNhathauList2Map(nhathauManager.findByType(NhathauType.HANGTAU)));
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST, value = URLReference.INLAND_FORM)
    public String onSubmit(Inland inland, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(inland, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.INLAND_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (inland.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            inlandManager.removeWholeInland(inland);
            saveMessage(request, getText("inland.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(inland, isNew, request);
        	EntityUtil.updateFilesUpload(inland.getDocsgeneral().getAttachments(), request,AELConst.ATTACHMENT_PREFIX_DOCS);
        	docsgeneralManager.checkToDeleteChilds(inland.getDocsgeneral());
        	inland = inlandManager.saveWholeInland(inland);
            String key = (isNew) ? "inland.added" : "inland.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.INLAND_FORM+"?id=" + inland.getId();
        }
 
        return success;
    }
    
    /**
     * 
     * @param request
     * @return
     */
    
    public @ResponseBody List<Multitype> importMultiType(HttpServletRequest request){
    	return null;
    }
    
}

