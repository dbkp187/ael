package com.vn.ael.webapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.NhathauType;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.Docservice;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.ContsealManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.DocserviceManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.persistence.manager.PackageinfoManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class PackageinfoFormController extends BaseFormController {

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
	
	private DocserviceManager docserviceManager = null;
	 
    @Autowired
    public void setDocserviceManager(final DocserviceManager docserviceManager) {
        this.docserviceManager = docserviceManager;
    }
    
	private CustomerManager customerManager = null;
	 
    @Autowired
    public void setCustomerManager(final CustomerManager customerManager) {
        this.customerManager = customerManager;
    }
    
    private PackageinfoManager packageinfoManager = null;
	 
    @Autowired
    public void setPackageinfoManager(final PackageinfoManager packageinfoManager) {
        this.packageinfoManager = packageinfoManager;
    }
    
    private ContsealManager contsealManager = null;
	 
    @Autowired
    public void setContsealManager(final ContsealManager contsealManager) {
        this.contsealManager = contsealManager;
    }
    
    private DocsgeneralManager docsgeneralManager;
    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }
    
 
    public PackageinfoFormController() {
        setCancelView("redirect:"+URLReference.PACKAGEINFO_LIST);
        setSuccessView("redirect:"+URLReference.PACKAGEINFO_LIST);
    }
    
    /**
     * 
     * @param request
     * @return
     */
    private Packageinfo loadPackgageByRequest(HttpServletRequest request){
    	 String id = request.getParameter("id");
         Packageinfo packageInfo = null;
         if (!StringUtils.isBlank(id)) {
         	packageInfo= packageinfoManager.get(new Long(id));
         }else{
         	packageInfo= new Packageinfo();
         }
         docsgeneralManager.updateChilds(packageInfo.getDocsgeneral());
         return packageInfo;
    }
 
    @RequestMapping(method = RequestMethod.GET, value=URLReference.PACKAGEINFO_FORM)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
    	Packageinfo packageInfo = this.loadPackgageByRequest(request);
    	if (packageInfo != null ){
    		packageInfo.getDocsgeneral().setIsContainDuplicated(exfeetableManager.updateDuplicated(packageInfo.getDocsgeneral().getExfeetables()));
    		if (packageInfo.getDocsgeneral().getIsContainDuplicated()){
    			saveError(request, getText("errors.duplicatedFee", request.getLocale()));
    		}
    	}
        ModelAndView mav = new ModelAndView(URLReference.PACKAGEINFO_FORM);
        mav.addObject("packageInfo", packageInfo);
        //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_CODE_IME,
        				ConfigurationType.DOCS_TYPE_OF_TRANSPORT,
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_COLOUR_APPLYING,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT,
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER_CONT,
        				ConfigurationType.SALE_SERVICES,
        				ConfigurationType.MASTER_FEE,
        				ConfigurationType.FEE_NAMES
        		);
        mav.addObject("shippings", docsSelection);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("hangtaus", EntityUtil.fromNhathauList2Map(nhathauManager.findByType(NhathauType.HANGTAU)));
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST,value=URLReference.PACKAGEINFO_FORM)
    public String onSubmit(Packageinfo packageInfo, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(packageInfo, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.PACKAGEINFO_FORM;
            }
        }
 
        log.debug("entering 'onSubmit' method...");
 
        boolean isNew = (packageInfo.getId() == null);
        String success = getSuccessView();
        Locale locale = request.getLocale();
 
        if (request.getParameter("delete") != null) {
            packageinfoManager.deleteWholePackage(packageInfo);
            saveMessage(request, getText("packageInfo.deleted", locale));
        } else {
        	getEntityService().checkUpdateInfo(packageInfo, isNew, request);
        	EntityUtil.updateFilesUpload(packageInfo.getDocsgeneral().getAttachments(), request,AELConst.ATTACHMENT_PREFIX_DOCS);
        	docsgeneralManager.checkToDeleteChilds(packageInfo.getDocsgeneral());
        	packageInfo = packageinfoManager.saveWholePackage(packageInfo);
            String key = (isNew) ? "packageInfo.added" : "packageInfo.updated";
            saveMessage(request, getText(key, locale));
            success = "redirect:"+URLReference.PACKAGEINFO_FORM+"?id=" + packageInfo.getId();
        }
 
        return success;
    }

    @RequestMapping(method=RequestMethod.GET, value =URLReference.AJAX_REPORT_BIENBAN)
    public void doDownload(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
    		Packageinfo packageInfo = this.loadPackgageByRequest(request);
    		if(packageInfo!=null){
        		//offer the user the option of opening or downloading the resulting Excel file
    			ReportUtil.dispatchReport(response, ReportTeamplates.PACK_INFO_BIENBAN, ReportTeamplates.PACK_INFO_BIENBAN_TEMPLATE, ReportUtil.prepareDataForBienbangiaohang(packageInfo));
    	    }
    }
}

