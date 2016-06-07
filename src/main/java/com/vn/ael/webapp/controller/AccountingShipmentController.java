package com.vn.ael.webapp.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.URLReference;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.TruckingserviceManager;
import com.vn.ael.webapp.dto.AccountingTrans;
import com.vn.ael.webapp.dto.AccountingTransCondition;
import com.vn.ael.webapp.util.ConvertUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class AccountingShipmentController extends BaseFormController{

	private DocsgeneralManager docsgeneralManager;
	
	private ExfeetableManager exfeetableManager;
	
	private TruckingserviceManager truckingserviceManager;
	
	@Autowired
	public void setExfeetableManager(ExfeetableManager exfeetableManager) {
		this.exfeetableManager = exfeetableManager;
	}

	@Autowired
	public void setDocsgeneralManager(DocsgeneralManager docsgeneralManager) {
		this.docsgeneralManager = docsgeneralManager;
	}

	@Autowired
	public void setTruckingserviceManager(
			TruckingserviceManager truckingserviceManager) {
		this.truckingserviceManager = truckingserviceManager;
	}

	@RequestMapping(method = RequestMethod.GET, value=URLReference.AJAX_REPORT_ACCOUNTING_SHIPMENT)
    protected void doDownloadShipment(AccountingTransCondition accountingTransCondition, HttpServletRequest request,HttpServletResponse response)
    throws Exception {
		AccountingTrans accountingTrans = this.setUpDataShipment(request, accountingTransCondition);
	       if (accountingTrans!=null) {
	    		   ReportUtil.dispatchReport(response, ReportTeamplates.ACCOUNTING_KHVT_SHIPMENT_ITEMS, ReportTeamplates.ACCOUNTING_KHVT_SHIPMENT_ITEMS_TEMPLATE, ReportUtil.prepareDataForShipmentControl(accountingTrans)); 
	       }      
    }
	
private AccountingTrans setUpDataShipment(HttpServletRequest request, AccountingTransCondition accountingTransCondition){
        
        //Set up command
        List<Docsgeneral> docsgenerals = this.docsgeneralManager.searchShipment(accountingTransCondition);
        List<Exfeetable> exfeetables = new ArrayList<>();
        
        if(docsgenerals != null && !docsgenerals.isEmpty()){
        	for (Docsgeneral docsgeneral : docsgenerals) {
        		Truckingservice truckingservice = docsgeneral.getTruckingservice();
        		if(truckingservice != null){
        			List<Truckingdetail> truckingdetails = truckingserviceManager.findWithFullTruckingservice(truckingservice.getId());
        			if(truckingdetails != null && !truckingdetails.isEmpty()){
        				for (Truckingdetail truckingdetail : truckingdetails) {
        					//load fee
        	        		BigDecimal total = BigDecimal.ZERO;
        	        		exfeetables = exfeetableManager.findByTruckingdetail(truckingdetail.getId());
        	        		if(exfeetables != null && !exfeetables.isEmpty()){
        	        			for (Exfeetable exfeetable : exfeetables) {
        	        					total = total.add(ConvertUtil.getNotNullValue(exfeetable.getTotal()));
        						}
        	        		}
        	        		truckingdetail.setTotal(total);
        	        		truckingdetail.setExfeetables(exfeetables);
						}        				
        			}
        			truckingservice.setTruckingdetails(truckingdetails);
        		}
        		docsgeneral.setTruckingservice(truckingservice);
        		docsgeneralManager.updateContTruck(docsgeneral);
			}
        }
        AccountingTrans accountingTrans = new AccountingTrans();
        accountingTrans.setDocs(docsgenerals);
        accountingTrans.setCondition(accountingTransCondition);
        return accountingTrans;
   }
}
