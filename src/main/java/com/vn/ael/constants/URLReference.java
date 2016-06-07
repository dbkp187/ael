package com.vn.ael.constants;

public interface URLReference {
	
	String HOME_PAGE = "/home";
	
	String NHATHAU_FORM = "/admin/config/nhathauForm";
	String NHATHAU_LIST = "/admin/config/nhathauList";
	String BANK_FORM = "/admin/config/bankForm";
	String BANK_LIST = "/admin/config/bankList";
	
	String CONSTANST_FORM = "/admin/config/constantForm";
	String CONSTANST_LIST = "/admin/config/constantList";
	
	String CUSTOMER_FORM = "/admin/sales/customer";
	String CUSTOMER_LIST = "/admin/sales/customerList";
	
	String OFFERPRICE_FORM = "/admin/sales/offerPrice";
	String OFFERFORM_DOWN_ATTACHMENT = "/admin/sales/download/offerAttachment";
	String OFFERPRICE_ATTACHMENT_LIST = "/admin/sales/attachment/list";
	String OFFERPRICE_LIST = "/admin/sales/offerPriceList";
	
	String OFFERITEM_FORM = "/admin/sales/offerItem";
	String OFFERITEM_LIST = "/admin/sales/offerItemList";

	String PACKAGEINFO_FORM = "/admin/docs/packageInfo";
	String DOCSGENERAL_INVOICES = "/admin/docs/download/offerAttachment";
	String PACKAGEINFO_LIST= "/admin/docs/packageInfoList";
	
	String CONTSEAL_FORM = "/admin/docs/contseal";
	String SERVICES_ATTACH = "/admin/docs/docservice";
	
	String INLAND_FORM = "/admin/docs/inland";
	String INLAND_LIST = "/admin/docs/inlandList";
	
	String INLAND_SIZES_FORM = "/admin/docs/inlandsize";
	String MULTI_TYPE_FORM = "/admin/docs/multitype";
	
	String EXHIBITION_FORM = "/admin/docs/exhibition";
	String EXHIBITION_LIST = "/admin/docs/exhibitionList";
	
	String TRUCKING_LIST = "/admin/trucking/list";
	String TRUCKING_SERVICE = "/admin/trucking/service";
	
	String ACCOUNTING_CUSTOM_LIST = "/admin/accounting/customList";
	String ACCOUNTING_TRANSPORT_LIST = "/admin/accounting/transportList";
	String ACCOUNTING_EXHIBITION_LIST = "/admin/accounting/exhibitionList";
	
	String ACCOUNTING_CUSTOM = "/admin/accounting/custom";
	String ACCOUNTING_CUSTOM_AJAX = "/admin/accounting/custom/ajax";
	String ACCOUNTING_CUSTOM_EXCEL = "/admin/accounting/customExcel";
	String ACCOUNTING_TRANSPORT = "/admin/accounting/transport";
	String ACCOUNTING_EXHIBITION = "/admin/accounting/exhibition";
	
	String ACCOUNTING_FEE_LIST = "/admin/accounting/feeTables";
	String ACCOUNTING_FEE_LIST_DETAIL = "/admin/accounting/feesDetail";
	String ACCOUNTING_FEE_LIST_ADVDETAIL = "/admin/accounting/advDetail";
	String ACCOUNTING_FEE_NHATHAU_LIST_DETAIL = "/admin/accounting/feeNhathauDetail";
	String ACCOUNTING_FEE_REFUND_LIST_DETAIL = "/admin/accounting/feeRefundDetail";
	String ACCOUNTING_FEE_REFUND_ADMIN_LIST_DETAIL = "/admin/accounting/feeRefundAdminDetail";
	
	String ACCOUNTING_FEE_CHANGE_APPROVAL = "/admin/accounting/changeApproval";
	String ACCOUNTING_FEE_CHANGE_APPROVAL_BULK = "/admin/accounting/changeApprovalBulk";
	String ACCOUNTING_REFUND_JOB_CHANGE_APPROVAL = "/admin/accounting/changeRefundJobApproval";
	String ACCOUNTING_REFUND_ADMIN_CHANGE_APPROVAL = "/admin/accounting/changeRefundAdminApproval";
	String ACCOUNTING_ADVANCE_CHANGE_APPROVAL = "/admin/accounting/changeAdvanceApproval";
	
	String ACCOUNTING_FEE_CHANGE_APPROVAL_ADMIN = "/admin/changeApproval";
	String ACCOUNTING_FEE_CHANGE_APPROVAL_ADMIN_BULK = "/admin/changeApprovalBulk";
	String ACCOUNTING_FEE_LIST_ADMIN = "/admin/feeTables";
	
	String AJAX_ADD_CONSTANT = "/admin/config/constant";
	
	String AJAX_REPORT_SALES = "/admin/sales/download";
	String AJAX_REPORT_BIENBAN= "/admin/docs/downloadBienbang";
	
	String ADVANCE_REFUNDS = "/users/advanceRefunds";
	String ADVANCE_FORM = "/users/advanceForm";
	String REFUND_FORM = "/users/refund";
	String REFUND_JOB_FORM ="/users/refundJob";
	
	String ADVANCE_FORM_ACC = "/admin/accounting/advanceRefunds";
	String LIABILITY_DETAIL = "/admin/accounting/liabilityDetail";
	String LIABILITY_DETAIL_USER = "/users/liabilityDetail";
	
	String AJAX_REPORT_DEBIT_NOTE = "/admin/accounting/custom/download";
	
	String ACCOUNTING_NHATHAU_LIST = "/admin/accounting/nhathau/nhathauList";
	String ACCOUNTING_NHATHAU = "/admin/accounting/nhathau/nhathau";
	String ACCOUNTING_NHATHAU_SEARCH = "/admin/accounting/nhathau/nhathauSearch";
	String ACCOUNTING_NHATHAU_DETAIL = "/admin/accounting/nhathau/nhathauDetail";
	
	String ACCOUNTING_SHIPMENT = "/admin/docs/shipment";
	String ACCOUNTING_PROFIT_LOSS = "/admin/accounting/profitloss";
	
	String PACKAGEINFO_SEARCH = "/admin/docs/searchPackageInfo";
	String INLAND_SEARCH = "/admin/docs/searchInland";
	String EXHIBITION_SEARCH = "/admin/docs/searchExhibition";
	String TRUCKING_SEARCH = "/admin/trucking/searchTrucking";
	String ACCPACKAGEINFO_SEARCH = "/admin/accounting/searchAccPackageInfo";
	String ACCEXHIBITION_SEARCH = "/admin/accounting/searchAccExhibition";	
	//aaa
	String FEETABLES_SEARCH = "/admin/accounting/searchFeeTables";
	String FEETABLES_ADMIN_SEARCH = "/admin/searchFeeTables";
	String FEENHATHAUTABLES_SEARCH = "/admin/accounting/searchFeeNhathauTables";
	String FEENHATHAUTABLES_SEARCH_ADVANCE = "/admin/accounting/searchFeeNhathauTablesAdvance";
	String FEENHATHAUTABLES_ADMIN_SEARCH_ADVANCE = "/admin/searchFeeNhathauTablesAdvance";
	
	String FEE_NHATHAU_TABLES_ADMIN_SEARCH = "/admin/searchFeeNhathauTables";
	String ADVANCE_SEARCH = "/users/searchAdvance";
	String REFUND_SEARCH = "/users/searchRefund";
	String ACC_ADVANCE_SEARCH = "/admin/accounting/searchAdvance";
	String ACC_REFUND_SEARCH = "/admin/accounting/searchRefund";
	String FEEREFUND_SEARCH = "/admin/accounting/searchFeeRefund";
	
	String AJAX_REPORT_ACCOUNTING_TRANSPORT = "/admin/accounting/transport/download";
	String AJAX_REPORT_ACCOUNTING_NHATHAU = "/admin/accounting/nhathau/nhathau/download";
	String AJAX_REPORT_ACCOUNTING_KHVT = "/admin/accounting/nhathau/vantai/download";
	String AJAX_REPORT_ACCOUNTING_KHTQ = "/admin/accounting/nhathau/thongquan/download";
	String AJAX_REPORT_ACCOUNTING_SHIPMENT = "/admin/docs/shipment/download";
	String AJAX_REPORT_ACCOUNTING_PROFIT_LOSS = "/admin/accounting/profitloss/download";
	
	String ACCOUNTING_VANTAI_LIST = "/admin/accounting/nhathau/inlandPackageinfo";
	String ACCOUNTING_VANTAI = "/admin/accounting/nhathau/vantai";
	
	String AJAX_REPORT_ACCOUNTING_EXHIBITION = "/admin/accounting/exhibition/download";
	
	String ADVANCE_FORM_DOWNLOAD = "/users/advanceForm/download";
	
	String REFUND_FORM_DOWNLOAD = "/users/refund/download";
	
	//ajax call to change do print status
	String PHIEU_CHI_PRINT_ADVANCE_FORM = "/users/advanceForm/phieuchi/print";
	String PHIEU_CHI_PRINT_REFUND = "/users/refund/phieuchi/print";
	String PHIEU_THU_PRINT_REFUND = "/admin/accounting/phieuthu/print";

	String PHIEU_CHI_CREATE_MONEYBOOK_ADVANCE_FORM = "/users/advanceForm/phieuchi/createmoneybook";
	String PHIEU_CHI_CREATE_MONEYBOOK_REFUND = "/users/refund/phieuchi/createmoneybook";
	String PHIEU_CHI_CREATE_MONEYBOOK_REFUND_UNC = "/users/unc/phieuchi/createmoneybook";
	String PHIEU_THU_CREATE_MONEYBOOK = "/admin/accounting/phieuthu/createmoneybook";

	String PHIEU_CHI_DOWNLOAD_ADVANCE_FORM = "/users/advanceForm/phieuchi/download";
	String PHIEU_CHI_DOWNLOAD_REFUND = "/users/refund/phieuchi/download";
	String PHIEUTHU_DOWNLOAD = "/admin/accounting/phieuthu/download";//download phieuthu refund
	
	String ACC_ADVANCE_SUMARY_SEARCH = "/admin/accounting/searchAdvanceSumary";
	String ADVANCE_SUMARY_SEARCH = "/users/searchAdvanceSumary";
	
	String ACCOUNTING_PHIEUTHU_LIST = "/admin/accounting/phieuthuList";
	String ACCOUNTING_PHIEUTHU = "/admin/accounting/phieuthu";
	String ACCOUNTING_PHIEUTHU_SEARCH = "/admin/accounting/searchPhieuThu";
	
	//String ACCOUNTING_PHIEUTHU_LIST_CUSTOMER = "/admin/accounting/phieuthuListCustomer";
	//String ACCOUNTING_PHIEUTHU_CUSTOMER = "/admin/accounting/phieuthuCustomer";
	//String ACCOUNTING_PHIEUTHU_SEARCH_CUSTOMER = "/admin/accounting/searchPhieuThuCustomer";
	
	
	String ACCOUNTING_MANAGE_DEBIT = "/admin/accounting/manageDebit";
	String ACCOUNT_SEARCH_DEBIT = "/admin/accounting/searchDebit";
	String ACCOUNTING_COLLECT_MONEY_AJAX = "/admin/accounting/collectMoney";
	
	//trucking fee payment
	String ACCOUNTING_MANAGE_CONTRACTOR_PAYMENT = "/admin/accounting/manageContractorPayment";
	String ACCOUNT_SEARCH_TRUCKING_FEE = "/admin/accounting/searchContractorPayment";
	//String ACCOUNT_SEARCH_TRUCKING_FEE = "/admin/accounting/searchTruckingFee";
	String ACCOUNTING_PAY_MONEY_AJAX = "/admin/accounting/payMoney";
	String ACCOUNTING_SAVE_TRUCKING_MONEYBOOK_AJAX = "/admin/accounting/saveTruckingMoney";
	
	String ACCOUNTING_SAVE_MONEYBOOK_AJAX = "/admin/accounting/saveMoney";
	String ACCOUNTING_UPDATE_MONEYBOOK_AJAX = "/admin/accounting/updateMoneybook";
	String ACCOUNTING_UPDATE_MONEYBOOK_BALANCE_AJAX = "/admin/accounting/updateMoneybookBalance";
	String ACCOUNTING_DELETE_MONEYBOOK_AJAX = "/admin/accounting/deleteMoneybook";
	
	String ACCOUNTING_TRANSPORT_SEARCH = "/admin/accounting/transportSearch";
	String TRUCKING_SERVICE_DOWNLOAD = "/download";
	String REFUND_JOB_FORM_DOWNLOAD = "/users/refundJob/phieuthu/download";
}
