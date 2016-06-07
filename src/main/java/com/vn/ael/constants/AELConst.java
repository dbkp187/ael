package com.vn.ael.constants;

public interface AELConst {
	
	int START_COUNT_JOB_ID = 0;
	
	int START_COUNT_VOUCHER_PAYMENT = 0;//phieuchi
	int START_COUNT_VOUCHER_RECEPT = 0;//phieuthu
	String VOUCHER_NO_PREFIX_PAYMENT = "PC";
	String VOUCHER_NO_PREFIX_RECEPT = "PT";
	String VOUCHER_NO_PREFIX_NTTK = "NTTK";
	String VOUCHER_NO_PREFIX_UNC = "UNC";
	
	int VAT_PERCENT = 100; 
	
	String SUFFIX_PKGS = "pkgs";
	String SUFFIX_KG = "kgs";
	String SUFFIX_CMB = "cmb";
	String PREFFIX_TK = "TK";
	char SPACE = ' ';
	
	String ACC_FEE_IS_APPROVED ="accounting.fee.isApproved";
	String ACC_FEE_ISNOT_APPROVED ="accounting.fee.notApproved";
	
	String AJAX_SUCCESS= "success";
	String AJAX_ERROR = "error";
	
	String SEPARATOR = "-";
	char SEMICOLON =';';
	
	String ATTACHMENT_REQUEST_PARAM = "attachments";
	String ATTACHMENT_REQUEST_DATA = "data";
	char INDEX_OPEN = '[';
	char INDEX_CLOSE = ']';
	char DOT = '.';
	
	String ATTACHMENT_PREFIX_DOCS = "docsgeneral";
	
	String EMPTY_STRING = "";

	String COLON = ":";
	
	String SELECTION_DOCSGENERAL = "docs";
	
	String SPLASH = "/";
	
	String HAVE_ONE = "x";
	
	String NEW_LINE_REPORT = "\n";
	
	String APP_PROPERTIES = "ApplicationResources.properties";
	
}
