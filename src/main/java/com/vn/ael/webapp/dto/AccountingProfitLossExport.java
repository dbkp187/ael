package com.vn.ael.webapp.dto;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class AccountingProfitLossExport {
	
	private String cusName;
	private String jobNo;
	private String contNo;
	private String nhathau;
	private List<FeeExportItem> convertedFee;
	private List<FeeExportItem> convertedFeeThu;
	private BigDecimal tongThu;
	private BigDecimal tongChi;
	private BigDecimal profitLoss;
	private BigDecimal thuHo;
	private BigDecimal debit;
	private BigDecimal total;
	private Date dateDev;
	
	//new implement
	private BigDecimal tongThuAel;
	private BigDecimal tongChiAel;
	private BigDecimal tongThuHo;
	private BigDecimal tongChiHo;
	
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getJobNo() {
		return jobNo;
	}
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	public String getContNo() {
		return contNo;
	}
	public void setContNo(String contNo) {
		this.contNo = contNo;
	}
	public String getNhathau() {
		return nhathau;
	}
	public void setNhathau(String nhathau) {
		this.nhathau = nhathau;
	}
	public List<FeeExportItem> getConvertedFee() {
		return convertedFee;
	}
	public void setConvertedFee(List<FeeExportItem> convertedFee) {
		this.convertedFee = convertedFee;
	}
	public BigDecimal getTongChi() {
		return tongChi;
	}
	public void setTongChi(BigDecimal tongChi) {
		this.tongChi = tongChi;
	}
	public BigDecimal getProfitLoss() {
		return profitLoss;
	}
	public void setProfitLoss(BigDecimal profitLoss) {
		this.profitLoss = profitLoss;
	}
	public Date getDateDev() {
		return dateDev;
	}
	public void setDateDev(Date dateDev) {
		this.dateDev = dateDev;
	}
	public BigDecimal getTongThu() {
		return tongThu;
	}
	public void setTongThu(BigDecimal tongThu) {
		this.tongThu = tongThu;
	}
	public List<FeeExportItem> getConvertedFeeThu() {
		return convertedFeeThu;
	}
	public void setConvertedFeeThu(List<FeeExportItem> convertedFeeThu) {
		this.convertedFeeThu = convertedFeeThu;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public BigDecimal getThuHo() {
		return thuHo;
	}
	public void setThuHo(BigDecimal thuHo) {
		this.thuHo = thuHo;
	}
	public BigDecimal getDebit() {
		return debit;
	}
	public void setDebit(BigDecimal debit) {
		this.debit = debit;
	}
	public BigDecimal getTongThuAel() {
		return tongThuAel;
	}
	public void setTongThuAel(BigDecimal tongThuAel) {
		this.tongThuAel = tongThuAel;
	}
	public BigDecimal getTongChiAel() {
		return tongChiAel;
	}
	public void setTongChiAel(BigDecimal tongChiAel) {
		this.tongChiAel = tongChiAel;
	}
	public BigDecimal getTongThuHo() {
		return tongThuHo;
	}
	public void setTongThuHo(BigDecimal tongThuHo) {
		this.tongThuHo = tongThuHo;
	}
	public BigDecimal getTongChiHo() {
		return tongChiHo;
	}
	public void setTongChiHo(BigDecimal tongChiHo) {
		this.tongChiHo = tongChiHo;
	}
}
