package com.vn.ael.webapp.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.type.WhenNoDataTypeEnum;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.appfuse.model.User;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.ReportTeamplates;
import com.vn.ael.constants.TypeOfContainer;
import com.vn.ael.enums.ReportMergeInfo;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Accountingcusdetail;
import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.BasicAdvance;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.persistence.entity.Extendfeeacc;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.webapp.dto.AccountingExhibitionItemExport;
import com.vn.ael.webapp.dto.AccountingNhathauExport;
import com.vn.ael.webapp.dto.AccountingProfitLossExport;
import com.vn.ael.webapp.dto.AccountingShipmentExport;
import com.vn.ael.webapp.dto.AccountingTrans;
import com.vn.ael.webapp.dto.AccountingTransportExport;
import com.vn.ael.webapp.dto.AdvanceRequestItem;
import com.vn.ael.webapp.dto.AdvanceSumary;
import com.vn.ael.webapp.dto.AdvanceSumaryExportDTO;
import com.vn.ael.webapp.dto.CustomFeeExportModel;
import com.vn.ael.webapp.dto.ExhibitionFeetable;
import com.vn.ael.webapp.dto.FeeExportItem;
import com.vn.ael.webapp.dto.FeeNameExport;
import com.vn.ael.webapp.dto.KeHoachVanTaiExport;
import com.vn.ael.webapp.dto.KeHoachVanTaiThongQuanExport;
import com.vn.ael.webapp.dto.OfferItemExportModel;
import com.vn.ael.webapp.dto.RefundRequestItem;
import com.vn.ael.webapp.formatter.FormatterUtil;

public class ReportUtil {
	private static final transient Log log = LogFactory
			.getLog(ReportUtil.class);

	/**
	 * Prepare data for offerprices report
	 * 
	 * @param offerPrice
	 * @return
	 */
	public static Map<String, Object> prepareDataForOffers(OfferPrice offerPrice) {
		List<OfferItemExportModel> offerPriceExport = new ArrayList<>();
		if (offerPrice.getOfferItems() != null) {
			int i = 0;
			for (OfferItem offerItem : offerPrice.getOfferItems()) {
				if (offerItem.getIsAdded() != null
						&& offerItem.getIsAdded() == false) {
					i++;
					offerPriceExport.add(new OfferItemExportModel(i, offerItem
							.getNameOfService().getValue(), ConvertUtil
							.getNotNullValue(offerItem.getFeeWithVAT())
							.toEngineeringString(), ConvertUtil
							.getNotNullValue(offerItem.getFeeNoVAT())
							.toEngineeringString(), offerItem.getCurrency()
							.getValue(), offerItem.getFeeUnit().getValue()));
				}
			}
		}
		Properties prop = new Properties();
		String typeOfService = "";
		// Get file from resources folder
					ClassLoader classLoader = ReportUtil.class.getClassLoader();
					File file = new File(classLoader.getResource(AELConst.APP_PROPERTIES)
							.getFile());
					try {
						InputStream targetStream = new FileInputStream(file);
						if (targetStream!=null) {
							prop.load(targetStream);
							if (prop.containsKey(offerPrice
						.getTypeOfService().getTextKey())) {
								typeOfService=prop.getProperty(offerPrice
						.getTypeOfService().getTextKey());
							}
						}
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						log.error(e.getMessage());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						log.error(e.getMessage());
					}
		
		Map<String, Object> beans = new LinkedHashMap<>();
		Customer cust = offerPrice.getCustomer();
		beans.put("customerCode", cust.getCode());
		beans.put("customerName", cust.getName());
		beans.put("offerType", typeOfService);
		beans.put("offerDate",
				CommonUtil.getDateString(offerPrice.getDateOffer()));
		beans.put("offerItem", offerPriceExport);
		return beans;
	}

	/**
	 * Compose report data
	 * 
	 * @param response
	 * @param reportName
	 * @param reportTemplates
	 * @param data
	 * @throws IOException
	 * @throws InvalidFormatException
	 * @throws ParsePropertyException
	 */
	public static void dispatchReport(HttpServletResponse response,
			String reportName, String reportTemplates,
			Map<String, Object> data, 
			Map<ReportMergeInfo,List<Integer>> dataMegres,Map<ReportMergeInfo,List<Integer>> dynamicMergeInfos) {
		try {
			Workbook workbook = generateWorkbook(reportTemplates, data);
			if (workbook != null) {
				Sheet sheet = workbook.getSheetAt(0);
				if (dataMegres != null){
					for (Entry<ReportMergeInfo, List<Integer>> merge : dataMegres.entrySet()){
						List<Integer> mergeIndexs = merge.getValue();
						ReportMergeInfo mergeInfo = merge.getKey(); 
						if (mergeIndexs != null) {
							int startRow = mergeInfo.getStartingRow();
							for (Integer height : mergeIndexs) {
								List<Integer> cols = ConvertUtil.createListFromArray(mergeInfo.getCols());
								if (dynamicMergeInfos != null && dynamicMergeInfos.containsKey(mergeInfo)){
									cols.addAll(dynamicMergeInfos.get(mergeInfo));
								}
								for (Integer index : cols) {
									if (height > 0) {
										sheet.addMergedRegion(new CellRangeAddress(
												startRow,startRow + height - 1,
												index, index));
									}
								}
								startRow = startRow + height;
							}
						}
					}
				}
				generateOutputInfo(response, reportName, workbook);
			}

		} catch (Exception e) {
			log.error("Could not write report to response", e);
		}
	}

	/**
	 * Compose report data
	 * 
	 * @param response
	 * @param reportName
	 * @param reportTemplates
	 * @param data
	 * @throws IOException
	 * @throws InvalidFormatException
	 * @throws ParsePropertyException
	 */
	public static void dispatchReport(HttpServletResponse response,
			String reportName, String reportTemplates, Map<String, Object> data) {
		generateOutputInfo(response, reportName,
				generateWorkbook(reportTemplates, data));
	}

	/**
	 * Generate workbook from data and template
	 * 
	 * @return
	 */
	public static Workbook generateWorkbook(String reportTemplates,
			Map<String, Object> data) {
		try {
			XLSTransformer transformer = new XLSTransformer();
			// Get file from resources folder
			ClassLoader classLoader = ReportUtil.class.getClassLoader();
			File file = new File(classLoader.getResource(reportTemplates)
					.getFile());
			InputStream targetStream = new FileInputStream(file);
			return transformer.transformXLS(targetStream, data);
		} catch (Exception e) {
			log.error("Could not generate XLS data", e);
		}
		return null;
	}

	/**
	 * Write a workbook to response stream
	 * 
	 * @param response
	 * @return
	 */
	public static void generateOutputInfo(HttpServletResponse response,
			String reportName, Workbook workbook) {
		try {
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ reportName);
			ServletOutputStream out = response.getOutputStream();
			if (workbook != null) {
				workbook.write(out);
				out.flush();
			}
			out.close();
		} catch (IOException e) {
			log.error("Could not write report to response", e);
		}
	}

	/**
	 * Create data for bienbangiaohang report
	 * 
	 * @param packageInfo
	 * @return
	 */
	public static Map<String, Object> prepareDataForBienbangiaohang(
			Packageinfo packageInfo) {
		Map<String, Object> beans = new LinkedHashMap<>();
		Customer cust = packageInfo.getDocsgeneral().getCustomer();
		beans.put("cusCode", cust.getCode());
		beans.put("cusName", cust.getName());
		beans.put("invoiceNo", packageInfo.getInvoice());
		beans.put("contract", packageInfo.getPo());
		beans.put("description", packageInfo.getDocsgeneral()
				.getProductDescription());
		beans.put("weight", FormatterUtil.formatBigDecimal(packageInfo
				.getDocsgeneral().getWeigth()));
		beans.put("pkgs", packageInfo.getDocsgeneral().getNoOfPkgsText());
		beans.put(
				"jobTK",
				AELConst.PREFFIX_TK + AELConst.COLON
						+ packageInfo.getCusDecOnNo() + AELConst.SEPARATOR
						+ packageInfo.getDocsgeneral().getJobNo());

		return beans;

	}

	/**
	 * Prepare data for accounting custom report
	 * 
	 * @param accountingcus
	 * @return
	 */
	public static Map<String, Object> prepareDataForCust(
			Accountingcus accountingcus) {
		BigDecimal cusFeeTotal = BigDecimal.ZERO;
		BigDecimal cusFeeVat = BigDecimal.ZERO;
		BigDecimal chihoFinalVal = BigDecimal.ZERO;

		BigDecimal chihoTotal = BigDecimal.ZERO;
		BigDecimal chihoVat = BigDecimal.ZERO;

		List<CustomFeeExportModel> customFee = new ArrayList<>();
		int index = 0;
		if (accountingcus.getAccountingcusdetails() != null) {
			for (Accountingcusdetail accountingCusDetailItem : accountingcus
					.getAccountingcusdetails()) {
				if (accountingCusDetailItem.getIsAdded() != null
						&& accountingCusDetailItem.getIsAdded() == false) {
					CustomFeeExportModel item = new CustomFeeExportModel(
							accountingCusDetailItem.getName() != null ? accountingCusDetailItem
									.getName().getValue()
									: AELConst.EMPTY_STRING,
							accountingCusDetailItem.getName() != null ? accountingCusDetailItem
									.getName().getDescription()
									: AELConst.EMPTY_STRING,
							accountingCusDetailItem.getQuantity20(),
							accountingCusDetailItem.getQuantity40(),
							accountingCusDetailItem.getQuantityOt(),
							accountingCusDetailItem.getQuantityLCL(),
							ConvertUtil.getNotNullValue(accountingCusDetailItem
									.getTotal()),
							ConvertUtil.getNotNullValue(accountingCusDetailItem
									.getGeneralVat()),
							accountingCusDetailItem.getNote(),
							accountingCusDetailItem.getInvoice());
					item.setUnitPrice(ConvertUtil.getNotNullValue(accountingCusDetailItem.getUnitPrice()));
					item.setFeewithvat(accountingCusDetailItem.getFeewithvat());
					item.setFeevat(accountingCusDetailItem.getFeevat());
					index++;
					item.setIndex(index);
					customFee.add(item);
					cusFeeTotal = cusFeeTotal.add(accountingCusDetailItem.getTotal() != null ? accountingCusDetailItem.getTotal() : new BigDecimal(0));
					cusFeeVat = cusFeeVat.add(accountingCusDetailItem
							.getFeevat());
				}
			}
		}
		BigDecimal cusFinalVal = cusFeeTotal.add(cusFeeVat);

		List<CustomFeeExportModel> fee = new ArrayList<>();
		if (accountingcus.getExtendfeeaccs() != null) {
			index = 0;
			for (Extendfeeacc extendFeeAcc : accountingcus.getExtendfeeaccs()) {
				CustomFeeExportModel item = new CustomFeeExportModel(
						extendFeeAcc.getFeeowner().getName().getValue(),
						((extendFeeAcc.getFeeowner() != null && extendFeeAcc.getFeeowner().getName() != null) ? extendFeeAcc.getFeeowner().getName().getDescription() : null),
						extendFeeAcc.getQuantity20(),
						extendFeeAcc.getQuantity40(),
						extendFeeAcc.getQuantityLCL(),
						ConvertUtil.getNotNullValue(extendFeeAcc.getFeeowner()
								.getAmount()),
						ConvertUtil.getNotNullValue(extendFeeAcc.getFeeowner()
								.getVat()), extendFeeAcc.getNote(),
						extendFeeAcc.getFeeowner().getInvoiceNo());
				index++;
				item.setIndex(index);
				fee.add(item);
				chihoTotal = chihoTotal.add(extendFeeAcc.getFeeowner()
						.getAmount());
				chihoVat = chihoVat.add(extendFeeAcc.getFeeowner().getVatFee());
				chihoFinalVal = chihoFinalVal.add(extendFeeAcc.getFeeowner().getTotal());
			}
		}

		Map<String, Object> beans = new LinkedHashMap<>();
		beans.put("chihoFinalVal", chihoFinalVal);
		beans.put("chihoTotal", chihoTotal);
		beans.put("chihoVat", chihoVat);

		beans.put("cusFinalVal", cusFinalVal);
		beans.put("cusFeeTotal", cusFeeTotal);
		beans.put("cusFeeVat", cusFeeVat);
		BigDecimal finalTotal = chihoFinalVal.add(cusFinalVal);
		beans.put("total", finalTotal);

		beans.put("customFees", customFee);
		beans.put("fees", fee);
		beans.put("customsDate",
				FormatterUtil.formatDate(accountingcus.getDocsgeneral().getPackageinfo().getCustomsDate()));
		Customer cust = accountingcus.getDocsgeneral().getCustomer();
		Docsgeneral doc = accountingcus.getDocsgeneral();
		beans.put("refNo", accountingcus.getRefNo());
		beans.put("custName", cust.getName());
		beans.put("custAddress", cust.getAddress());
		beans.put("custTaxNo", cust.getTaxno());
		beans.put("custTel", cust.getTel());
		beans.put("custFax", cust.getFax());
		beans.put("bill", doc.getPackageinfo().getBillOfLading());
		beans.put("cusDecOnNo", doc.getPackageinfo().getCusDecOnNo());
		beans.put("placeDelivery", doc.getPlaceDelivery());
		beans.put("tentau", doc.getNameVehicle());
		beans.put("cmb", doc.getCmbText());
		beans.put("delivery", FormatterUtil.formatDate(accountingcus.getDocsgeneral().getPackageinfo().getDateActualDev()));
		beans.put("updateDate", CommonUtil.getDateString(Calendar.getInstance().getTime()));
		beans.put("thanhtienTong", ConvertUtil.getNotNullValue(cusFeeTotal).add(chihoTotal));
		beans.put("tongcongTong", ConvertUtil.getNotNullValue(cusFinalVal).add(chihoFinalVal));
		
		if (doc.getIsLCL()){
			beans.put("vol", doc.getCmbText());
		}else{
			beans.put("vol", doc.getPackageinfo().getContNo());
		}
		beans.put("totalText", ConvertUtil.convertToVND(finalTotal.setScale(0, RoundingMode.HALF_UP)));
		beans.put("aelJob", doc.getJobNo());
		beans.put("noOfPkgs", doc.getNoOfPkgsText());
		beans.put("kg", doc.getWeigthText());
		beans.put("colourApplying",
				doc.getPackageinfo().getColourApplying() != null ? doc
						.getPackageinfo().getColourApplying().getFullInfo()
						: AELConst.EMPTY_STRING);
		beans.put("po", doc.getPackageinfo().getPo());
		beans.put("PTVT", doc.getPTVT());
		return beans;
	}

	/**
	 * Prepare data for ACCOUNTING TRANSPORT report
	 * 
	 * @param year
	 * @param month
	 * @param offerPrice
	 * @return
	 */
	public static Map<String, Object> prepareDataForAccountingTransport(
			AccountingTrans accountingTrans) {
		List<AccountingTransportExport> accountingTransExport = new ArrayList<>();
		BigDecimal chihoTotal = BigDecimal.ZERO;
		BigDecimal giacaTotal = BigDecimal.ZERO;
		BigDecimal otherFeeTotal = BigDecimal.ZERO;
		BigDecimal vatAmountTotal = BigDecimal.ZERO;
		List<List<Exfeetable>> feesListChiho = new ArrayList<>();
		
		if (accountingTrans.getDocs() != null) {
			int i = 0;
			for (Docsgeneral doc : accountingTrans.getDocs()) {
				++i;
				if (doc.getTruckingservice() != null
						&& doc.getTruckingservice().getTruckingdetails() != null) {
					chihoTotal = chihoTotal.add(ConvertUtil
							.getNotNullValue(doc.getChiho()));
					
					for (Truckingdetail truckingdetail : doc
							.getTruckingservice().getTruckingdetails()) {
						AccountingTransportExport item = new AccountingTransportExport();
						feesListChiho.add(truckingdetail.getChihoTruckings());
						item.setJobId(doc.getId());
						item.setJobNo(doc.getJobNo());
						item.setDateDev(FormatterUtil.formatDate(truckingdetail
								.getDateDev()));
						item.setPlaceRev1(doc.getPlaceRev());
						item.setPlaceDelivery1(doc.getPlaceDelivery());
						item.setNoOf20Cont(doc.getNoOf20Cont());
						item.setNoOf40Cont(doc.getNoOf40Cont());
						item.setNoOfOthCont(doc.getOtCont());
						item.setIsLCL(doc.getIsLCL() ? AELConst.HAVE_ONE : AELConst.EMPTY_STRING);
						item.setVehicleNo(truckingdetail.getVehicleNo());
						item.setNoOfCont(truckingdetail.getConsteal() != null ? truckingdetail
								.getConsteal().getNoOfCont()
								: AELConst.EMPTY_STRING);
						item.setVolumn(doc.getCmbText());
						item.setKg(doc.getWeigthText());
						item.setPlacegetcont(truckingdetail.getPlaceGetCont());
						item.setPlaceputcont(truckingdetail.getPlacePutCont());
						item.setChiho(doc.getChiho());
						item.setInvoiceMani(doc.getInvoiceChiho());
						if (truckingdetail.getTransreportext() != null){
							item.setOtherFee(truckingdetail.getTransreportext().getOtherFee());
							item.setAccountingPrice(truckingdetail
									.getTransreportext().getPriceUnit());
							item.setVat(truckingdetail
									.getTransreportext().getVat());
							item.setVatAmount(truckingdetail
									.getTransreportext().getVatValue());
							item.setNote(doc.getNote());
						}
						
						otherFeeTotal = otherFeeTotal.add(ConvertUtil.getNotNullValue(item.getOtherFee()));
						giacaTotal = giacaTotal.add(ConvertUtil
								.getNotNullValue(item.getAccountingPrice()));
						vatAmountTotal = vatAmountTotal.add(ConvertUtil.getNotNullValue(item.getVatAmount()));
						
						item.setIndex(i);
						item.setFeeWithVat(ConvertUtil
								.getNotNullValue(item.getAccountingPrice()).add(
										ConvertUtil
										.getNotNullValue(item.getVatAmount())));
						item.setTotal(item.getFeeWithVat().add(ConvertUtil.getNotNullValue(item.getOtherFee())));
						item.setAelTotal(item.getTotal());
						
						accountingTransExport.add(item);
					}
				}
			}
		}
		Map<String, Object> beans = new LinkedHashMap<>();
		BigDecimal finalTotal = BigDecimal.ZERO;
		//chi phi nha thau
		FeeNameExport  feeNameExportThu = ConvertUtil.fromFeeListToFeeExport(feesListChiho);
		beans.put("feeNames", feeNameExportThu.getName());
		List<BigDecimal> totaTruckingFee = ConvertUtil.createListFromSize(feeNameExportThu.getName().size());
		if (!accountingTransExport.isEmpty() && !feeNameExportThu.getValues().isEmpty()){
			for (int i=0; i<accountingTransExport.size(); ++i){
				accountingTransExport.get(i).setConvertedFeeThu(feeNameExportThu.getValues().get(i));
				//calculate total
				//BigDecimal total = BigDecimal.ZERO;
				if (feeNameExportThu.getValues() != null && !feeNameExportThu.getValues().isEmpty()){
					for (int j=0; j<feeNameExportThu.getValues().get(i).size();++j){
						totaTruckingFee.set(j,totaTruckingFee.get(j).add(ConvertUtil.getNotNullValue(feeNameExportThu.getValues().get(i).get(j).getFeeVal())));
						if ( StringUtils.isNotBlank(feeNameExportThu.getValues().get(i).get(j).getSoHD())){
							accountingTransExport.get(i).setInvoiceTruck(accountingTransExport.get(i).getInvoiceTruck()+ feeNameExportThu.getValues().get(i).get(j).getSoHD());
						}
						accountingTransExport.get(i).setTotal(
								accountingTransExport.get(i).getTotal().add(ConvertUtil.getNotNullValue(feeNameExportThu.getValues().get(i).get(j).getFeeVal())));
					}
					finalTotal = finalTotal.add(accountingTransExport.get(i).getTotal());
				}
			}
		}
		beans.put("totaTruckingFees", totaTruckingFee);

		
		Customer cust = accountingTrans.getCustomer();
		beans.put("custCode", cust.getCode());
		beans.put("custName", cust.getName());
		beans.put("custAddress", cust.getAddress());
		beans.put("custTaxNo", cust.getTaxno());
		beans.put("custPhone", cust.getTel());
		beans.put("custFax", cust.getFax());
		beans.put("tranreports", accountingTransExport);
		beans.put("startDate", accountingTrans.getCondition().getStartDate());
		beans.put("endDate", accountingTrans.getCondition().getEndDate());
		beans.put("refNo", accountingTrans.getRefNo());
		beans.put("chihoTotal", chihoTotal);
		beans.put("giacaTotal", giacaTotal);
		beans.put("otherFeeTotal", otherFeeTotal);
		beans.put("updateDate", CommonUtil.getDateString(Calendar.getInstance().getTime()));
		beans.put("vatAmountTotal", vatAmountTotal);
		beans.put("thanhtien", giacaTotal.add(vatAmountTotal));
		beans.put("total", finalTotal);
		finalTotal = finalTotal.add(chihoTotal);
		beans.put("finalTotal", finalTotal);
		beans.put("totalText",ConvertUtil.convertToVND(finalTotal) );
		return beans;
	}
	
	
	public static Map<String, Object> prepareDataForSavingAccountingTransport(
			AccountingTrans accountingTrans) {
		List<AccountingTransportExport> accountingTransExport = new ArrayList<>();
		BigDecimal chihoTotal = BigDecimal.ZERO;
		BigDecimal giacaTotal = BigDecimal.ZERO;
		BigDecimal otherFeeTotal = BigDecimal.ZERO;
		BigDecimal vatAmountTotal = BigDecimal.ZERO;
		List<List<Exfeetable>> feesListChiho = new ArrayList<>();
		
		if (accountingTrans.getDocs() != null) {
			int i = 0;
			for (Docsgeneral doc : accountingTrans.getDocs()) {
				++i;
				if (doc.getTruckingservice() != null
						&& doc.getTruckingservice().getTruckingdetails() != null) {
					chihoTotal = chihoTotal.add(ConvertUtil
							.getNotNullValue(doc.getChiho()));
					
					for (Truckingdetail truckingdetail : doc
							.getTruckingservice().getTruckingdetails()) {
						AccountingTransportExport item = new AccountingTransportExport();
						feesListChiho.add(truckingdetail.getChihoTruckings());
						item.setJobId(doc.getId());
						item.setJobNo(doc.getJobNo());
						
						if (truckingdetail.getTransreportext() != null){
							item.setOtherFee(truckingdetail.getTransreportext().getOtherFee());
							item.setAccountingPrice(truckingdetail
									.getTransreportext().getPriceUnit());
							item.setVat(truckingdetail
									.getTransreportext().getVat());
							item.setVatAmount(truckingdetail
									.getTransreportext().getVatValue());
							item.setNote(doc.getNote());
						}
						
						otherFeeTotal = otherFeeTotal.add(ConvertUtil.getNotNullValue(item.getOtherFee()));
						giacaTotal = giacaTotal.add(ConvertUtil
								.getNotNullValue(item.getAccountingPrice()));
						vatAmountTotal = vatAmountTotal.add(ConvertUtil.getNotNullValue(item.getVatAmount()));
						
						item.setIndex(i);
						item.setFeeWithVat(ConvertUtil
								.getNotNullValue(item.getAccountingPrice()).add(
										ConvertUtil
										.getNotNullValue(item.getVatAmount())));
						item.setTotal(item.getFeeWithVat().add(ConvertUtil.getNotNullValue(item.getOtherFee())));
						item.setAelTotal(item.getTotal());
						
						accountingTransExport.add(item);
					}
				}
			}
		}
		Map<String, Object> beans = new LinkedHashMap<>();
		beans.put("tranreports", accountingTransExport);
		
		return beans;
	}
	
	/**
	 * Prepare data for Bang Ke Nha Thau
	 * @param accountingTrans
	 * @return
	 */
	public static Map<String, Object> prepareDataForBangKeNhaThau(AccountingTrans accountingTrans){
		Map<String, Object> beans = new LinkedHashMap<>();
		//general info
		beans.put("name", accountingTrans.getNhathau() != null ? accountingTrans.getNhathau().getName() : "");
		beans.put("start",accountingTrans.getCondition().getStartDate());
		beans.put("end",accountingTrans.getCondition().getEndDate());
		List<List<Exfeetable>> feesList = new ArrayList<>();
		
		List<AccountingNhathauExport> accountingNhathauExports = new ArrayList<>();
		if (accountingTrans.getTruckingdetails() != null && !accountingTrans.getTruckingdetails().isEmpty()){
			for (int i=0; i<accountingTrans.getTruckingdetails().size(); ++i){
				Truckingdetail truckingdetail = accountingTrans.getTruckingdetails().get(i);
				feesList.add(truckingdetail.getExfeetables());
				Docsgeneral docsgeneral = truckingdetail.getTruckingservice().getDocsgeneral(); 
				AccountingNhathauExport accountingNhathauExport = new AccountingNhathauExport();
				accountingNhathauExport.setIndex(i+1);
				accountingNhathauExport.setDateDev(truckingdetail.getDateDev());
				accountingNhathauExport.setJobNo(docsgeneral.getJobNo());
				accountingNhathauExport.setCusName(docsgeneral.getCustomer().getName());
				
				accountingNhathauExport.setImportType(docsgeneral.getTypeOfImport()!= null ? docsgeneral.getTypeOfImport().getValue() : AELConst.EMPTY_STRING);
//				if(docsgeneral.getPackageinfo() != null && docsgeneral.getTypeOfImport().getId() == -3){
//					accountingNhathauExport.setPlaceGetCont(docsgeneral.getPackageinfo().getPortOfArrival());
//					accountingNhathauExport.setPlacePutCont(truckingdetail.getTruckingservice().getDeparture());
//				}
//				else if (docsgeneral.getInland() != null){
					accountingNhathauExport.setPlaceGetCont(truckingdetail.getPlaceGetCont());
					accountingNhathauExport.setPlacePutCont(truckingdetail.getPlacePutCont());
//				}
//				else{
//					accountingNhathauExport.setPlaceGetCont(docsgeneral.getPlaceRev());
//					accountingNhathauExport.setPlacePutCont(docsgeneral.getPlaceDelivery());
//				}				
				if (truckingdetail.getConsteal() != null && truckingdetail.getConsteal().getTypeOfCont()!= null){
					accountingNhathauExport.setContNo(truckingdetail.getConsteal().getNoOfCont());
					if (truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_20_START)){
						accountingNhathauExport.setCont20(AELConst.HAVE_ONE);
					}else if (truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_40_START)){
						accountingNhathauExport.setCont40(AELConst.HAVE_ONE);
					} else{
						accountingNhathauExport.setContO(AELConst.HAVE_ONE);
					}
				}else{
					accountingNhathauExport.setContO(AELConst.HAVE_ONE);
				}
				
				accountingNhathauExport.setDeparture(truckingdetail.getTruckingservice().getDocsgeneral().getPlaceRev());
				accountingNhathauExport.setArrival(truckingdetail.getTruckingservice().getDocsgeneral().getPlaceDelivery());
				accountingNhathauExport.setPhuthu(truckingdetail.getPhuthu());
				
				accountingNhathauExports.add(accountingNhathauExport);
			}
		}
		FeeNameExport  feeNameExport = ConvertUtil.fromFeeListToFeeExport(feesList);
		beans.put("feeNames", feeNameExport.getName());
		if (!accountingNhathauExports.isEmpty() && !feeNameExport.getValues().isEmpty()){
			for (int i=0; i<accountingNhathauExports.size(); ++i){
				accountingNhathauExports.get(i).setConvertedFee(feeNameExport.getValues().get(i));
				//calculate total
				BigDecimal total = ConvertUtil.getNotNullValue(accountingNhathauExports.get(i).getPhuthu());
				if (feeNameExport.getValues() != null && !feeNameExport.getValues().isEmpty()){
					for (FeeExportItem exportItem : feeNameExport.getValues().get(i)){
						total = total.add(exportItem.getFeeVal());
					}
					accountingNhathauExports.get(i).setTotal(total);
				}
			}
		}
		beans.put("details", accountingNhathauExports);
		return beans;
	}

	public static void dispatchExhibitionReport(HttpServletResponse response,
			String accountingExhibitionItems,
			String accountingExhibitionItemsTemplate, Exhibition exhibition,
			List<Configuration> masterFee) {
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ accountingExhibitionItems);
		ServletOutputStream out = null;
		try {
			out = response.getOutputStream();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		JasperReport report = null;
		FileInputStream template = null;
		File logo = null;
		try {
			/* template = new FileInputStream("resources/reportTemplate.jrxml"); */
			ClassLoader classLoader = ReportUtil.class.getClassLoader();
			File file = new File(classLoader.getResource(
					accountingExhibitionItemsTemplate).getFile());
			logo = new File(classLoader.getResource(
					ReportTeamplates.ACCOUNTING_EXHIBITION_ITEMS_AEL_LOGO)
					.getFile());
			template = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			System.out.println("File could not be found on filesystem");
		} catch (IOException ioe) {
			System.out.println("Exception while reading the file" + ioe);
		}
		JasperDesign design = null;
		try {
			design = JRXmlLoader.load(template);
		} catch (JRException e) {
			e.printStackTrace();
		}
		// compile the report from the stream
		try {
			report = JasperCompileManager.compileReport(design);
			report.setWhenNoDataType(WhenNoDataTypeEnum.ALL_SECTIONS_NO_DETAIL);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
		}
		try {
			Customer cust = exhibition.getDocsgeneral().getCustomer();
			parameterMap.put("companyName", cust != null ? cust.getName()
					: AELConst.EMPTY_STRING);
			parameterMap.put("address", cust != null ? cust.getAddress()
					: AELConst.EMPTY_STRING);
			parameterMap.put("fax", cust != null ? cust.getFax()
					: AELConst.EMPTY_STRING);
			parameterMap.put("tel", cust != null ? cust.getTel()
					: AELConst.EMPTY_STRING);
			parameterMap.put("attn", exhibition.getAttn());
			parameterMap.put("exhibitor", exhibition.getExhibitor());
			parameterMap.put("exName", exhibition.getExName());
			parameterMap.put("from_to", exhibition.getExhPlace());
			parameterMap.put("cmb",
					exhibition.getDocsgeneral() != null ? exhibition
							.getDocsgeneral().getCmbText()
							: AELConst.EMPTY_STRING);
			parameterMap.put("weight",
					exhibition.getDocsgeneral() != null ? exhibition
							.getDocsgeneral().getNoOfPkgs().toString()
							+ "/"
							+ exhibition.getDocsgeneral().getWeigthText()
									.toString() : AELConst.EMPTY_STRING);
			parameterMap.put("invoiceNo",
					exhibition.getDocsgeneral() != null ? exhibition
							.getDocsgeneral().getJobNo()
							: AELConst.EMPTY_STRING);
			parameterMap.put("accountNo", exhibition.getAccountNo());
			parameterMap.put("mode", AELConst.EMPTY_STRING);
			parameterMap.put("logo", logo != null ? logo.getAbsolutePath()
					: AELConst.EMPTY_STRING);
			parameterMap.put("date",
					CommonUtil.getDateString(exhibition.getDateRe()));
			parameterMap.put("albw", exhibition.getAlbwNo());

			// Calculate total
			double grandTotal = 0;
			if (!exhibition.getExfeetables().isEmpty()) {
				for (Exfeetable fee : exhibition.getExfeetables()) {
					grandTotal += fee.getTotal() != null ? fee.getTotal()
							.doubleValue() : 0;
				}
			}
			parameterMap.put("grandTotal", grandTotal);

			JasperPrint print = JasperFillManager.fillReport(report,
					parameterMap,
					getDataSource(exhibition.getExfeetables(), masterFee));
			if (out != null) {
				JasperExportManager.exportReportToPdfStream(print, out);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
		}
		if (!exhibition.getExfeetables().isEmpty()) {

		}
	}

	// Get datasource for export accounting exhibition
	private static JRDataSource getDataSource(List<Exfeetable> fees,
			List<Configuration> masterFee) {
		Collection<ExhibitionFeetable> coll = new ArrayList<ExhibitionFeetable>();
		for (Configuration master : masterFee) {
			List<AccountingExhibitionItemExport> tmpEx = new ArrayList<AccountingExhibitionItemExport>();
			for (Exfeetable fee : fees) {
				if (fee.getMasterFee()!=null) {
					if (fee.getMasterFee().getId().toString()
							.equals(master.getId().toString())) {
						AccountingExhibitionItemExport item = new AccountingExhibitionItemExport(
								fee.getName().getValue(), "",
								ConvertUtil.getNotNullValue(fee.getTotal()));
						tmpEx.add(item);
					}
				}
				
			}
			if (!tmpEx.isEmpty()) {
				ExhibitionFeetable bean = new ExhibitionFeetable(tmpEx,
						master.getValue());
				coll.add(bean);
			}

		}
		return new JRBeanCollectionDataSource(coll);
	}

	public static Map<String, Object> prepareDataForAdvanceRequest(
			Advanceform advanceForm,
			Map<Integer, BigDecimal> listRemainAdvancebyJob) {
		Map<String, Object> beans = new LinkedHashMap<>();
		double total = 0;
		BigDecimal totalRemainAdv = BigDecimal.ZERO;
		int index = 0;
		List<AdvanceRequestItem> listAdvance = new ArrayList<AdvanceRequestItem>();
		List<Advancedetail> listAdvanceDetail = new ArrayList<Advancedetail>();
		listAdvanceDetail.addAll(advanceForm.getAdvancedetails());
		if (!listAdvanceDetail.isEmpty()) {
			/*for (Advancedetail advancedetail : listAdvanceDetail) {
				try {
					if (listRemainAdvancebyJob.containsKey(advancedetail.getDocs().getId().intValue())) {
						BigDecimal tmp = listRemainAdvancebyJob.get(advancedetail.getDocs().getId().intValue()).subtract(advancedetail.getAmount());
						if (tmp.doubleValue()>=0) {
							listRemainAdvancebyJob.put(advancedetail.getDocs().getId().intValue(), tmp);
						}						
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}*/
			Map<Integer, BigDecimal> usedRemain = new HashMap<Integer, BigDecimal>();
			for (Advancedetail advancedetail : listAdvanceDetail) {
				AdvanceRequestItem item = new AdvanceRequestItem();
				index++;
				item.setJobNo(advancedetail.getDocs() != null ? advancedetail
						.getDocs().getJobNo() : AELConst.EMPTY_STRING);
				item.setPackageDetail(advancedetail.getGoodDes());
				item.setAdvanceReason(advancedetail.getDescription());
				item.setAmount(ConvertUtil.getNotNullValue(advancedetail.getAmount()));
				if (advanceForm.getIsAdmin() != null && advanceForm.getIsAdmin() == false){
					item.setRemainAdvance(ConvertUtil.getNotNullValue(listRemainAdvancebyJob.get(
							advancedetail.getDocs().getId().intValue())));
					if (!usedRemain.containsKey(advancedetail.getDocs().getId().intValue())) {
						totalRemainAdv = totalRemainAdv.add(listRemainAdvancebyJob.get(
								advancedetail.getDocs().getId().intValue()));
						usedRemain.put(advancedetail.getDocs().getId().intValue(), totalRemainAdv);
					}
				}
				
				item.setIndex(index);
				total += ConvertUtil.getNotNullValue(advancedetail.getAmount()).doubleValue();
				listAdvance.add(item);
			}
		}
		beans.put("advanceDetails", listAdvance);
		beans.put("total", total);
		beans.put("advanceDate",
				CommonUtil.getDateString(advanceForm.getDate()));
		beans.put("employee", advanceForm.getEmployee());
		beans.put("refundDate",
				CommonUtil.getDateString(advanceForm.getTimeRefund()));
		beans.put("totalRemainAdv", ConvertUtil.getNotNullValue(totalRemainAdv));
		beans.put("refNo", advanceForm.getRefCode());
		beans.put("amountVND", ConvertUtil.convertToVND(BigDecimal.valueOf(total)));
		return beans;
	}

	public static Map<String, Object> prepareDataForRefundRequest(Refund refund) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		List<Refunddetail> refundDetails = new ArrayList<Refunddetail>();
		if (refund.getRefunddetails() != null) {
			refundDetails.addAll(refund.getRefunddetails());
		}
		List<RefundRequestItem> listItem = new ArrayList<RefundRequestItem>();
		BigDecimal totalAmount = BigDecimal.ZERO;
		BigDecimal totalOAmount = BigDecimal.ZERO;
		BigDecimal grandTotal = BigDecimal.ZERO;
		int index = 0;
		if (!refund.getRefunddetails().isEmpty()) {
			for (Refunddetail refunddetail : refundDetails) {
				RefundRequestItem item = new RefundRequestItem();
				index++;
				item.setIndex(index);
				item.setFileCus(refunddetail.getDocs() != null ? refunddetail
						.getDocs().getJobNo() : AELConst.EMPTY_STRING);
				item.setDescription(refunddetail.getDescription());
				item.setAmount(ConvertUtil.getNotNullRound(refunddetail.getAmount()));
				item.setoAmount(ConvertUtil.getNotNullRound(refunddetail.getOAmount()));
				totalAmount = totalAmount.add(item.getAmount());
				totalOAmount = totalOAmount.add(item.getoAmount());
				try {
					if (refunddetail.getDocs().getIsLCL()) {
						item.setCont("LCL");
					}
					else {
						String cont = "FCL/"+refunddetail.getDocs().getNoOf20Cont()+"/"+refunddetail.getDocs().getNoOf40Cont()+"/"+refunddetail.getDocs().getOtCont();
						item.setCont(cont);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				listItem.add(item);
			}
			grandTotal = grandTotal.add(totalAmount);
			grandTotal = grandTotal.add(totalOAmount);
			parameterMap.put("refundDetails", listItem);
			parameterMap.put("totalAmount", totalAmount);
			parameterMap.put("totalOAmount",totalOAmount);
			parameterMap.put("employee", refund.getEmployee());
			parameterMap.put("grandTotal", grandTotal);
			parameterMap.put("refundDate",
					CommonUtil.getDateString(refund.getDate()));
			parameterMap.put("refNo", refund.getRefCode());
			parameterMap.put("amountVND", ConvertUtil.convertToVND(grandTotal));
		}
		return parameterMap;
	}

	public static Map<String, Object> prepareDataForPhieuChi(
			BasicAdvance advanceForm) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		/*List<Advancedetail> listAdvanceDetail = new ArrayList<Advancedetail>();
		listAdvanceDetail.addAll(advanceForm.getAdvancedetails());*/
		BigDecimal total = advanceForm.getMultipleTotal();//BigDecimal.ZERO;
		/*if (!listAdvanceDetail.isEmpty()) {
			for (Advancedetail advancedetail : listAdvanceDetail) {
				total = total.add(advancedetail.getAmount());
			}
		}*/
		if (advanceForm.getMoneyBook() != null) {
			parameterMap.put("voucherNo", advanceForm.getMoneyBook().getVoucherNoPrint());
			parameterMap.put("reason", advanceForm.getMoneyBook().getDescription());
			
			Calendar cal = Calendar.getInstance();
			//cal.setTime(advanceForm.getDate());
			cal.setTime(advanceForm.getMoneyBook().getDate());
			parameterMap.put("day", cal.get(Calendar.DAY_OF_MONTH));
			parameterMap.put("month", cal.get(Calendar.MONTH) + 1);
			parameterMap.put("year", cal.get(Calendar.YEAR));
		}
		parameterMap.put("refNo", advanceForm.getMultipleRefCode());
		parameterMap.put("employee", advanceForm.getEmployee());
		parameterMap.put("amount", total);
		parameterMap.put("amountVND", ConvertUtil.convertToVND(total));
		return parameterMap;
	}
	
	

	public static Map<String, Object> prepareDataForPhieuThu(Refund refund) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
			
		BigDecimal total = BigDecimal.ZERO;
		/*StringBuffer payReason = new StringBuffer();*/
		List<Refunddetail> listRefundDetail = new ArrayList<Refunddetail>();
		List<Exfeetable> listExFeetable = new ArrayList<Exfeetable>();
		listRefundDetail.addAll(refund.getRefunddetails());
		listExFeetable.addAll(refund.getExfeetables());
		
		if (!listRefundDetail.isEmpty()) {
			for (Refunddetail refunddetail : listRefundDetail) {
				try {
					total = total.add(refunddetail.getAmount());
					if (refunddetail.getOAmount()!=null) {
						total = total.add(refunddetail.getOAmount());
					}
					String jobNo = AELConst.EMPTY_STRING;
					if (refunddetail.getDocs()!=null) {
						jobNo=refunddetail.getDocs().getJobNo();
					}
				} catch (Exception e) {
					
				}
				/*String tmp = jobNo != null ? refunddetail.getDescription() + " ("+jobNo+") " : refunddetail.getDescription() ;
				if (listRefundDetail.indexOf(refunddetail) != listRefundDetail.size()-1) {
					tmp+=",";
				}					
				payReason.append(tmp);*/
			}
		}
		if (!listExFeetable.isEmpty()) {
			for (Exfeetable exfeetable : listExFeetable) {
				try {
					total= total.add(exfeetable.getTotal());
				} catch (Exception e) {
					
				}
				/*String tmp =exfeetable.getName().getValue();
				if (listExFeetable.indexOf(exfeetable) != listExFeetable.size()-1) {
					tmp+=",";
				}					
				payReason.append(tmp);*/
			}
		}

		if (refund.getMoneyBook() != null) {
			parameterMap.put("voucherNo", refund.getMoneyBook().getVoucherNoPrint());
			parameterMap.put("reason", refund.getMoneyBook().getDescription());
			Calendar cal = Calendar.getInstance();
			cal.setTime(refund.getMoneyBook().getDate());
			parameterMap.put("day", cal.get(Calendar.DAY_OF_MONTH));
			parameterMap.put("month", cal.get(Calendar.MONTH) + 1);
			parameterMap.put("year", cal.get(Calendar.YEAR));
		}
		parameterMap.put("refNo", refund.getMultipleRefCode());
		parameterMap.put("employee", refund.getEmployee());
		parameterMap.put("amount", refund.getMultipleTotal());
		parameterMap.put("amountVND", ConvertUtil.convertToVND(total));
		return parameterMap;
	}

	public static Map<String, Object> prepareDataForKHVTNoidia(
			AccountingTrans accountingTrans) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("startDate", accountingTrans.getCondition().getStartDate());
		parameterMap.put("endDate", accountingTrans.getCondition().getEndDate());
		List<KeHoachVanTaiExport> hoachVanTaiExports = new ArrayList<>();
		List<List<Exfeetable>> feesList = new ArrayList<>();
		if (accountingTrans.getTruckingdetails() != null && !accountingTrans.getTruckingdetails().isEmpty()){
			for (int i=0; i<accountingTrans.getTruckingdetails().size(); ++i){
				Truckingdetail truckingdetail = accountingTrans.getTruckingdetails().get(i);
				feesList.add(truckingdetail.getExfeetables());
				Docsgeneral docsgeneral = truckingdetail.getTruckingservice().getDocsgeneral(); 
				KeHoachVanTaiExport keHoachVanTaiExport = new KeHoachVanTaiExport();
				keHoachVanTaiExport.setDateDev(truckingdetail.getDateDev());
				keHoachVanTaiExport.setJobNo(docsgeneral.getJobNo());
				keHoachVanTaiExport.setCusName(docsgeneral.getCustomer().getName());
				keHoachVanTaiExport.setTotal(ConvertUtil.getNotNullValue(truckingdetail.getTotal()));
				keHoachVanTaiExport.setNhathau(truckingdetail.getNhathau() != null ? truckingdetail.getNhathau().getCode() : AELConst.EMPTY_STRING);
				if (truckingdetail.getConsteal() != null && truckingdetail.getConsteal().getTypeOfCont()!= null){
					keHoachVanTaiExport.setContNo(truckingdetail.getConsteal().getNoOfCont());
					if (truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_20_START)){
						keHoachVanTaiExport.setCont20(AELConst.HAVE_ONE);
					}else if (truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_40_START)){
						keHoachVanTaiExport.setCont40(AELConst.HAVE_ONE);
					} else{
						keHoachVanTaiExport.setContO(AELConst.HAVE_ONE);
					}
				}else{
					keHoachVanTaiExport.setContL(AELConst.HAVE_ONE);
				}
				keHoachVanTaiExport.setDeparture(truckingdetail.getTruckingservice().getDocsgeneral().getPlaceRev());
				keHoachVanTaiExport.setArrival(truckingdetail.getTruckingservice().getDocsgeneral().getPlaceDelivery());
				keHoachVanTaiExport.setShipName(truckingdetail.getVehicleNo()+AELConst.SPLASH+truckingdetail.getNoOfVehicle());
				keHoachVanTaiExport.setEta(truckingdetail.getTruckingservice().getDocsgeneral().getInland().getEta());
				keHoachVanTaiExport.setEtd(truckingdetail.getTruckingservice().getDocsgeneral().getInland().getEtd());
				keHoachVanTaiExport.setDocReceiveDate(truckingdetail.getTruckingservice().getDocsgeneral().getDocReceiveDate());
				hoachVanTaiExports.add(keHoachVanTaiExport);
			}
		}
		 if (accountingTrans.getCondition().getTransId().intValue() == ServicesType.DVVT_SEALAND.getValue()){
			 parameterMap.put("detail", hoachVanTaiExports);
		 }else{
			    FeeNameExport  feeNameExport = ConvertUtil.fromFeeListToFeeExport(feesList);
			    parameterMap.put("feeNames", feeNameExport.getName());
				if (!hoachVanTaiExports.isEmpty() && !feeNameExport.getValues().isEmpty()){
					for (int i=0; i<hoachVanTaiExports.size(); ++i){
						hoachVanTaiExports.get(i).setConvertedFee(feeNameExport.getValues().get(i));
						//calculate total
						BigDecimal total = BigDecimal.ZERO;
						if (feeNameExport.getValues() != null && !feeNameExport.getValues().isEmpty()){
							for (FeeExportItem exportItem : feeNameExport.getValues().get(i)){
								total = total.add(exportItem.getFeeVal());
							}
							hoachVanTaiExports.get(i).setTotal(total);
						}
					}
				}
			 parameterMap.put("details", hoachVanTaiExports);
		 }
		return parameterMap;
	}

	public static Map<String, Object> prepareDataForKHVTThongquan(
			AccountingTrans accountingTrans) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("startDate", accountingTrans.getCondition().getStartDate());
		parameterMap.put("endDate", accountingTrans.getCondition().getEndDate());
		
		List<KeHoachVanTaiThongQuanExport> hoachVanTaiExports = new ArrayList<>();
		if (accountingTrans.getTruckingdetails() != null && !accountingTrans.getTruckingdetails().isEmpty()){
			for (int i=0; i<accountingTrans.getTruckingdetails().size(); ++i){
				Truckingdetail truckingdetail = accountingTrans.getTruckingdetails().get(i);
				Docsgeneral docsgeneral = truckingdetail.getTruckingservice().getDocsgeneral(); 
				KeHoachVanTaiThongQuanExport keHoachVanTaiExport = new KeHoachVanTaiThongQuanExport();
				keHoachVanTaiExport.setDateDev(truckingdetail.getDateDev());
				keHoachVanTaiExport.setJobNo(docsgeneral.getJobNo());
				keHoachVanTaiExport.setCusName(docsgeneral.getCustomer().getName());
				keHoachVanTaiExport.setNhathau(truckingdetail.getNhathau() != null ? truckingdetail.getNhathau().getCode() : AELConst.EMPTY_STRING);
				if (truckingdetail.getConsteal() != null && truckingdetail.getConsteal().getTypeOfCont()!= null){
					keHoachVanTaiExport.setContNo(truckingdetail.getConsteal().getNoOfCont());
					if (truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_20_START)){
						keHoachVanTaiExport.setCont20(AELConst.HAVE_ONE);
					}else if (truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_40_START)){
						keHoachVanTaiExport.setCont40(AELConst.HAVE_ONE);
					} else{
						keHoachVanTaiExport.setContO(AELConst.HAVE_ONE);
					}
				}else{
					keHoachVanTaiExport.setPks(truckingdetail.getTruckingservice().getDocsgeneral().getNoOfPkgsText());
					keHoachVanTaiExport.setWeight(truckingdetail.getTruckingservice().getDocsgeneral().getWeigthText());
				}
				keHoachVanTaiExport.setDeparture(truckingdetail.getTruckingservice().getDocsgeneral().getPlaceRev());
				keHoachVanTaiExport.setArrival(truckingdetail.getTruckingservice().getDocsgeneral().getPlaceDelivery());
				keHoachVanTaiExport.setEta(docsgeneral.getPackageinfo().getEta());
				keHoachVanTaiExport.setBill(docsgeneral.getPackageinfo().getBillOfLading());
				keHoachVanTaiExport.setImportType(docsgeneral.getTypeOfImport().getValue());
				keHoachVanTaiExport.setFreeTime(ConvertUtil.getNotNullValue(docsgeneral.getPackageinfo().getFreeDemDate())+AELConst.SPLASH
						+ConvertUtil.getNotNullValue(docsgeneral.getPackageinfo().getFreeDetDate()));
				keHoachVanTaiExport.setCusDate(docsgeneral.getPackageinfo().getCustomsDate());
				keHoachVanTaiExport.setSotkhq(docsgeneral.getPackageinfo().getCusDecOnNo());
				keHoachVanTaiExport.setShipper(docsgeneral.getPackageinfo().getShipper());
				hoachVanTaiExports.add(keHoachVanTaiExport);
			}
			 parameterMap.put("detail", hoachVanTaiExports);
		}
		
		return parameterMap;
	}

	public static Map<String, Object> prepareDataForShipmentControl(
			AccountingTrans accountingTrans) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("startDate", accountingTrans.getCondition().getStartDate());
		parameterMap.put("endDate", accountingTrans.getCondition().getEndDate());
		List<AccountingShipmentExport> hoachVanTaiExports = new ArrayList<>();
		if (accountingTrans.getDocs() != null) {
			int i = 0;
			for (Docsgeneral doc : accountingTrans.getDocs()) {
				++i;
				AccountingShipmentExport accountingShipmentExport = new AccountingShipmentExport();
				accountingShipmentExport.setIndex(i);
				accountingShipmentExport.setJobNo(doc.getJobNo());
				accountingShipmentExport.setShipper(doc.getPackageinfo().getShipper());
				accountingShipmentExport.setPoNo(doc.getPackageinfo().getPo());
				accountingShipmentExport.setInvNo(doc.getPackageinfo().getInvoice());
				accountingShipmentExport.setBillNo(doc.getPackageinfo().getBillOfLading());
				if (doc.getTypeOfContainer().getId() == TypeOfContainer.FCL){
					accountingShipmentExport.setContL(TypeOfContainer.FCL_CHAR);
					accountingShipmentExport.setCont20(doc.getNoOf20Cont());
					accountingShipmentExport.setCont40(doc.getNoOf40Cont());
					
				}else{
					accountingShipmentExport.setContL(TypeOfContainer.LCL_CHAR);
				}
				
				accountingShipmentExport.setPks(doc.getNoOfPkgs());
				accountingShipmentExport.setWeight(doc.getWeigth());
				accountingShipmentExport.setShippingLine(doc.getShippingLine().getName());
				accountingShipmentExport.setEta(doc.getPackageinfo().getEta());
				accountingShipmentExport.setArrival(doc.getPackageinfo().getPortOfArrival());
				accountingShipmentExport.setDocOriginalDate(doc.getDocReceiveDate());
				accountingShipmentExport.setDecDate(doc.getPackageinfo().getCustomsDate());
				accountingShipmentExport.setSoToKhai(doc.getPackageinfo().getCusDecOnNo());
				accountingShipmentExport.setColour(doc.getPackageinfo().getColourApplying().getDescription());
				
				accountingShipmentExport.setDateActualDev(doc.getPackageinfo().getDateActualDev());
				accountingShipmentExport.setDateFinCustom(doc.getPackageinfo().getDateFinCustom());
				accountingShipmentExport.setDateRevOrgDoc(doc.getPackageinfo().getDateRevOrgDoc());
				accountingShipmentExport.setDateRevOrgTax(doc.getPackageinfo().getDateRevOrgTax());
				accountingShipmentExport.setDateSend(doc.getPackageinfo().getDateSend());
				accountingShipmentExport.setDateStartECus(doc.getPackageinfo().getDateStartECus());
				hoachVanTaiExports.add(accountingShipmentExport);
			}
		}
		
	    parameterMap.put("detail", hoachVanTaiExports);
		
		return parameterMap;
	}

	public static Map<String, Object> prepareDataForProfitLoss(
			AccountingTrans accountingTrans) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("startDate", accountingTrans.getCondition().getStartDate());
		parameterMap.put("endDate", accountingTrans.getCondition().getEndDate());
		List<AccountingProfitLossExport> profitLossExports = new ArrayList<>();
		List<List<Exfeetable>> feesList = new ArrayList<>();
		List<List<Exfeetable>> feesListThu = new ArrayList<>();
		if (accountingTrans.getTruckingdetails() != null && !accountingTrans.getTruckingdetails().isEmpty()){
			for (int i=0; i<accountingTrans.getTruckingdetails().size(); ++i){
				Truckingdetail truckingdetail = accountingTrans.getTruckingdetails().get(i);
				Docsgeneral docsgeneral = truckingdetail.getTruckingservice().getDocsgeneral(); 
				feesList.add(docsgeneral.getExfeetables());
				feesListThu.add(truckingdetail.getExfeetables());
				AccountingProfitLossExport profitLossExport = new AccountingProfitLossExport();
				profitLossExport.setJobNo(docsgeneral.getJobNo());
				profitLossExport.setCusName(docsgeneral.getCustomer().getName());
				profitLossExport.setContNo(truckingdetail.getConsteal() != null ? truckingdetail.getConsteal().getNoOfCont() : AELConst.EMPTY_STRING);
				profitLossExport.setNhathau(truckingdetail.getNhathau() != null ? truckingdetail.getNhathau().getName() : AELConst.EMPTY_STRING);
				profitLossExport.setDateDev(truckingdetail.getDateDev());
				//chi phi manifest
				profitLossExport.setTongChi(ConvertUtil.getNotNullValue(docsgeneral.getTongChiPhi()));
				//chi phi nha thau
				profitLossExport.setTongThu(ConvertUtil.getNotNullValue(docsgeneral.getTongThu()));
				//thu ho
				profitLossExport.setThuHo(truckingdetail.getTruckingservice().getDocsgeneral().getChiho());
				//debit
				profitLossExport.setDebit(truckingdetail.getTruckingservice().getDocsgeneral().getDebit());
				
				profitLossExport.setProfitLoss(profitLossExport.getThuHo().add(profitLossExport.getDebit()).subtract(profitLossExport.getTongThu().add(profitLossExport.getTongChi())));
				
				profitLossExports.add(profitLossExport);
			}
		}
		//chi phí manifest
			    FeeNameExport  feeNameExport = ConvertUtil.fromFeeListToFeeExportFeeType(feesList);
			    parameterMap.put("feeNames", feeNameExport.getName());
				if (!profitLossExports.isEmpty() && !feeNameExport.getValues().isEmpty()){
					for (int i=0; i<profitLossExports.size(); ++i){
						profitLossExports.get(i).setConvertedFee(feeNameExport.getValues().get(i));
					}
				}
				//chi phí nha thau
				 FeeNameExport  feeNameExportThu = ConvertUtil.fromFeeListToFeeExport(feesListThu);
				    parameterMap.put("feeNamesThu", feeNameExportThu.getName());
					if (!profitLossExports.isEmpty() && !feeNameExportThu.getValues().isEmpty()){
						for (int i=0; i<profitLossExports.size(); ++i){
							profitLossExports.get(i).setConvertedFeeThu(feeNameExportThu.getValues().get(i));
							//calculate total
//							BigDecimal total = BigDecimal.ZERO;
//							if (feeNameExportThu.getValues() != null && !feeNameExportThu.getValues().isEmpty()){
//								for (FeeExportItem exportItem : feeNameExportThu.getValues().get(i)){
//									total = total.add(exportItem.getFeeVal());
//								}
//								profitLossExports.get(i).setTotal(total);
//							}
						}
					}
			 parameterMap.put("details", profitLossExports);
		return parameterMap;
	}
	public static List<AdvanceSumaryExportDTO> convertAdvSumaryForExport(List<AdvanceSumary> advSumary){
		List<AdvanceSumaryExportDTO> result = new ArrayList<AdvanceSumaryExportDTO>();
		if (!advSumary.isEmpty()) {
		for (AdvanceSumary advS : advSumary) {
			AdvanceSumaryExportDTO item = new AdvanceSumaryExportDTO();
			item.setEmployeeName(advS.getEmployeeName());
			item.setTotalAdvanceBefore(NumberFormat.getCurrencyInstance().format(advS.getTotalAdvanceBefore()).replace("$", ""));
			item.setTotalAdvanceBetween(NumberFormat.getCurrencyInstance().format(advS.getTotalAdvanceBetween()).replace("$", ""));
			item.setTotalAdvanceAfter(NumberFormat.getCurrencyInstance().format(advS.getTotalAdvanceAfter()).replace("$", ""));
			item.setTotalRefundBefore(NumberFormat.getCurrencyInstance().format(advS.getTotalRefundBefore()).replace("$", ""));
			item.setTotalRefundBetween(NumberFormat.getCurrencyInstance().format(advS.getTotalRefundBetween()).replace("$", ""));
			item.setTotalRefundAfter(NumberFormat.getCurrencyInstance().format(advS.getTotalRefundAfter()).replace("$", ""));
			result.add(item);
		}
		}
		return result;
	}

	/**
	 * Prepare data for Thanh toan Job
	 * @param refund
	 * @return
	 */
	public static Map<String, Object> prepareDataForJobRefundRequest(
			Refund refund) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		List<Exfeetable> exfeetables = new ArrayList<Exfeetable>();
		if (refund.getExfeetables() != null) {
			exfeetables.addAll(refund.getExfeetables());
		}
		List<RefundRequestItem> listItem = new ArrayList<RefundRequestItem>();
		BigDecimal totalAmount = BigDecimal.ZERO;
		BigDecimal totalOAmount = BigDecimal.ZERO;
		BigDecimal grandTotal = BigDecimal.ZERO;
		int index = 0;
		if (!refund.getRefunddetails().isEmpty()) {
			for (Exfeetable exfeetable : exfeetables) {
				RefundRequestItem item = new RefundRequestItem();
				index++;
				item.setIndex(index);
				item.setFileCus(exfeetable.getDocsgeneral() != null ? exfeetable
						.getDocsgeneral().getJobNo() : AELConst.EMPTY_STRING);
				item.setDescription(exfeetable.getName().getValue());
				BigDecimal total = ConvertUtil.getNotNullRound(exfeetable.getTotal());
				if (exfeetable.getInvoiceNo() == null || exfeetable.getInvoiceNo().isEmpty() || exfeetable.getInvoiceNo().trim().isEmpty()){
					item.setoAmount(total);
					totalOAmount = totalOAmount.add(total);
				}else{
					item.setAmount(total);
					totalAmount = totalAmount.add(total);
				}
				
				
				try {
					if (exfeetable.getDocsgeneral().getIsLCL()) {
						item.setCont("LCL");
					}
					else {
						String cont = "FCL/"+exfeetable.getDocsgeneral().getNoOf20Cont()+"/"+exfeetable.getDocsgeneral().getNoOf40Cont()+"/"+exfeetable.getDocsgeneral().getOtCont();
						item.setCont(cont);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				listItem.add(item);
			}
			totalAmount = ConvertUtil.getNotNullRound(totalAmount);
			totalOAmount = ConvertUtil.getNotNullRound(totalOAmount);
			grandTotal = grandTotal.add(totalAmount);
			grandTotal = grandTotal.add(totalOAmount);
			parameterMap.put("refundDetails", listItem);
			parameterMap.put("totalAmount", totalAmount);
			parameterMap.put("totalOAmount", totalOAmount);
			parameterMap.put("employee", refund.getEmployee());
			parameterMap.put("grandTotal", grandTotal);
			parameterMap.put("refundDate",
					CommonUtil.getDateString(refund.getDate()));
			parameterMap.put("refNo", refund.getRefCode());
			parameterMap.put("amountVND", ConvertUtil.convertToVND(grandTotal));
		}
		return parameterMap;
	}
	//Add by Phuc
		public static Map<String, Object> prepareDataForRefundTrucking(Truckingservice truckingservice, User employee) {
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			List<RefundRequestItem> listItem = new ArrayList<RefundRequestItem>();
			BigDecimal totalAmount = BigDecimal.ZERO;
			BigDecimal totalOAmount = BigDecimal.ZERO;
			BigDecimal grandTotal = BigDecimal.ZERO;
			int index = 0;
			if(truckingservice.getTruckingdetails() != null && !truckingservice.getTruckingdetails().isEmpty()){
				for(Truckingdetail truckingdetail : truckingservice.getTruckingdetails()){
					if(truckingdetail != null && truckingdetail.getExfeetables() != null && !truckingdetail.getExfeetables().isEmpty()){
						for (Exfeetable exfeetable : truckingdetail.getExfeetables()) {
							RefundRequestItem item = new RefundRequestItem();
							index++;
							item.setIndex(index);
							item.setFileCus(truckingservice.getDocsgeneral().getJobNo());
							BigDecimal total = ConvertUtil.getNotNullRound(exfeetable.getTotal());
							if (exfeetable.getInvoiceNo() == null || exfeetable.getInvoiceNo().isEmpty() || exfeetable.getInvoiceNo().trim().isEmpty()){
								item.setoAmount(total);
								totalOAmount = totalOAmount.add(total);
							}else{
								item.setAmount(total);
								totalAmount = totalAmount.add(total);
							}																								
							listItem.add(item);
						}					
					}
				}
			}
			totalAmount = ConvertUtil.getNotNullRound(totalAmount);
			totalOAmount = ConvertUtil.getNotNullRound(totalOAmount);
			grandTotal = grandTotal.add(totalAmount);
			grandTotal = grandTotal.add(totalOAmount);
			parameterMap.put("refundDetails", listItem);
			parameterMap.put("totalAmount", totalAmount);
			parameterMap.put("totalOAmount", totalOAmount);
			parameterMap.put("employee", employee);
			parameterMap.put("grandTotal", grandTotal);
			parameterMap.put("refundDate",
					CommonUtil.getDateString(new Date()));
			parameterMap.put("amountVND", ConvertUtil.convertToVND(grandTotal));
			return parameterMap;
		}
		//End Add by Phuc
}