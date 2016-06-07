
package com.vn.ael.webapp.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.URLReference;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.enums.StatusType;
import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.manager.AdvanceDetailManager;
import com.vn.ael.persistence.manager.AdvanceFormManager;
import com.vn.ael.persistence.manager.CustomerManager;
import com.vn.ael.persistence.manager.DocsAccountingManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.NhathauManager;
import com.vn.ael.persistence.manager.PackageinfoManager;
import com.vn.ael.persistence.manager.RefundDetailManager;
import com.vn.ael.persistence.manager.RefundManager;
import com.vn.ael.persistence.manager.TruckingserviceManager;
import com.vn.ael.persistence.manager.UserManager;
import com.vn.ael.webapp.dto.AccountingTransCondition;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.dto.Search;

@Controller
public class AccountingController extends BaseFormController {

	private CustomerManager customerManager;
	
	private ExfeetableManager exfeetableManager;
	
	private NhathauManager nhathauManager;
	
	private PackageinfoManager packageinfoManager;
	
	private TruckingserviceManager truckingserviceManager;
	
	private RefundManager refundManager;
	
	private RefundDetailManager refundDetailManager;
	
	private AdvanceDetailManager advanceDetailManager;
	
	private AdvanceFormManager advanceFormManager;
	
	private DocsAccountingManager docsAccountingManager;
	
	private UserManager userManager;
	
	protected final transient Log log = LogFactory.getLog(getClass());
	
	@Autowired
    public void setUserManager(UserManager userManager) {
        this.userManager = userManager;
    }
	
	@Autowired
	public void setExfeetableManager(ExfeetableManager exfeetableManager){
		this.exfeetableManager = exfeetableManager;
	}
	
	@Autowired
	public void setAdvanceDetailManager(AdvanceDetailManager advanceDetailManager){
		this.advanceDetailManager = advanceDetailManager;
	}
	
	@Autowired
	public void setRefundDetailManager(RefundDetailManager refundDetailManager){
		this.refundDetailManager = refundDetailManager;
	}
	
	@Autowired
	public void setCustomerManager(CustomerManager customerManager){
		this.customerManager = customerManager;
	}
	
    private DocsgeneralManager docsgeneralManager;

    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }
       
    @Autowired
	public void setPackageinfoManager(PackageinfoManager packageinfoManager) {
		this.packageinfoManager = packageinfoManager;
	}

    @Autowired
	public void setTruckingserviceManager(
			TruckingserviceManager truckingserviceManager) {
		this.truckingserviceManager = truckingserviceManager;
	}
        
    @Autowired
	public void setRefundManager(RefundManager refundManager) {
		this.refundManager = refundManager;
	}
    
    @Autowired
	public void setDocsAccountingManager(DocsAccountingManager docsAccountingManager) {
		this.docsAccountingManager = docsAccountingManager;
	}

	public AccountingController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.ACCOUNTING_CUSTOM_LIST);
    }
        
    @Autowired
    public void setNhathauManager(NhathauManager nhathauManager) {
		this.nhathauManager = nhathauManager;
	}

    @Autowired
	public void setAdvanceFormManager(AdvanceFormManager advanceFormManager) {
		this.advanceFormManager = advanceFormManager;
	}
    
	@Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_CUSTOM_LIST)
    public ModelAndView handleRequest() throws Exception {
        Model model = new ExtendedModelMap();
        //model.addAttribute(docsgeneralManager.findByDoAccountingAndTypeOfDocs(true,ServicesType.DVTQ));
        Search searchAccPackageInfo = new Search();
        model.addAttribute("search", searchAccPackageInfo);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        model.addAttribute("docsSelection", docsSelection);
        return new ModelAndView(URLReference.ACCOUNTING_CUSTOM_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_TRANSPORT_LIST)
    public ModelAndView handleTrabsRequest() throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute("customers", customerManager.getAll());
        model.addAttribute("conditions",new AccountingTransCondition());
        model.addAttribute("jobList", docsgeneralManager.getJobForSelection());
        return new ModelAndView(URLReference.ACCOUNTING_TRANSPORT_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_EXHIBITION_LIST)
    public ModelAndView handleExhRequest() throws Exception {
        Model model = new ExtendedModelMap();
      //Add comment by Phuc
//      model.addAttribute(docsgeneralManager.findByDoAccountingAndTypeOfDocs(true,ServicesType.EXHS));
    //End Add comment by Phuc
      Search searchAccExhibition = new Search();
      model.addAttribute("search", searchAccExhibition);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        model.addAttribute("docsSelection", docsSelection);
        return new ModelAndView(URLReference.ACCOUNTING_EXHIBITION_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_FEE_LIST)
    public ModelAndView handleFeeRequest() throws Exception {
        Model model = new ExtendedModelMap();
      Search searchAccFee = new Search();
      model.addAttribute("search", searchAccFee);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        model.addAttribute("enumStatus", StatusType.values());
        model.addAttribute("jobList", docsgeneralManager.getAllJob());
        model.addAttribute("nhathauList", nhathauManager.getAll());
        return new ModelAndView(URLReference.ACCOUNTING_FEE_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_FEE_LIST_ADMIN)
    public ModelAndView handleFeeAdminRequest() throws Exception {
        Model model = new ExtendedModelMap();

      Search searchAccFee = new Search();
      model.addAttribute("search", searchAccFee);
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT,
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        model.addAttribute("enumStatus", StatusType.values());
        model.addAttribute("jobList", docsgeneralManager.getAllJob());
        model.addAttribute("nhathauList", nhathauManager.getAll());
        return new ModelAndView(URLReference.ACCOUNTING_FEE_LIST_ADMIN, model.asMap());
    }
    
    //admin/accounting/feesDetail
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_LIST_DETAIL)
    public @ResponseBody List<Exfeetable> handleFeeDetailRequest(@RequestParam(value="docId",required = false) Long id,@RequestParam(value="refundId",required = false) Long refund) throws Exception {
    	List<Exfeetable> exfeetables = new ArrayList<>();
    	if (id != null){
    		exfeetables = this.exfeetableManager.findByDocsgeneralAndTruckingdetails(id);
    	} else if (refund != null){
    		exfeetables = this.exfeetableManager.findByRefund(refund);
    	}
    	return exfeetables;
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_LIST_ADVDETAIL)
    public @ResponseBody List<Advancedetail> handleadvanceAdminRequest(@RequestParam(value="id",required = false) Long id) throws Exception {
    	List<Advancedetail> advancedetails = new ArrayList<>();
    	if (id != null){
    		advancedetails = this.advanceDetailManager.findAllByAdvance(id);
    	}
    	return advancedetails;
    }
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_REFUND_ADMIN_LIST_DETAIL)
    public @ResponseBody List<Refunddetail> handleRefundAdminRequest(@RequestParam(value="adminId",required = false) Long refund) throws Exception {
    	List<Refunddetail> refunddetails = new ArrayList<>();
    	if (refund != null){
    		refunddetails = this.refundDetailManager.findAllByRefund(refund);
    	}
    	return refunddetails;
    }
    
    /*approved fee nhathau for account & admin*/
    //admin/accounting/changeApproval
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_CHANGE_APPROVAL)
    public @ResponseBody String approvalFeeDetailRequest(@RequestParam(value="id") Long id, HttpServletRequest request) throws Exception {
    	Exfeetable exfee = this.exfeetableManager.get(id);
    	if (exfee == null){
    		return AELConst.AJAX_ERROR;
    	}
    	try {
			if (exfee.getCheckByAdmin() == null || !exfee.getCheckByAdmin()) {
				boolean updatedApprove = true;
				if (exfee.getApproved() != null) {
					updatedApprove = exfee.getApproved() ? false : true;
				}
				exfee.setApproved(updatedApprove);
				exfee.setDateChange(Calendar.getInstance().getTime());
				exfee.setUpdatedOn(Calendar.getInstance().getTime());
	    		exfee.setUpdatedBy(this.userManager.getLoggedUser(request).getUsername());
				this.exfeetableManager.save(exfee);
				return AELConst.AJAX_SUCCESS;
			}
    	} catch (Exception e) {
    		e.printStackTrace();
    		return "notok";
    	}
		
    	return AELConst.AJAX_ERROR;
    }
    
    @Transactional
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_CHANGE_APPROVAL_BULK)
    public @ResponseBody String approvalBulkFeeDetailRequest(@RequestParam(value="ids") String ids, HttpServletRequest request) throws Exception {
    	try {
	    	String[] idArr = ids.split(",");
	    	List<Long> listId = new ArrayList<Long>();
	    	for (String id : idArr) {
	    		listId.add(Long.parseLong(id));
	    	}
	    	List<Exfeetable> fees = exfeetableManager.findByListId(listId);
	    	for (Exfeetable exfee : fees) {
				if (exfee.getApproved() == null || !exfee.getApproved()) {
					exfee.setApproved(true);
					exfee.setDateChange(Calendar.getInstance().getTime());
					exfee.setUpdatedOn(Calendar.getInstance().getTime());
		    		exfee.setUpdatedBy(this.userManager.getLoggedUser(request).getUsername());
		    		this.exfeetableManager.save(exfee);
				}
	    	}
    	} catch (Exception e) {
    		e.printStackTrace();
    		return "notok";
    	}
    	return AELConst.AJAX_SUCCESS;
    }
    
    //admin/changeApproval
    @Transactional
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_CHANGE_APPROVAL_ADMIN)
    public @ResponseBody String approvalAdminFeeDetailRequest(@RequestParam(value="id") Long id, HttpServletRequest request) throws Exception {
    	Exfeetable exfee = this.exfeetableManager.get(id);
    	if (exfee == null){
    		return AELConst.AJAX_ERROR;
    	}
	    if (exfee.getApproved() != null && exfee.getApproved()) {
	    	if (exfee.getCheckByAdmin() == null || !exfee.getCheckByAdmin()) {
	    		System.out.println("exfee /admin/changeApproval: " + exfee.getId());
	    		exfee.setDateChange(Calendar.getInstance().getTime());
	    		exfee.setUpdatedOn(Calendar.getInstance().getTime());
	    		exfee.setUpdatedBy(this.userManager.getLoggedUser(request).getUsername());
	    		exfee.setCheckByAdmin(true);
	    		this.exfeetableManager.save(exfee);
	    		Truckingdetail truckingdetail = exfee.getTruckingdetail();
	    		if (exfee.getMasterFee().getId() == -10) {
	    			//chi ho
	    			docsAccountingManager.updateTruckAccounting(truckingdetail, null, exfee.getTotal());
	    		} else {
	    			//other
	    			docsAccountingManager.updateTruckAccounting(truckingdetail, exfee.getTotal(), null);
	    		}
	    		
	    		return AELConst.AJAX_SUCCESS;
	    	}
	    }
	    return AELConst.AJAX_SUCCESS;
    }
    
    @Transactional
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_CHANGE_APPROVAL_ADMIN_BULK)
    public @ResponseBody String approvalBulkAdminFeeDetailRequest(@RequestParam(value="ids") String ids, HttpServletRequest request) throws Exception {
    	
    	String[] idArr = ids.split(",");
    	List<Long> listId = new ArrayList<Long>();
    	for (String id : idArr) {
    		listId.add(Long.parseLong(id));
    	}
    	try {
	    	List<Exfeetable> fees = exfeetableManager.findByListId(listId);
	    	for (Exfeetable exfee : fees) {
				if (exfee.getCheckByAdmin() == null || !exfee.getCheckByAdmin()) {
					exfee.setDateChange(Calendar.getInstance().getTime());
		    		exfee.setUpdatedOn(Calendar.getInstance().getTime());
		    		exfee.setUpdatedBy(this.userManager.getLoggedUser(request).getUsername());
					exfee.setCheckByAdmin(true);
				}
	    		System.out.println("exfee /admin/changeApprovalBulk: " + exfee.getId());
	    		this.exfeetableManager.save(exfee);
	    		
	    		Truckingdetail truckingdetail = exfee.getTruckingdetail();
	    		if (exfee.getMasterFee().getId() == -10) {
	    			//chi ho
	    			docsAccountingManager.updateTruckAccounting(truckingdetail, null, exfee.getTotal());
	    		} else {
	    			//other
	    			docsAccountingManager.updateTruckAccounting(truckingdetail, exfee.getTotal(), null);
	    		}
	    		
	    	}
    	} catch (Exception e) {
    		e.printStackTrace();
    		return AELConst.AJAX_ERROR;
    	}
    	return AELConst.AJAX_SUCCESS;
    }
    
    //end approve fee nhathau  
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_REFUND_ADMIN_CHANGE_APPROVAL)
    public @ResponseBody String approvalFeeRefundAdminDetailRequest(@RequestParam(value="id") Long id) throws Exception {
    	Refunddetail refunddetail = this.refundDetailManager.get(id);
    	if (refunddetail == null){
    		return AELConst.AJAX_ERROR;
    	}
    	if (refunddetail.getApproved() == null || !refunddetail.getApproved()){
    		refunddetail.setApproved(true);
    	}
    	else if(refunddetail.getCheckByAdmin() == null || !refunddetail.getCheckByAdmin()){
    		refunddetail.setApproved(false);
    	}
    	this.refundDetailManager.save(refunddetail);
    	// check for details
    	try {
	    	Refund rd = this.refundManager.get(refunddetail.getRefund().getId());
	    	if (rd == null){
	    		return AELConst.AJAX_ERROR;
	    	}
	    	this.refundManager.updateChilds(rd);
	    	int count = 0;
	    	if (rd.getRefunddetails() != null) {
		    	for (Refunddetail ad : rd.getRefunddetails()) {
		    		if (ad != null && ad.getApproved() != null && ad.getApproved()) {
		    			count++;
		    		}
		    	}
		    	if (count < rd.getRefunddetails().size()) {
		    		rd.setDoApproval(false);
		    	} else {
		    		rd.setDoApproval(true);
		    	}
		    	this.refundManager.saveRefund(rd);
	    	}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return AELConst.AJAX_SUCCESS;
    }


    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_REFUND_JOB_CHANGE_APPROVAL)
    public @ResponseBody String approvalFeeRefundJobDetailRequest(@RequestParam(value="id") Long id, HttpServletRequest request) throws Exception {
    	Exfeetable exfee = this.exfeetableManager.get(id);
    	if (exfee == null){
    		return AELConst.AJAX_ERROR;
    	}
    	if (exfee.getCheckByAdmin() == null || !exfee.getCheckByAdmin()) {
			boolean updatedApprove = true;
			if (exfee.getApproved() != null) {
				updatedApprove = exfee.getApproved() ? false : true;
			}
    		exfee.setApproved(updatedApprove);
    		exfee.setDateChange(Calendar.getInstance().getTime());
    		exfee.setUpdatedOn(Calendar.getInstance().getTime());
    		exfee.setUpdatedBy(this.userManager.getLoggedUser(request).getUsername());
    		this.exfeetableManager.save(exfee);
    		
    		// check for details
        	try {
    	    	Refund rd = this.refundManager.get(exfee.getRefund().getId());
    	    	if (rd == null){
    	    		return AELConst.AJAX_ERROR;
    	    	}
    	    	this.refundManager.updateChilds(rd);
    	    	int count = 0;
    	    	if (rd.getExfeetables() != null) {
    		    	for (Exfeetable ef : rd.getExfeetables()) {
    		    		if (ef != null && ef.getApproved() != null && ef.getApproved()) {
    		    			count++;
    		    		}
    		    	}
    		    	if (count < rd.getExfeetables().size()) {
    		    		rd.setDoApproval(false);
    		    	} else {
    		    		rd.setDoApproval(true);
    		    	}
    		    	this.refundManager.saveRefund(rd);
    	    	}
    	    	
    	    	return AELConst.AJAX_SUCCESS;
        	} catch (Exception e) {
        		e.printStackTrace();
        	}
    	}
		
    	return AELConst.AJAX_ERROR;
    }
    
    //admin/accounting/changeAdvanceApproval
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_ADVANCE_CHANGE_APPROVAL)
    public @ResponseBody String approvalAdvanceDetailRequest(@RequestParam(value="id") Long id) throws Exception {
    	Advancedetail advancedetail = this.advanceDetailManager.get(id);
    	if (advancedetail == null){
    		return AELConst.AJAX_ERROR;
    	}
    	if (advancedetail.getApproved() == null || !advancedetail.getApproved()){
    		advancedetail.setApproved(true);
    	}
    	else if(advancedetail.getCheckByAdmin() == null || !advancedetail.getCheckByAdmin()){
    		advancedetail.setApproved(false);
    	}
    	this.advanceDetailManager.save(advancedetail);
    	
    	//check if advanceform fully approved

    	Advanceform af = this.advanceFormManager.get(advancedetail.getAdvanceform().getId());
    	if (af == null){
    		return AELConst.AJAX_ERROR;
    	}
    	this.advanceFormManager.updateChilds(af);
    	int count = 0;
    	if (af.getAdvancedetails() != null) {
	    	for (Advancedetail ad : af.getAdvancedetails()) {
	    		if (ad != null && ad.getApproved() != null && ad.getApproved()) {
	    			count++;
	    		}
	    	}
    	
	    	if (count < af.getAdvancedetails().size()) {
	    		af.setDoApproval(false);
	    	} else {
	    		af.setDoApproval(true);
	    	}
	    	this.advanceFormManager.save(af);
    	}
    	
    	return AELConst.AJAX_SUCCESS;
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_NHATHAU_LIST)
    public ModelAndView handleNhathauRequest() throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute("nhathauList", nhathauManager.getAll());
        model.addAttribute("conditions",new AccountingTransCondition());
        model.addAttribute("jobList", docsgeneralManager.getAllJob());
      //selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
        		);
        model.addAttribute("docsSelection", docsSelection);
        return new ModelAndView(URLReference.ACCOUNTING_NHATHAU_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_VANTAI_LIST)
    public ModelAndView handleVantaiRequest() throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute("vantaiList", ServicesType.getUsageMapVT());
        model.addAttribute("conditions",new AccountingTransCondition());
        model.addAttribute("nhathauList", nhathauManager.getAll());
      //selection
        DocsSelection docsSelection = 
    		configurationManager.loadSelectionForDocsPage
    		(
    				ConfigurationType.TYPE_OF_IMPORT,
    				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
    		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("jobList", docsgeneralManager.getAllJob());
        model.addAttribute("shippers", packageinfoManager.findAllShipper());
        model.addAttribute("consignees", packageinfoManager.findAllConsignee());
        return new ModelAndView(URLReference.ACCOUNTING_VANTAI_LIST, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEETABLES_SEARCH)
	public ModelAndView searchTrucking(Search searchFeeTables)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST);
		
		List<Docsgeneral> docsgenerals = docsgeneralManager.searchFeeTables(searchFeeTables);
		/*if (searchFeeTables.getIsDuplicated()){
			docsgenerals = entityService.listContainsDuplicatedFees(docsgenerals);
		}*/
		if (searchFeeTables.getIsDuplicated()){
			docsgenerals = entityService.listContainsDuplicatedFees();
		} else {
			docsgenerals = docsgeneralManager.searchFeeTables(searchFeeTables);
		}
		mav.addObject(docsgenerals);
		
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", StatusType.values());
        mav.addObject("jobList", docsgeneralManager.getAllJob());
        mav.addObject("nhathauList", nhathauManager.getAll());
        mav.addObject("flag", 1);
		return mav;
	}
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_SHIPMENT)
    public ModelAndView handleShipmentRequest() throws Exception {
    	Model model = new ExtendedModelMap();
        model.addAttribute("conditions",new AccountingTransCondition());
      //selection
        DocsSelection docsSelection = 
    		configurationManager.loadSelectionForDocsPage
    		(
    				ConfigurationType.TYPE_OF_IMPORT,
    				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
    		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("jobList", docsgeneralManager.getAllJob());
        model.addAttribute("shippers", packageinfoManager.findAllShipper());
        model.addAttribute("consignees", packageinfoManager.findAllConsignee());
        return new ModelAndView(URLReference.ACCOUNTING_SHIPMENT, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.ACCOUNTING_PROFIT_LOSS)
    public ModelAndView handleProfitLossRequest() throws Exception {
    	Model model = new ExtendedModelMap();
        model.addAttribute("conditions",new AccountingTransCondition());
      //selection
        DocsSelection docsSelection = 
    		configurationManager.loadSelectionForDocsPage
    		(
    				ConfigurationType.TYPE_OF_IMPORT,
    				ConfigurationType.DOCS_SHIPPING_CUSTOM_DEPT
    		);
        model.addAttribute("docsSelection", docsSelection);
        model.addAttribute("jobList", docsgeneralManager.getAllJob());
        model.addAttribute("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        return new ModelAndView(URLReference.ACCOUNTING_PROFIT_LOSS, model.asMap());
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEENHATHAUTABLES_SEARCH)
	public ModelAndView searchFeeNhathau(Search searchFeeTables)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST);
		
		List<Truckingdetail> truckingdetails = truckingserviceManager.searchFeeNhathau(searchFeeTables);
		mav.addObject("truckingdetailList", truckingdetails);
		
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", StatusType.values());
        mav.addObject("flag", 2);
        mav.addObject("jobList", docsgeneralManager.getAllJob());
        mav.addObject("nhathauList", nhathauManager.getAll());
        /*mav.addObject("flag", 2);*/
		return mav;
	}
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEENHATHAUTABLES_SEARCH_ADVANCE)
	public ModelAndView searchFeeNhathauAdvance(Search searchFeeTables)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST);
		
		List<Truckingdetail> truckings = truckingserviceManager.searchFeeNhathauAdvance(searchFeeTables);
		
		Map<Long, Exfeetable> exfeesMap = new HashMap<Long, Exfeetable>();
		for (Truckingdetail truck : truckings) {
			for (Exfeetable exfee : truck.getExfeetables()) {
				if (exfeesMap.get(exfee.getId()) == null) {
					exfeesMap.put(exfee.getId(), exfee);	
				} 
			}
		}
		
		List<Exfeetable> listFee = new ArrayList<Exfeetable>(exfeesMap.values()); 
		Collections.sort(listFee, new Comparator<Exfeetable>() {
			@Override
			public int compare(Exfeetable e1, Exfeetable e2) {
				String j1 = e1.getTruckingdetail().getTruckingservice().getDocsgeneral().getJobNo();
				String j2 = e2.getTruckingdetail().getTruckingservice().getDocsgeneral().getJobNo();
				int compare = j1.compareToIgnoreCase(j2);
				if (compare == 0) {
					String c1 = e1.getTruckingdetail().getConsteal() == null ? "" : e1.getTruckingdetail().getConsteal().getNoOfCont();
					String c2 = e2.getTruckingdetail().getConsteal() == null ? "" : e2.getTruckingdetail().getConsteal().getNoOfCont();
					compare = c1.compareToIgnoreCase(c2);
				}
				return compare;
			}
			
		});
		mav.addObject("exfees", listFee);
		
		//selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(ConfigurationType.DOCS_TYPE_OF_CONTAINER, ConfigurationType.TYPE_OF_IMPORT);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("jobList", docsgeneralManager.getAllJob());
		mav.addObject("nhathauList", nhathauManager.getAll());
		mav.addObject("flag", 3);
		return mav;
	}
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEENHATHAUTABLES_ADMIN_SEARCH_ADVANCE)
   	public ModelAndView searchFeeNhathauAdminAdvance(Search searchFeeTables)
   			throws Exception {
   		// Model model = new ExtendedModelMap();
   		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST_ADMIN);
   		
   		List<Truckingdetail> truckings = truckingserviceManager.searchFeeNhathauAdvance(searchFeeTables);
   		
   		Map<Long, Exfeetable> exfeesMap = new HashMap<Long, Exfeetable>();
   		for (Truckingdetail truck : truckings) {
   			for (Exfeetable exfee : truck.getExfeetables()) {
   				if (exfeesMap.get(exfee.getId()) == null) {
   					exfeesMap.put(exfee.getId(), exfee);	
   				} 
   			}
   		}
   		
   		List<Exfeetable> listFee = new ArrayList<Exfeetable>(exfeesMap.values()); 
		Collections.sort(listFee, new Comparator<Exfeetable>() {
			@Override
			public int compare(Exfeetable e1, Exfeetable e2) {
				String j1 = e1.getTruckingdetail().getTruckingservice().getDocsgeneral().getJobNo();
				String j2 = e2.getTruckingdetail().getTruckingservice().getDocsgeneral().getJobNo();
				int compare = j1.compareToIgnoreCase(j2);
				if (compare == 0) {
					String c1 = e1.getTruckingdetail().getConsteal() == null ? "" : e1.getTruckingdetail().getConsteal().getNoOfCont();
					String c2 = e2.getTruckingdetail().getConsteal() == null ? "" : e2.getTruckingdetail().getConsteal().getNoOfCont();
					compare = c1.compareToIgnoreCase(c2);
				}
				return compare;
			}
			
		});
		mav.addObject("exfees", listFee);
   		
   		
   		//selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(ConfigurationType.DOCS_TYPE_OF_CONTAINER, ConfigurationType.TYPE_OF_IMPORT);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("jobList", docsgeneralManager.getAllJob());
		mav.addObject("nhathauList", nhathauManager.getAll());
		mav.addObject("flag", 3);
   		return mav;
   	}
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_NHATHAU_LIST_DETAIL)
    public @ResponseBody List<Exfeetable> handleFeeNhathauDetailRequest(@RequestParam(value="truckId") Long id) throws Exception {
    	List<Exfeetable> exfeetables = this.exfeetableManager.findByTruckingdetail(id);
    	return exfeetables;
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEETABLES_ADMIN_SEARCH)
	public ModelAndView searchFeeTableAdmin(Search searchFeeTables)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST_ADMIN);
		List<Docsgeneral> docsgenerals = null;
		if (searchFeeTables.getIsDuplicated()){
			docsgenerals = entityService.listContainsDuplicatedFees();
		} else {
			docsgenerals = docsgeneralManager.searchFeeTables(searchFeeTables);
		}
		mav.addObject(docsgenerals);
		
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", StatusType.values());
        mav.addObject("jobList", docsgeneralManager.getAllJob());
        mav.addObject("nhathauList", nhathauManager.getAll());
		return mav;
	}
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEE_NHATHAU_TABLES_ADMIN_SEARCH)
	public ModelAndView searchFeeNhathauAdmin(Search searchFeeTables)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST_ADMIN);
		
		List<Truckingdetail> truckingdetails = truckingserviceManager.searchFeeNhathau(searchFeeTables);
		mav.addObject("truckingdetailList", truckingdetails);
		
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", StatusType.values());
        mav.addObject("flag", 1);
        mav.addObject("jobList", docsgeneralManager.getAllJob());
        mav.addObject("nhathauList", nhathauManager.getAll()); 
		return mav;
	}
    
    @RequestMapping(method = RequestMethod.POST, value=URLReference.ACCOUNTING_FEE_REFUND_LIST_DETAIL)
    public @ResponseBody List<Exfeetable> handleFeeRefundDetailRequest(@RequestParam(value="refundId") Long id) throws Exception {
    	List<Exfeetable> exfeetables = this.exfeetableManager.findByRefund(id);
    	return exfeetables;
    }
    
    @RequestMapping(method = RequestMethod.POST, value = URLReference.FEEREFUND_SEARCH)
	public ModelAndView searchFeeRefund(Search searchFeeTables)
			throws Exception {
		// Model model = new ExtendedModelMap();
		ModelAndView mav = new ModelAndView(URLReference.ACCOUNTING_FEE_LIST);
		
		List<Refund> refunds = refundManager.searchFeeRefund(searchFeeTables);
		mav.addObject(refunds);
		//mav.addObject(docsgeneralManager.findByDoAccounting(true));
		//mav.addObject(truckingserviceManager.findByDoAccounting(true));
		//selection
        DocsSelection docsSelection = 
        		configurationManager.loadSelectionForDocsPage
        		(
        				ConfigurationType.DOCS_TYPE_OF_CONTAINER,
        				ConfigurationType.TYPE_OF_IMPORT
        		);
        mav.addObject("docsSelection", docsSelection);
        mav.addObject("typeOfDocs", ServicesType.getUsageMapSearchTruck());
        mav.addObject("enumStatus", StatusType.values());
        mav.addObject("jobList", docsgeneralManager.getAllJob());
        mav.addObject("flag", 3);
		return mav;
	}
}
