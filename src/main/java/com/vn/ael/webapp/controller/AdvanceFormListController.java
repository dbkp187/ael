package com.vn.ael.webapp.controller;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.URLReference;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.enums.StatusType;
import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.manager.AdvanceFormManager;
import com.vn.ael.persistence.manager.BankManager;
import com.vn.ael.persistence.manager.DocsgeneralManager;
import com.vn.ael.persistence.manager.RefundManager;
import com.vn.ael.webapp.dto.AdvanceSumary;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.dto.LiabilityDetail;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.CommonUtil;
import com.vn.ael.webapp.util.ConvertUtil;
import com.vn.ael.webapp.util.ReportUtil;

@Controller
public class AdvanceFormListController extends BaseFormController {

	private AdvanceFormManager advanceFormManager;
	
	static SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy");

	@Autowired
	public void setAdvanceFormManager(AdvanceFormManager advanceFormManager) {
		this.advanceFormManager = advanceFormManager;

	}

	private RefundManager refundManager;
	
	private BankManager bankManager;

	@Autowired
	public void setRefundManager(RefundManager refundManager, BankManager bankManager) {
		this.refundManager = refundManager;
		this.bankManager = bankManager;
	}
	
	private DocsgeneralManager docsgeneralManager;

    @Autowired
    public void setDocsgeneralManager(final DocsgeneralManager docsgeneralManager) {
        this.docsgeneralManager = docsgeneralManager;
    }

	public AdvanceFormListController() {
		setCancelView("redirect:" + URLReference.HOME_PAGE);
		setSuccessView("redirect:" + URLReference.OFFERPRICE_LIST);
	}

	@Override
	@InitBinder
	protected void initBinder(final HttpServletRequest request,
			final ServletRequestDataBinder binder) {
		super.initBinder(request, binder);
		binder.setDisallowedFields("password", "confirmPassword");
	}

	//users/advanceRefunds
	@RequestMapping(method = RequestMethod.GET, value = URLReference.ADVANCE_REFUNDS)
	public ModelAndView handleRequest(HttpServletRequest request)
			throws Exception {
		Model model = new ExtendedModelMap();
		//Add comment by Phuc
//		model.addAttribute(advanceFormManager.findByEmpoyee(getUserManager()
//				.getLoggedUser(request),false));
//		model.addAttribute(refundManager.findByEmpoyee(getUserManager()
//				.getLoggedUser(request),false));
		//End Add comment by Phuc
		Search searchRefund = new Search();
		model.addAttribute("search", searchRefund);
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		model.addAttribute("docsSelection", docsSelection);
		model.addAttribute("enumStatus", StatusType.values());
		/*model.addAttribute("jobList", docsgeneralManager.getAllJob());*/
		return new ModelAndView(URLReference.ADVANCE_REFUNDS, model.asMap());
	}

	//admin/accounting/advanceRefunds 
	@RequestMapping(method = RequestMethod.GET, value = URLReference.ADVANCE_FORM_ACC)
	public ModelAndView handleRequestAcc(HttpServletRequest request)
			throws Exception {
		Model model = new ExtendedModelMap();
		Search searchAdvanceForm = new Search();
		//by defaut search not approved job
		searchAdvanceForm.setDoApproval(false);
		//model.addAttribute(advanceFormManager.searchAdvanceForm(searchAdvanceForm));
		//model.addAttribute(refundManager.searchRefund(searchAdvanceForm));
		model.addAttribute("search", searchAdvanceForm);
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		model.addAttribute("docsSelection", docsSelection);
		model.addAttribute("enumStatus", StatusType.values());
		model.addAttribute("jobList", docsgeneralManager.getAllJob());
		model.addAttribute("banks", bankManager.getAll());
		return new ModelAndView(URLReference.ADVANCE_FORM_ACC, model.asMap());
	}

	//users/searchAdvance
	@RequestMapping(method = RequestMethod.POST, value = URLReference.ADVANCE_SEARCH)
	public ModelAndView searchAdvanceForm(Search searchAdvanceForm,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ADVANCE_REFUNDS);
		// check role
		User user = getUserManager().getLoggedUser(request);
		searchAdvanceForm.setEmployee(user.getId());
		List<Advanceform> advanceforms = advanceFormManager
				.searchAdvanceForm(searchAdvanceForm);
		mav.addObject(advanceforms);
		/*mav.addObject("jobList", docsgeneralManager.getAllJob());*/
		mav.addObject(refundManager.findByEmpoyee(getUserManager()
				.getLoggedUser(request),false));
		// selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("flag", 1);
		return mav;
	}

	//user/searchRefund
	@RequestMapping(method = RequestMethod.POST, value = URLReference.REFUND_SEARCH)
	public ModelAndView searchRefund(Search searchRefund,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ADVANCE_REFUNDS);
		// check role
		User user = getUserManager().getLoggedUser(request);
		searchRefund.setEmployee(user.getId());
		List<Refund> refunds = refundManager.searchRefund(searchRefund);
		mav.addObject(refunds);
		mav.addObject(advanceFormManager.findByEmpoyee(getUserManager()
				.getLoggedUser(request),false));
		mav.addObject("jobList", docsgeneralManager.getAllJob());
		// selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("flag", 2);
		return mav;
	}

	//admin/accounting/searchAdvance
	@RequestMapping(method = RequestMethod.POST, value = URLReference.ACC_ADVANCE_SEARCH)
	public ModelAndView searchAccAdvanceForm(Search searchAdvanceForm,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ADVANCE_FORM_ACC);
		List<Advanceform> advanceforms = advanceFormManager
				.searchAdvanceForm(searchAdvanceForm);
		mav.addObject(advanceforms);
		// selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("jobList", docsgeneralManager.getAllJob());
		mav.addObject("banks", bankManager.getAll());
		mav.addObject("flag", 1);
		Search search = new Search();
		//by defaut search not approved job
		//searchAdvanceForm.setDoApproval(false);
		mav.addObject(refundManager.searchRefund(search));
		return mav;
	}

	//admin/accounting/searchRefund
	@RequestMapping(method = RequestMethod.POST, value = URLReference.ACC_REFUND_SEARCH)
	public ModelAndView searchAccRefund(Search searchRefund,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ADVANCE_FORM_ACC);

		List<Refund> refunds = refundManager.searchRefund(searchRefund);
		mav.addObject(refunds);
		// selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("jobList", docsgeneralManager.getAllJob());
		mav.addObject("banks", bankManager.getAll());
		Search searchAdvanceForm = new Search();
		//by defaut search not approved job
		searchAdvanceForm.setDoApproval(false);
		mav.addObject(advanceFormManager
				.searchAdvanceForm(searchAdvanceForm));
		mav.addObject("flag", 2);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = URLReference.ACC_ADVANCE_SUMARY_SEARCH, params = {
			"search", "!export" })
	public ModelAndView searchAccAdvanceSumary(Search searchAdvanceSumary,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ADVANCE_FORM_ACC);
		long t1 = System.currentTimeMillis();
		Calendar cal = Calendar.getInstance();
		Date startDate = searchAdvanceSumary.getStartSumDate() != null ? searchAdvanceSumary
				.getStartSumDate() : cal.getTime();
		Date endDate = searchAdvanceSumary.getEndSumDate() != null ? searchAdvanceSumary
				.getEndSumDate() : cal.getTime();
		List<AdvanceSumary> listSumary = new ArrayList<AdvanceSumary>();
		User employee = new User();
		try {
			employee = advanceFormManager.getUserById(searchAdvanceSumary
					.getEmployee());
		} catch (Exception e) {
			log.error("CAN'T GET USER: " + e.getMessage());
		}
		if (employee.getId() != null && employee.getId() > 0) {
			listSumary.add(this.getAdvanceSumaryForEmployee(employee,
					startDate, endDate));
		} else {
			List<User> employees = new ArrayList<User>();
			employees.addAll(getUserManager().getAllUser());
			if (!employees.isEmpty()) {
				Map<Long, List<Advanceform>> mapAdvanceform = getAllAdvanceform();
				Map<Long, List<Refund>> mapRefund = getAllRefund();
				for (User user : employees) {
					listSumary.add(this.getAdvanceSumaryForEmployeeForAllUser(user,
							mapAdvanceform, mapRefund,
							startDate, endDate));
				}
			}
		}
		mav.addObject(listSumary);
		// selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("enumStatus", StatusType.values());
		//mav.addObject(advanceFormManager.getAll());
		//mav.addObject(refundManager.findAllThanhtoan());
		mav.addObject("flag", 3);
		System.out.println("Time: " + (System.currentTimeMillis() - t1));
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = URLReference.ADVANCE_SUMARY_SEARCH, params = {
			"search", "!export" })
	public ModelAndView searchAdvanceSumary(Search searchAdvanceSumary,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView(URLReference.ADVANCE_REFUNDS);
		// check role
		User loggedInUser = getUserManager().getLoggedUser(request);
		searchAdvanceSumary.setEmployee(loggedInUser.getId());
		Calendar cal = Calendar.getInstance();
		Date startDate = searchAdvanceSumary.getStartSumDate() != null ? searchAdvanceSumary
				.getStartSumDate() : cal.getTime();
		Date endDate = searchAdvanceSumary.getEndSumDate() != null ? searchAdvanceSumary
				.getEndSumDate() : cal.getTime();
		List<AdvanceSumary> listSumary = new ArrayList<AdvanceSumary>();

		if (loggedInUser.getId() != null && loggedInUser.getId() > 0) {
			listSumary.add(this.getAdvanceSumaryForEmployee(loggedInUser,
					startDate, endDate));
		} 

		mav.addObject(listSumary);
		mav.addObject(advanceFormManager.findByEmpoyee(loggedInUser,false));
		mav.addObject(refundManager.findByEmpoyee(loggedInUser,false));
		// selection
		DocsSelection docsSelection = configurationManager
				.loadSelectionForDocsPage(true);
		mav.addObject("docsSelection", docsSelection);
		mav.addObject("enumStatus", StatusType.values());
		mav.addObject("flag", 3);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = URLReference.ADVANCE_SUMARY_SEARCH, params = {
			"export", "!search" })
	public void downloadAdvanceSumary(Search searchAdvanceSumary,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		BigDecimal totalAdBefore = BigDecimal.ZERO;
		BigDecimal totalAdBetween = BigDecimal.ZERO;
		BigDecimal totalAdAfter = BigDecimal.ZERO;
		BigDecimal totalRefBefore = BigDecimal.ZERO;
		BigDecimal totalRefBetween = BigDecimal.ZERO;
		BigDecimal totalRefAfter = BigDecimal.ZERO;
		Map<String, Object> beans = new LinkedHashMap<>();
		// check role
		User loggedInUser = getUserManager().getLoggedUser(request);
		searchAdvanceSumary.setEmployee(loggedInUser.getId());
		Calendar cal = Calendar.getInstance();
		Date startDate = searchAdvanceSumary.getStartSumDate() != null ? searchAdvanceSumary
				.getStartSumDate() : cal.getTime();
		Date endDate = searchAdvanceSumary.getEndSumDate() != null ? searchAdvanceSumary
				.getEndSumDate() : cal.getTime();
		List<AdvanceSumary> listSumary = new ArrayList<AdvanceSumary>();

		if (loggedInUser.getId() != null && loggedInUser.getId() > 0) {
			listSumary.add(this.getAdvanceSumaryForEmployee(loggedInUser,
					startDate, endDate));
		} 

		if (!listSumary.isEmpty()) {
			for (AdvanceSumary advanceSumary : listSumary) {
				totalAdBefore = totalAdBefore.add(advanceSumary
						.getTotalAdvanceBefore());
				totalAdBetween = totalAdBetween.add(advanceSumary
						.getTotalAdvanceBetween());
				totalAdAfter = totalAdAfter.add(advanceSumary
						.getTotalAdvanceAfter());
				totalRefBefore = totalRefBefore.add(advanceSumary
						.getTotalRefundBefore());
				totalRefBetween = totalRefBetween.add(advanceSumary
						.getTotalRefundBetween());
				totalRefAfter = totalRefAfter.add(advanceSumary
						.getTotalRefundAfter());
			}

		}
		beans.put("totalAdBefore", totalAdBefore);
		beans.put("totalAdBetween", totalAdBetween);
		beans.put("totalAdAfter", totalAdAfter);
		beans.put("totalRefBefore", totalRefBefore);
		beans.put("totalRefBetween", totalRefBetween);
		beans.put("totalRefAfter", totalRefAfter);
		beans.put("advanceSumary", listSumary);
		beans.put("startDate", CommonUtil.getDateString(startDate));
		beans.put("endDate", CommonUtil.getDateString(endDate));
		ReportUtil.dispatchReport(response,
				ReportTeamplates.ADVANCE_SUMARY_ITEMS,
				ReportTeamplates.ADVANCE_SUMARY_ITEMS_TEMPLATE, beans);
	}

	@RequestMapping(method = RequestMethod.POST, value = URLReference.ACC_ADVANCE_SUMARY_SEARCH, params = {
			"export", "!search" })
	public void downloadAccAdvanceSumary(Search searchAdvanceSumary,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		BigDecimal totalAdBefore = BigDecimal.ZERO;
		BigDecimal totalAdBetween = BigDecimal.ZERO;
		BigDecimal totalAdAfter = BigDecimal.ZERO;
		BigDecimal totalRefBefore = BigDecimal.ZERO;
		BigDecimal totalRefBetween = BigDecimal.ZERO;
		BigDecimal totalRefAfter = BigDecimal.ZERO;
		Calendar cal = Calendar.getInstance();
		Date startDate = searchAdvanceSumary.getStartSumDate() != null ? searchAdvanceSumary
				.getStartSumDate() : cal.getTime();
		Date endDate = searchAdvanceSumary.getEndSumDate() != null ? searchAdvanceSumary
				.getEndSumDate() : cal.getTime();
		Map<String, Object> beans = new LinkedHashMap<>();
		List<AdvanceSumary> listSumary = new ArrayList<AdvanceSumary>();
		User employee = new User();
		try {
			employee = advanceFormManager.getUserById(searchAdvanceSumary
					.getEmployee());
		} catch (Exception e) {
			//log.error("CAN'T GET USER: " + e.getMessage());
		}
		if (employee.getId() != null) {
			listSumary.add(this.getAdvanceSumaryForEmployee(employee,
					startDate, endDate));
		} else {
			List<User> employees = new ArrayList<User>();
			employees.addAll(getUserManager().getAllUser());
			if (!employees.isEmpty()) {
				Map<Long, List<Advanceform>> mapAdvanceform = getAllAdvanceform();
				Map<Long, List<Refund>> mapRefund = getAllRefund();
 				for (User user : employees) {
					listSumary.add(this.getAdvanceSumaryForEmployeeForAllUser(user,
							mapAdvanceform, mapRefund, startDate, endDate));
				}
			}
		}
		if (!listSumary.isEmpty()) {
			for (AdvanceSumary advanceSumary : listSumary) {
				totalAdBefore = totalAdBefore.add(advanceSumary
						.getTotalAdvanceBefore());
				totalAdBetween = totalAdBetween.add(advanceSumary
						.getTotalAdvanceBetween());
				totalAdAfter = totalAdAfter.add(advanceSumary
						.getTotalAdvanceAfter());
				totalRefBefore = totalRefBefore.add(advanceSumary
						.getTotalRefundBefore());
				totalRefBetween = totalRefBetween.add(advanceSumary
						.getTotalRefundBetween());
				totalRefAfter = totalRefAfter.add(advanceSumary
						.getTotalRefundAfter());
			}

		}
		/*beans.put("totalAdBefore", NumberFormat.getCurrencyInstance().format(totalAdBefore).replace("$", ""));
		beans.put("totalAdBetween", NumberFormat.getCurrencyInstance().format(totalAdBetween).replace("$", ""));
		beans.put("totalAdAfter", NumberFormat.getCurrencyInstance().format(totalAdAfter).replace("$", ""));
		beans.put("totalRefBefore", NumberFormat.getCurrencyInstance().format(totalRefBefore).replace("$", ""));
		beans.put("totalRefBetween", NumberFormat.getCurrencyInstance().format(totalRefBetween).replace("$", ""));
		beans.put("totalRefAfter", NumberFormat.getCurrencyInstance().format(totalRefAfter).replace("$", ""));*/
		beans.put("totalAdBefore", totalAdBefore);
		beans.put("totalAdBetween", totalAdBetween);
		beans.put("totalAdAfter", totalAdAfter);
		beans.put("totalRefBefore", totalRefBefore);
		beans.put("totalRefBetween", totalRefBetween);
		beans.put("totalRefAfter", totalRefAfter);
		
		beans.put("advanceSumary", ReportUtil.convertAdvSumaryForExport(listSumary));
		beans.put("startDate", CommonUtil.getDateString(startDate));
		beans.put("endDate", CommonUtil.getDateString(endDate));
		ReportUtil.dispatchReport(response,
				ReportTeamplates.ADVANCE_SUMARY_ITEMS,
				ReportTeamplates.ADVANCE_SUMARY_ITEMS_TEMPLATE, beans);
	}

	private BigDecimal calculateTotalAdvance(List<Advanceform> listAdvanceForm) {
		BigDecimal result = BigDecimal.ZERO;
		try {

			if (!listAdvanceForm.isEmpty()) {
				for (Advanceform advanceform : listAdvanceForm) {
					List<Advancedetail> listDetails = new ArrayList<Advancedetail>();
					listDetails.addAll(advanceform.getAdvancedetails());
					if (!listDetails.isEmpty()) {
						for (Advancedetail advancedetail : listDetails) {
							result = result.add(advancedetail.getAmount());
						}
					}
				}
			}
		} catch (Exception e) {
			log.error("FAILED TO CALCULATE total advance before: "
					+ e.getMessage());
		}
		return result;
	}

	private BigDecimal calculateTotalRefund(List<Refund> listRefund) {
		BigDecimal result = BigDecimal.ZERO;
		try {

			if (!listRefund.isEmpty()) {
				for (Refund refund : listRefund) {
					List<Refunddetail> listDetails = new ArrayList<Refunddetail>();
					listDetails.addAll(refund.getRefunddetails());
					if (!listDetails.isEmpty()) {
						for (Refunddetail refundDetail : listDetails) {
							result = result.add(ConvertUtil.getNotNullValue(refundDetail.getAmount()));
							result = result.add(ConvertUtil.getNotNullValue(refundDetail.getOAmount()));
						}
					}
				}
			}
		} catch (Exception e) {
			log.error("FAILED TO CALCULATE total advance before: "
					+ e.getMessage());
		}
		return result;
	}

	private AdvanceSumary getAdvanceSumaryForEmployee(User employee, 
			Date startDate, Date endDate) throws ParseException {
		if (startDate==null&&endDate!=null) {
			startDate = endDate;
		} else if (startDate!=null&&endDate==null) {
			endDate = startDate;
		}
		BigDecimal totalAdvanceBefore = BigDecimal.ZERO;
		BigDecimal totalRefundBefore = BigDecimal.ZERO;
		BigDecimal totalAdvanceBetween = BigDecimal.ZERO;
		BigDecimal totalRefundBetween = BigDecimal.ZERO;
		BigDecimal totalAdvanceAfter = BigDecimal.ZERO;
		BigDecimal totalRefundAfter = BigDecimal.ZERO;
		BigDecimal before = BigDecimal.ZERO;
		BigDecimal after = BigDecimal.ZERO;
		List<Advanceform> listAdvance = new ArrayList<Advanceform>();
		listAdvance.addAll(advanceFormManager.findByEmpoyeeForAccounting(employee.getId(), true));
		List<Advanceform> listBefore = new ArrayList<Advanceform>();
		List<Advanceform> listBetween = new ArrayList<Advanceform>();
		SimpleDateFormat dateFormat = 
	            new SimpleDateFormat(FormatterPattern.DATE_FOMART);
		String strD2 = dateFormat.format(startDate);
		Date dateStart = dateFormat.parse(strD2);
		String strD3 = dateFormat.format(endDate);
		Date dateEnd = dateFormat.parse(strD3);
		if (!listAdvance.isEmpty()) {
			for (Advanceform advanceform : listAdvance) {
				if (advanceform.getDate() != null) {
					 String strD1 = dateFormat.format(advanceform.getDate());
					 Date dateAdvance = dateFormat.parse(strD1);					 
					if (dateAdvance.before(dateStart)) {						
						listBefore.add(advanceform);
					} else if ((dateAdvance.after(dateStart)|| dateAdvance.equals(dateStart))
							&& (dateAdvance.before(dateEnd) || dateAdvance.equals(dateEnd))) {
						listBetween.add(advanceform);
					}
				}
			}
		}
		totalAdvanceBefore = this.calculateTotalAdvance(listBefore);
		totalAdvanceBetween = this.calculateTotalAdvance(listBetween);
		totalAdvanceAfter = totalAdvanceBefore.add(totalAdvanceBetween);

		List<Refund> listRefund = new ArrayList<Refund>();
		listRefund.addAll(refundManager.findByEmpoyeeForAccounting(employee.getId(), true));
		List<Refund> listRefundBefore = new ArrayList<Refund>();
		List<Refund> listRefundBetween = new ArrayList<Refund>();
		if (!listRefund.isEmpty()) {
			for (Refund refund : listRefund) {
				if(refund.getDate() != null){
					String rDate = dateFormat.format(refund.getDate());
					Date refundDate = dateFormat.parse(rDate);
					if (refund.getIsAdmin() == null || refund.getIsAdmin()==false) {
						if (refundDate.before(dateStart)) {//|| refundDate.equals(dateStart)
							listRefundBefore.add(refund);
						} else if ((refundDate.equals(dateStart) || refundDate.after(dateStart))
								&& (refundDate.before(dateEnd) || refundDate.equals(dateEnd))) {
							listRefundBetween.add(refund);
						}
					}
				}				
			}
			totalRefundBefore = this.calculateTotalRefund(listRefundBefore);
			totalRefundBetween = this.calculateTotalRefund(listRefundBetween);
			totalRefundAfter = totalRefundBefore.add(totalRefundBetween);
		}
		before = totalRefundBefore.subtract(totalAdvanceBefore);
		if (before.doubleValue()<=0) {
			totalAdvanceBefore = before.negate();
			totalRefundBefore= BigDecimal.ZERO;
		}
		else{
			totalRefundBefore = before;
			totalAdvanceBefore = BigDecimal.ZERO;
		}
		after = totalRefundAfter.subtract(totalAdvanceAfter);
		if (after.doubleValue()<=0) {
			totalAdvanceAfter = after.negate();
			totalRefundAfter = BigDecimal.ZERO;
		}
		else{
			totalAdvanceAfter = BigDecimal.ZERO;
			totalRefundAfter = after;
		}
		return new AdvanceSumary(employee.getId(),employee.getFullName(), totalAdvanceBefore,
				totalRefundBefore, totalAdvanceBetween, totalRefundBetween,
				totalAdvanceAfter, totalRefundAfter);

	}
	
	private AdvanceSumary getAdvanceSumaryForEmployeeForAllUser(User employee, 
			Map<Long, List<Advanceform>> mapAdvanceform, Map<Long, List<Refund>> mapRefund,
			Date startDate, Date endDate) throws ParseException {
		if (startDate==null&&endDate!=null) {
			startDate = endDate;
		} else if (startDate!=null&&endDate==null) {
			endDate = startDate;
		}
		BigDecimal totalAdvanceBefore = BigDecimal.ZERO;
		BigDecimal totalRefundBefore = BigDecimal.ZERO;
		BigDecimal totalAdvanceBetween = BigDecimal.ZERO;
		BigDecimal totalRefundBetween = BigDecimal.ZERO;
		BigDecimal totalAdvanceAfter = BigDecimal.ZERO;
		BigDecimal totalRefundAfter = BigDecimal.ZERO;
		BigDecimal before = BigDecimal.ZERO;
		BigDecimal after = BigDecimal.ZERO;
		List<Advanceform> listAdvance = new ArrayList<Advanceform>();
		
		if (mapAdvanceform.get(employee.getId()) != null) {
			listAdvance.addAll(mapAdvanceform.get(employee.getId()));
		}
		List<Advanceform> listBefore = new ArrayList<Advanceform>();
		List<Advanceform> listBetween = new ArrayList<Advanceform>();
		SimpleDateFormat dateFormat = 
	            new SimpleDateFormat(FormatterPattern.DATE_FOMART);
		String strD2 = dateFormat.format(startDate);
		Date dateStart = dateFormat.parse(strD2);
		String strD3 = dateFormat.format(endDate);
		Date dateEnd = dateFormat.parse(strD3);
		if (!listAdvance.isEmpty()) {
			for (Advanceform advanceform : listAdvance) {
				if (advanceform.getDate() != null) {
					 String strD1 = dateFormat.format(advanceform.getDate());
					 Date dateAdvance = dateFormat.parse(strD1);					 
					if (dateAdvance.before(dateStart)) {						
						listBefore.add(advanceform);
					} else if ((dateAdvance.after(dateStart)|| dateAdvance.equals(dateStart))
							&& (dateAdvance.before(dateEnd) || dateAdvance.equals(dateEnd))) {
						listBetween.add(advanceform);
					}
				}
			}
		}
		totalAdvanceBefore = this.calculateTotalAdvance(listBefore);
		totalAdvanceBetween = this.calculateTotalAdvance(listBetween);
		totalAdvanceAfter = totalAdvanceBefore.add(totalAdvanceBetween);

		List<Refund> listRefund = new ArrayList<Refund>();
		if (mapRefund.get(employee.getId()) != null) {
			listRefund.addAll(mapRefund.get(employee.getId()));
		}
		List<Refund> listRefundBefore = new ArrayList<Refund>();
		List<Refund> listRefundBetween = new ArrayList<Refund>();
		if (!listRefund.isEmpty()) {
			for (Refund refund : listRefund) {
				if(refund.getDate() != null){
					String rDate = dateFormat.format(refund.getDate());
					Date refundDate = dateFormat.parse(rDate);
					if (refund.getIsAdmin() == null || refund.getIsAdmin()==false) {
						if (refundDate.before(dateStart)) {//|| refundDate.equals(dateStart)
							listRefundBefore.add(refund);
						} else if ((refundDate.equals(dateStart) || refundDate.after(dateStart))
								&& (refundDate.before(dateEnd) || refundDate.equals(dateEnd))) {
							listRefundBetween.add(refund);
						}
					}
				}				
			}
			totalRefundBefore = this.calculateTotalRefund(listRefundBefore);
			totalRefundBetween = this.calculateTotalRefund(listRefundBetween);
			totalRefundAfter = totalRefundBefore.add(totalRefundBetween);
		}
		before = totalRefundBefore.subtract(totalAdvanceBefore);
		if (before.doubleValue()<=0) {
			totalAdvanceBefore = before.negate();
			totalRefundBefore= BigDecimal.ZERO;
		}
		else{
			totalRefundBefore = before;
			totalAdvanceBefore = BigDecimal.ZERO;
		}
		after = totalRefundAfter.subtract(totalAdvanceAfter);
		if (after.doubleValue()<=0) {
			totalAdvanceAfter = after.negate();
			totalRefundAfter = BigDecimal.ZERO;
		}
		else{
			totalAdvanceAfter = BigDecimal.ZERO;
			totalRefundAfter = after;
		}
		return new AdvanceSumary(employee.getId(),employee.getFullName(), totalAdvanceBefore,
				totalRefundBefore, totalAdvanceBetween, totalRefundBetween,
				totalAdvanceAfter, totalRefundAfter);

	}
	
	@RequestMapping(method = RequestMethod.GET, value = URLReference.LIABILITY_DETAIL)
	public ModelAndView handleRequestLiabilityDetail(HttpServletRequest request)
			throws Exception {
		log.info("Come liability detail");
		Model model = new ExtendedModelMap();
		String employeeId = request.getParameter("id");
		String startDate = request.getParameter("sd");
		String endDate = request.getParameter("ed");
		BigDecimal nodauky = new BigDecimal(0);
		BigDecimal nocuoiky = new BigDecimal(0);
		
		try {
			Long empId = Long.parseLong(employeeId);
			List<LiabilityDetail> liabilities = new ArrayList<LiabilityDetail>();
			List<Advanceform> listAdvance = new ArrayList<Advanceform>();
			listAdvance.addAll(advanceFormManager.findByEmpoyeeForAccounting(empId, true));
			if (listAdvance != null) {
				for (Advanceform af : listAdvance) {
					if(beforeTime(startDate, af.getDate()) && af.getAdvancedetails() != null) {
						for (Advancedetail ad : af.getAdvancedetails()) {
							nodauky = nodauky.add(ad.getAmount()); 
						}
					
					} else if(betweenTime(startDate, endDate, af.getDate()) && af.getAdvancedetails() != null) {
						for (Advancedetail ad : af.getAdvancedetails()) {
							LiabilityDetail li = new LiabilityDetail();
							li.setDate(af.getDate());
							li.setType(VoucherType.PHIEUCHI);
							li.setVoucherNo(af.getMoneyBook() != null ? af.getMoneyBook().getVoucherNoPrint() : "");
							li.setRefcode(af.getRefCode());
							li.setExplain(ad.getDescription());
							li.setDebt(ad.getAmount());
							li.setRefund(null);
							liabilities.add(li);
						}
					}
				}
			}
			
			List<Refund> listRefund = new ArrayList<Refund>();
			listRefund.addAll(refundManager.findByEmpoyeeForAccounting(empId, true));
			
			if (listRefund != null) {
				for (Refund rf : listRefund) {
					if(beforeTime(startDate, rf.getDate()) && rf.getRefunddetails() != null) {
						for (Refunddetail rd : rf.getRefunddetails()) {
							BigDecimal amount = rd.getAmount() != null ? rd.getAmount() : rd.getOAmount();
							nodauky = nodauky.subtract(amount); 
						}
					} else if (betweenTime(startDate, endDate, rf.getDate()) && rf.getRefunddetails() != null) {
						for (Refunddetail rd : rf.getRefunddetails()) {
							LiabilityDetail li = new LiabilityDetail();
							li.setDate(rf.getDate());
							li.setType(VoucherType.PHIEUTHU);
							li.setVoucherNo(rd.getRefund().getMoneyBook() != null ? rd.getRefund().getMoneyBook().getVoucherNoPrint() : "");
							li.setRefcode(rf.getRefCode());
							li.setExplain(rd.getDescription());
							BigDecimal amount = rd.getAmount() != null ? rd.getAmount() : rd.getOAmount();
							li.setRefund(amount);
							li.setDebt(null);
							liabilities.add(li);
						}
					}
				}
			}
			
			Collections.sort(liabilities, new Comparator<LiabilityDetail>(){
	            public int compare(LiabilityDetail s1,LiabilityDetail s2) {
	                return s1.getDate().before(s2.getDate()) ? -1 : 1;
	        }}); 
			
			BigDecimal remain = nodauky;
			for (LiabilityDetail li : liabilities) {
				BigDecimal debt = li.getDebt() != null ? li.getDebt() : new BigDecimal(0);
				BigDecimal refund = li.getRefund() != null ? li.getRefund() : new BigDecimal(0);
				remain = remain.add(debt).subtract(refund);
				li.setRemain(remain);
			}
			//calculate remain
			nocuoiky = remain;
			model.addAttribute("liabilities", liabilities);
			model.addAttribute("remainStart", nodauky);
			model.addAttribute("remainEnd", nocuoiky);
			Date sd = sdf.parse(startDate);
			Date ed = sdf.parse(endDate);
			model.addAttribute("startDate", sd);
			model.addAttribute("endDate", ed);
			User employee = advanceFormManager.getUserById(empId);
			model.addAttribute("employee", employee);
		} catch (Exception e) {
			log.error("FAILED TO PARSE ID " + e.getMessage());
			e.printStackTrace();
		}
		
		return new ModelAndView(URLReference.LIABILITY_DETAIL, model.asMap());
	}
	
	@RequestMapping(method = RequestMethod.GET, value = URLReference.LIABILITY_DETAIL_USER)
	public ModelAndView handleRequestLiabilityDetailForUser(HttpServletRequest request)
			throws Exception {
		log.info("Come liability detail user");
		Model model = new ExtendedModelMap();
		String employeeId = request.getParameter("id");
		String startDate = request.getParameter("sd");
		String endDate = request.getParameter("ed");
		BigDecimal nodauky = new BigDecimal(0);
		BigDecimal nocuoiky = new BigDecimal(0);
		try {
			Long empId = Long.parseLong(employeeId);
			User user = getUserManager().getLoggedUser(request);
			if (user.getId() == empId) {
			
				List<LiabilityDetail> liabilities = new ArrayList<LiabilityDetail>();
				List<Advanceform> listAdvance = new ArrayList<Advanceform>();
				listAdvance.addAll(advanceFormManager.findByEmpoyeeForAccounting(empId, true));
				if (listAdvance != null) {
					for (Advanceform af : listAdvance) {
						if(beforeTime(startDate, af.getDate()) && af.getAdvancedetails() != null) {
							for (Advancedetail ad : af.getAdvancedetails()) {
								nodauky = nodauky.add(ad.getAmount()); 
							}
						
						} else if(betweenTime(startDate, endDate, af.getDate()) && af.getAdvancedetails() != null) {
							for (Advancedetail ad : af.getAdvancedetails()) {
								LiabilityDetail li = new LiabilityDetail();
								li.setDate(af.getCreatedDate());
								//li.setType("Phiếu chi");
								li.setType(VoucherType.PHIEUCHI);
								li.setVoucherNo(af.getMoneyBook() != null ? af.getMoneyBook().getVoucherNoPrint() : "");
								li.setRefcode(af.getRefCode());
								li.setExplain(ad.getDescription());
								li.setDebt(ad.getAmount());
								li.setRefund(null);
								liabilities.add(li);
							}
						}
					}
				}
				
				List<Refund> listRefund = new ArrayList<Refund>();
				listRefund.addAll(refundManager.findByEmpoyeeForAccounting(empId, true));
				
				if (listRefund != null) {
					for (Refund rf : listRefund) {
						if(beforeTime(startDate, rf.getDate()) && rf.getRefunddetails() != null) {
							for (Refunddetail rd : rf.getRefunddetails()) {
								BigDecimal amount = rd.getAmount() != null ? rd.getAmount() : rd.getOAmount();
								nodauky = nodauky.subtract(amount); 
							}
						} else if (betweenTime(startDate, endDate, rf.getDate()) && rf.getRefunddetails() != null) {
							for (Refunddetail rd : rf.getRefunddetails()) {
								LiabilityDetail li = new LiabilityDetail();
								li.setDate(rf.getCreatedDate());
								//li.setType("Phiếu thu");
								li.setType(VoucherType.PHIEUTHU);
								li.setVoucherNo(rd.getRefund().getMoneyBook() != null ? rd.getRefund().getMoneyBook().getVoucherNoPrint() : "");
								li.setRefcode(rf.getRefCode());
								li.setExplain(rd.getDescription());
								BigDecimal amount = rd.getAmount() != null ? rd.getAmount() : rd.getOAmount();
								li.setRefund(amount);
								li.setDebt(null);
								liabilities.add(li);
							}
						}
					}
				}
				
				Collections.sort(liabilities, new Comparator<LiabilityDetail>(){
		            public int compare(LiabilityDetail s1,LiabilityDetail s2) {
		                return s1.getDate().before(s2.getDate()) ? -1 : 1;
		        }}); 
				
				BigDecimal remain = nodauky;
				for (LiabilityDetail li : liabilities) {
					BigDecimal debt = li.getDebt() != null ? li.getDebt() : new BigDecimal(0);
					BigDecimal refund = li.getRefund() != null ? li.getRefund() : new BigDecimal(0);
					remain = remain.add(debt).subtract(refund);
					li.setRemain(remain);
				}
				//calculate remain
				nocuoiky = remain;
				model.addAttribute("liabilities", liabilities);
				model.addAttribute("remainStart", nodauky);
				model.addAttribute("remainEnd", nocuoiky);
				Date sd = sdf.parse(startDate);
				Date ed = sdf.parse(endDate);
				model.addAttribute("startDate", sd);
				model.addAttribute("endDate", ed);
				User employee = advanceFormManager.getUserById(empId);
				model.addAttribute("employee", employee);
			}
			
			return new ModelAndView(URLReference.LIABILITY_DETAIL_USER, model.asMap());
		} catch (Exception e) {
			log.error("FAILED TO PARSE ID " + e.getMessage());
			e.printStackTrace();
		}
		
		return null;
	}
	
	boolean betweenTime(String startDate, String endDate, Date checkDate) throws ParseException {
		Date sd = sdf.parse(startDate);
		Date ed = sdf.parse(endDate);
		sd = new Date(sd.getTime() - 1); //23h59'59s the day before
		ed = new Date(ed.getTime() + (1000 * 60 * 60 * 24));
		if (checkDate.after(sd) && checkDate.before(ed)) {
			return true;
		}
		return false;
	}
	
	boolean beforeTime(String startDate, Date checkDate) throws ParseException {
		Date sd = sdf.parse(startDate);
		if (checkDate.before(sd)) {
			return true;
		}
		return false;
	}

	private Map<Long, List<Advanceform>> getAllAdvanceform() {
		List<Advanceform> listAdvanceform = advanceFormManager.findAll();
		Map<Long, List<Advanceform>> mapAdvanceform = new HashMap<Long, List<Advanceform>>();
		if (listAdvanceform != null) {
			for (Advanceform af : listAdvanceform) {
				if (mapAdvanceform.get(af.getEmployee().getId()) == null) {
					mapAdvanceform.put(af.getEmployee().getId(), new ArrayList<Advanceform>());
				} else {
					mapAdvanceform.get(af.getEmployee().getId()).add(af);
				}
			}
		}
		return mapAdvanceform;
	}
	
	private Map<Long, List<Refund>> getAllRefund() {
		List<Refund> listRefund = refundManager.findAllPhieuThu();
		Map<Long, List<Refund>> mapRefund = new HashMap<Long, List<Refund>>();
		if (listRefund != null) {
			for (Refund rd : listRefund) {
				if (mapRefund.get(rd.getEmployee().getId()) == null) {
					mapRefund.put(rd.getEmployee().getId(), new ArrayList<Refund>());
				} else {
					mapRefund.get(rd.getEmployee().getId()).add(rd);
				}
			}
		}
		return mapRefund;
	}
	
}
