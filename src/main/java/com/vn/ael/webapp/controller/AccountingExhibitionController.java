package com.vn.ael.webapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.TypeOfFee;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.NhathauType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.enums.StatusType;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.persistence.manager.DocsAccountingManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExhibitionManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
/*@RequestMapping(URLReference.ACCOUNTING_EXHIBITION)*/
public class AccountingExhibitionController extends BaseFormController {

	private NhathauManager nhathauManager;
	private DocsAccountingManager docsAccountingManager;
	
	@Autowired
	private void setNhauthauManager(NhathauManager nhathauManager){
		this.nhathauManager = nhathauManager;
	}
	
	private ExhibitionManager exhibitionManager = null;
	
	private DocsgeneralManager docsgeneralManager;
	
	@Autowired
	public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager, final DocsAccountingManager docsAccountingManager) {
		this.docsgeneralManager = docsgeneralManager;
		this.docsAccountingManager = docsAccountingManager;
	}

    @Autowired
    public void setExhibitionManager(final ExhibitionManager exhibitionManager) {
        this.exhibitionManager = exhibitionManager;
    }
    
    public AccountingExhibitionController() {
        setCancelView("redirect:"+URLReference.ACCOUNTING_EXHIBITION_LIST);
        setSuccessView("redirect:"+URLReference.ACCOUNTING_EXHIBITION_LIST);
    }
 
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_EXHIBITION)
    protected ModelAndView showForm(HttpServletRequest request)
    throws Exception {
        String id = request.getParameter("id");
        Exhibition exhibition = null;
        exhibition = exhibitionManager.findReportObjects(id);
        ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_EXHIBITION);
        mav.addObject("exhibition", exhibition);
        DocsSelection docsSelection = configurationManager.loadSelectionForDocsPage(
        		ConfigurationType.DOCS_TYPE_OF_TRANSPORT,
        		ConfigurationType.EXH_MASTER_FEE_REPORT,
        		ConfigurationType.EXH_FEE_NAMES_REPORT
        		);
        mav.addObject("nhathaus", EntityUtil.fromNhathauList2Map(nhathauManager.findByType(NhathauType.NHATHAU)));
        mav.addObject("docsSelection", docsSelection);
        return mav;
    }
 
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_EXHIBITION)
    public String onSubmit(Exhibition exhibition, BindingResult errors, HttpServletRequest request,
                           HttpServletResponse response)
    throws Exception {
        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }
 
        if (validator != null) { // validator is null during testing
            validator.validate(exhibition, errors);
 
            if (errors.hasErrors() && request.getParameter("delete") == null) { // don't validate when deleting
                return URLReference.ACCOUNTING_EXHIBITION;
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
        	exhibitionManager.saveWholeExhReport(exhibition);
            String key = (isNew) ? "exhibition.added" : "exhibition.updated";
            saveMessage(request, getText(key, locale));
            BigDecimal phiAel = BigDecimal.ZERO;
	        BigDecimal chiHo = BigDecimal.ZERO;
            if (exhibition.getExfeetables() != null) {
            	for (Exfeetable fee : exhibition.getExfeetables()) {
            		phiAel = phiAel.add(fee.getAmount());
            	}
            }
            
            List<Exfeetable> chihoFee = exhibitionManager.findFeeChiHo(exhibition.getId());
			if (chihoFee != null && !chihoFee.isEmpty()){
				for (Exfeetable exfeetable : chihoFee){
					if (exfeetable.getMasterFee() != null && exfeetable.getMasterFee().getId() == TypeOfFee.CHI_HO_ID){
						chiHo = chiHo.add(exfeetable.getTotal());
					}
				}
			}
            System.out.println(phiAel);
            System.out.println(chiHo);
            Docsgeneral docs = exhibitionManager.findDocsgeneral(exhibition.getId());
	        this.docsAccountingManager.updateAccounting(docs, phiAel, chiHo);
	        
            if (!isNew) {
                success = "redirect:"+URLReference.ACCOUNTING_EXHIBITION+"?id=" + exhibition.getId();
            }
        }
 
        return success;
    }
    
    @RequestMapping(method=RequestMethod.GET, value =URLReference.AJAX_REPORT_ACCOUNTING_EXHIBITION)
    public void doDownload(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
    	String id = request.getParameter("id");
        Exhibition exhibition = null;
        exhibition = exhibitionManager.findReportObjects(id);
        List<Configuration> masterFee = configurationManager.getAllByType(ConfigurationType.EXH_MASTER_FEE_REPORT, Boolean.TRUE);
        ReportUtil.dispatchExhibitionReport(response, ReportTeamplates.ACCOUNTING_EXHIBITION_ITEMS, ReportTeamplates.ACCOUNTING_EXHIBITION_ITEMS_TEMPLATE, exhibition,masterFee);
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.ACCEXHIBITION_SEARCH)
	public ModelAndView searchAccPackageInfo(Search searchAccExhibition)
			throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_EXHIBITION_LIST);
		searchAccExhibition.setServicesType(ServicesType.EXHS);
		List<Docsgeneral> docsgenerals = docsgeneralManager.searchExhibitionAccounting(searchAccExhibition);
		mav.addObject(docsgenerals);
		
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
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
		return mav;
	}
    
}

