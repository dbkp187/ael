package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.appfuse.model.User;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.NumberFormat;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.enums.CollectMoneyStatusType;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.webapp.formatter.FormatterUtil;


/**
 * The persistent class for the docsgeneral database table.
 * 
 */
@Entity
@NamedQuery(name="Docsgeneral.findAll", query="SELECT d FROM Docsgeneral d")
public class Docsgeneral extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String nameVehicle;
	
	private String sochuyen;
	
	private Date docReceiveDate;

	@ManyToOne
	@JoinColumn(name = "customer")
	private Customer customer;

	private String jobNo;

	@ManyToOne
	@JoinColumn(name = "processingStaff")
	private User processingStaff;
	
	@ManyToOne
	@JoinColumn(name="typeOfContainer")
	private Configuration typeOfContainer;
	
	@ManyToOne
	@JoinColumn(name = "shippingLine")
	private Nhathau shippingLine;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Contseal> contseals;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Docservice> docservices;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Inlandsize> inlandsizes;
	
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Multitype> contTypes;
	
	@JsonIgnore
	@OneToMany(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private List<Attachment> attachments;
	
	@OneToOne(mappedBy = "docsgeneral")
	private Truckingservice truckingservice;
	
	@OneToOne(mappedBy = "docsgeneral", cascade = CascadeType.ALL)
	private DocsAccounting docsAccounting;
	
	private String contactDelivery;
	
	private String contactReceive;
	
	private String infoInvoice;
	
	private Integer noOfPkgs;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION_3DIGIT)
	private BigDecimal cmb;
	
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal weigth;
	
	private String placeEmptyDown;
	
	private String placeEmptyUp;
	
	private String placeDelivery;
	
	private String placeRev;
	
	@Enumerated(EnumType.ORDINAL)
	private ServicesType typeOfDocs;
	
	private String placeRev1;
	
	private String placeDelivery1;
	
	private String portPutCont;
	
	private String placeGetCont;
	
	@OneToOne(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private Inland inland;
	
	@OneToOne(mappedBy="docsgeneral", cascade = CascadeType.ALL)
	private Exhibition exhibition;
	
	@OneToOne(mappedBy = "docsgeneral", cascade = CascadeType.ALL)
	private Packageinfo packageinfo;
	
	@OneToOne(mappedBy = "docsgeneral")
	private Accountingcus accountingcus;
	
	@OneToMany(mappedBy="docsgeneral")
	private List<Exfeetable> exfeetables;
	
	private Boolean doAccounting = false;
	
	private Boolean doDelivery = false;
	
	private String productDescription;
	
	private String note;
	
	//for thu tien khach hang
	private BigDecimal phiAel;
	private BigDecimal phiChiHo;
	//0: chua thu, 1: da thu, 2: dathuAEL, 3: dathuChiHo

	private Integer collectMoneyStatus;
	
	@ManyToOne
	@JoinColumn(name = "typeOfImport")
	private Configuration typeOfImport;
	
	private Boolean isCollectMoney;
	
	@Transient
	private int noOf20Cont;
	
	@Transient
	private int noOf40Cont;
	
	@Transient
	private boolean isLCL;
	
	@Transient
	private int otCont;

	@Transient
	@NumberFormat(pattern = FormatterPattern.NUMBER_HAS_EXTENSION)
	private BigDecimal chiho;
	
	//profitloss
	@Transient
	private BigDecimal tongChiPhi;
	
	@Transient
	private BigDecimal tongThu;
	
	@Transient
	private BigDecimal debit;
	
	@Transient
	private String invoiceChiho = "";

	@Transient
	private boolean containDuplicated  = false;
	
	public Docsgeneral() {
	}

	@Transient
	public String getPTVT(){
		if (this.packageinfo == null){
			return  this.typeOfContainer.getValue();
		}
		if (this.typeOfContainer == null){
			return this.packageinfo.getTypeOfTransport().getValue();
		}
		return this.packageinfo.getTypeOfTransport().getValue()+"/"+this.typeOfContainer.getValue();
	}
	
	@Transient
	public String getCmbText(){
		return FormatterUtil.formatBigDecimal(this.cmb,true)+AELConst.SUFFIX_CMB;
	}
	
	@Transient
	public String getNoOfPkgsText(){
		return FormatterUtil.formatInteger(this.noOfPkgs)+AELConst.SUFFIX_PKGS;
	}
	@Transient
	public String getWeigthText(){
		return FormatterUtil.formatBigDecimal(this.weigth)+AELConst.SUFFIX_KG;
	}
	
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getJobNo() {
		return this.jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public User getProcessingStaff() {
		return this.processingStaff;
	}

	public void setProcessingStaff(User processingStaff) {
		this.processingStaff = processingStaff;
	}

	public Configuration getTypeOfContainer() {
		return this.typeOfContainer;
	}

	public void setTypeOfContainer(Configuration typeOfContainer) {
		this.typeOfContainer = typeOfContainer;
	}

	public String getPlaceEmptyDown() {
		return placeEmptyDown;
	}

	public void setPlaceEmptyDown(String placeEmptyDown) {
		this.placeEmptyDown = placeEmptyDown;
	}

	public String getPlaceEmptyUp() {
		return placeEmptyUp;
	}

	public void setPlaceEmptyUp(String placeEmptyUp) {
		this.placeEmptyUp = placeEmptyUp;
	}

	public String getPlaceDelivery() {
		return placeDelivery;
	}

	public void setPlaceDelivery(String placeDelivery) {
		this.placeDelivery = placeDelivery;
	}

	public String getPlaceRev() {
		return placeRev;
	}

	public void setPlaceRev(String placeRev) {
		this.placeRev = placeRev;
	}
	
	public Date getDocReceiveDate() {
		return this.docReceiveDate;
	}

	public void setDocReceiveDate(Date docReceiveDate) {
		this.docReceiveDate = docReceiveDate;
	}

	public Nhathau getShippingLine() {
		return shippingLine;
	}

	public void setShippingLine(Nhathau shippingLine) {
		this.shippingLine = shippingLine;
	}

	public ServicesType getTypeOfDocs() {
		return typeOfDocs;
	}

	public void setTypeOfDocs(ServicesType typeOfDocs) {
		this.typeOfDocs = typeOfDocs;
	}

	public Inland getInland() {
		return inland;
	}

	public void setInland(Inland inland) {
		this.inland = inland;
	}

	public Packageinfo getPackageinfo() {
		return packageinfo;
	}

	public void setPackageinfo(Packageinfo packageinfo) {
		this.packageinfo = packageinfo;
	}
	
	public List<Contseal> getContseals() {
		return this.contseals;
	}

	public void setContseals(List<Contseal> contseals) {
		this.contseals = contseals;
	}

	public Contseal addContseal(Contseal contseal) {
		getContseals().add(contseal);
		contseal.setDocsgeneral(this);

		return contseal;
	}

	public Contseal removeContseal(Contseal contseal) {
		getContseals().remove(contseal);
		contseal.setDocsgeneral(null);
		return contseal;
	}
	
	public List<Docservice> getDocservices() {
		return docservices;
	}

	public void setDocservices(List<Docservice> docservices) {
		this.docservices = docservices;
	}

	public List<Exfeetable> getExfeetables() {
		return exfeetables;
	}

	public void setExfeetables(List<Exfeetable> exfeetables) {
		this.exfeetables = exfeetables;
	}

	public List<Inlandsize> getInlandsizes() {
		return inlandsizes;
	}

	public void setInlandsizes(List<Inlandsize> inlandsizes) {
		this.inlandsizes = inlandsizes;
	}

	public List<Multitype> getContTypes() {
		return contTypes;
	}

	public void setContTypes(List<Multitype> contTypes) {
		this.contTypes = contTypes;
	}

	public String getPlaceRev1() {
		return placeRev1;
	}

	public void setPlaceRev1(String placeRev1) {
		this.placeRev1 = placeRev1;
	}

	public String getPlaceDelivery1() {
		return placeDelivery1;
	}

	public void setPlaceDelivery1(String placeDelivery1) {
		this.placeDelivery1 = placeDelivery1;
	}

	public Boolean getDoAccounting() {
		return doAccounting;
	}

	public void setDoAccounting(Boolean doAccounting) {
		this.doAccounting = doAccounting;
	}

	public Boolean getDoDelivery() {
		return doDelivery;
	}

	public void setDoDelivery(Boolean doDelivery) {
		this.doDelivery = doDelivery;
	}
	
	public String getPortPutCont() {
		return portPutCont;
	}

	public void setPortPutCont(String portPutCont) {
		this.portPutCont = portPutCont;
	}

	public String getPlaceGetCont() {
		return placeGetCont;
	}

	public void setPlaceGetCont(String placeGetCont) {
		this.placeGetCont = placeGetCont;
	}
	
	

	public boolean getIsContainDuplicated() {
		return containDuplicated;
	}

	public void setIsContainDuplicated(boolean containDuplicated) {
		this.containDuplicated = containDuplicated;
	}
	
	public BigDecimal getChiho() {
		return chiho;
	}

	public void setChiho(BigDecimal chiho) {
		this.chiho = chiho;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getOtCont() {
		return otCont;
	}

	public void setOtCont(int otCont) {
		this.otCont = otCont;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public Configuration getTypeOfImport() {
		return typeOfImport;
	}

	public void setTypeOfImport(Configuration typeOfImport) {
		this.typeOfImport = typeOfImport;
	}

	public String getContactReceive() {
		return contactReceive;
	}

	public void setContactReceive(String contactReceive) {
		this.contactReceive = contactReceive;
	}

	public String getNameVehicle() {
		return nameVehicle;
	}

	public void setNameVehicle(String nameVehicle) {
		this.nameVehicle = nameVehicle;
	}

	public String getSochuyen() {
		return sochuyen;
	}

	public void setSochuyen(String sochuyen) {
		this.sochuyen = sochuyen;
	}
	
	public String getInvoiceChiho() {
		return invoiceChiho;
	}

	public void setInvoiceChiho(String invoiceChiho) {
		this.invoiceChiho = invoiceChiho;
	}

	public Accountingcus getAccountingcus() {
		return accountingcus;
	}

	public void setAccountingcus(Accountingcus accountingcus) {
		this.accountingcus = accountingcus;
	}
	
	public BigDecimal getDebit() {
		return debit;
	}

	public void setDebit(BigDecimal debit) {
		this.debit = debit;
	}

	public Boolean getIsCollectMoney() {
		return isCollectMoney;
	}

	public void setIsCollectMoney(Boolean isCollectMoney) {
		this.isCollectMoney = isCollectMoney;
	}
	

	public BigDecimal getTongChiPhi() {
		return tongChiPhi;
	}

	public void setTongChiPhi(BigDecimal tongChiPhi) {
		this.tongChiPhi = tongChiPhi;
	}

	public BigDecimal getTongThu() {
		return tongThu;
	}

	public void setTongThu(BigDecimal tongThu) {
		this.tongThu = tongThu;
	}
	
	public Integer getNoOf20Cont() {
		return noOf20Cont;
	}

	public void setNoOf20Cont(int noOf20Cont) {
		this.noOf20Cont = noOf20Cont;
	}

	public int getNoOf40Cont() {
		return noOf40Cont;
	}

	public void setNoOf40Cont(int noOf40Cont) {
		this.noOf40Cont = noOf40Cont;
	}

	public boolean getIsLCL() {
		return isLCL;
	}

	public void setIsLCL(boolean isLCL) {
		this.isLCL = isLCL;
	}

	public Truckingservice getTruckingservice() {
		return truckingservice;
	}

	public void setTruckingservice(Truckingservice truckingservice) {
		this.truckingservice = truckingservice;
	}
	
	public void setCmb(BigDecimal cmb) {
		this.cmb = cmb;
	}
	
	public String getContactDelivery() {
		return contactDelivery;
	}

	public void setContactDelivery(String contactDelivery) {
		this.contactDelivery = contactDelivery;
	}
	
	public String getInfoInvoice() {
		return infoInvoice;
	}

	public void setInfoInvoice(String infoInvoice) {
		this.infoInvoice = infoInvoice;
	}

	public Exhibition getExhibition() {
		return exhibition;
	}
	
	public void setExhibition(Exhibition exhibition) {
		this.exhibition = exhibition;
	}

	public Integer getNoOfPkgs() {
		return this.noOfPkgs;
	}

	public void setNoOfPkgs(Integer noOfPkgs) {
		this.noOfPkgs = noOfPkgs;
	}
	
	public BigDecimal getCmb() {
		return this.cmb;
	}
	
	public BigDecimal getWeigth() {
		return this.weigth;
	}
	public void setWeigth(BigDecimal weigth) {
		this.weigth = weigth;
	}

	public BigDecimal getPhiAel() {
		return phiAel;
	}

	public void setPhiAEL(BigDecimal phiAel) {
		this.phiAel = phiAel;
	}

	public BigDecimal getPhiChiHo() {
		return phiChiHo;
	}

	public void setPhiChiHo(BigDecimal phiChiHo) {
		this.phiChiHo = phiChiHo;
	}

	public Integer getCollectMoneyStatus() {
		return collectMoneyStatus;
	}

	public void setCollectMoneyStatus(Integer collectMoneyStatus) {
		this.collectMoneyStatus = collectMoneyStatus;
	}

	/**
	 * @return the docsAccounting
	 */
	public DocsAccounting getDocsAccounting() {
		return docsAccounting;
	}

	/**
	 * @param docsAccounting the docsAccounting to set
	 */
	public void setDocsAccounting(DocsAccounting docsAccounting) {
		this.docsAccounting = docsAccounting;
	}
}
