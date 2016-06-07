/**
 *
 */
package com.vn.ael.persistence.manager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.TypeOfContainer;
import com.vn.ael.constants.TypeOfFee;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Accountingcusdetail;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docservice;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Inlandsize;
import com.vn.ael.persistence.entity.Multitype;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.repository.AttachmentRepository;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.DocserviceRepository;
import com.vn.ael.persistence.repository.DocsgeneralRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.InlandsizeRepository;
import com.vn.ael.persistence.repository.MultitypeRepository;
import com.vn.ael.persistence.repository.TruckingdetailRepository;
import com.vn.ael.persistence.repository.TruckingserviceRepository;
import com.vn.ael.webapp.dto.AccountingCollectMoneyCondition;
import com.vn.ael.webapp.dto.AccountingContractorPaymentCondition;
import com.vn.ael.webapp.dto.AccountingTransCondition;
import com.vn.ael.webapp.dto.AccountingTransportExport;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.CommonUtil;
import com.vn.ael.webapp.util.ConvertUtil;
import com.vn.ael.webapp.util.EntityUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class DocsgeneralManagerImpl extends GenericManagerImpl<Docsgeneral> implements DocsgeneralManager{

    private DocsgeneralRepository docsgeneralRepository;

    @Autowired
    private ContsealRepository contsealRepository;
    
    @Autowired
    private DocserviceRepository docserviceRepository;
    
    @Autowired
    private ExfeetableRepository exfeetableRepository;
    
    @Autowired
    private InlandsizeRepository inlandsizeRepository;
    
    @Autowired
    private MultitypeRepository multitypeRepository;
    
    @Autowired
    private TruckingserviceRepository truckingserviceRepository;
    
    @Autowired
    private TruckingdetailRepository truckingdetailRepository;
    
    @Autowired
    private AttachmentRepository attachmentRepository;
    
    @Autowired
    //this is not good practice, but acceptable ;))
    private AccountingcusManager accountingcusManager;
    
    @Autowired
    public DocsgeneralManagerImpl(final DocsgeneralRepository docsgeneralRepository) {
        this.docsgeneralRepository = docsgeneralRepository;
        this.repository = docsgeneralRepository;
    }

	@Override
	public void checkToDeleteChilds(Docsgeneral docsgeneral) {
		if (docsgeneral.getContseals() != null){
			List<Contseal> conts = new ArrayList<>();
			for (Contseal contseal: docsgeneral.getContseals()){
				if (contseal.getIsDeleted() != null && contseal.getIsDeleted() == true){
					contsealRepository.delete(contseal);
				}else{
					conts.add(contseal);
				}
			}
			docsgeneral.setContseals(conts);
		}
		
		if (docsgeneral.getDocservices() != null){
			List<Docservice> docservices = new ArrayList<>();
			for (Docservice docservice: docsgeneral.getDocservices()){
				if (docservice.getIsDeleted() != null && docservice.getIsDeleted() == true){
					docserviceRepository.delete(docservice);
				}else{
					docservices.add(docservice);
				}
			}
			docsgeneral.setDocservices(docservices);
		}
		
		if (docsgeneral.getExfeetables() != null){
			List<Exfeetable> exfeetables = new ArrayList<>();
			for (Exfeetable exfeetable: docsgeneral.getExfeetables()){
				if (exfeetable.getIsDeleted() != null && exfeetable.getIsDeleted() == true && (exfeetable.getApproved() == null || !exfeetable.getApproved())){
					exfeetableRepository.delete(exfeetable);
				}else{
					exfeetables.add(exfeetable);
				}
			}
			docsgeneral.setExfeetables(exfeetables);
		}
		
		if (docsgeneral.getContTypes() != null){
			List<Multitype> multitypes = new ArrayList<>();
			for (Multitype multitype: docsgeneral.getContTypes()){
				if (multitype.getIsDeleted() != null && multitype.getIsDeleted() == true){
					multitypeRepository.delete(multitype);
				}else{
					multitypes.add(multitype);
				}
			}
			docsgeneral.setContTypes(multitypes);
		}
		
		if (docsgeneral.getAttachments() != null){
			List<Attachment> attachments = new ArrayList<>();
			for (Attachment attachment: docsgeneral.getAttachments()){
				if (attachment.getIsDeleted() != null && attachment.getIsDeleted() == true){
					attachmentRepository.delete(attachment.getId());
				}else{
					attachments.add(attachment);
				}
			}
			docsgeneral.setAttachments(attachments);
		}
		
	}

	@Override
	public void updateChilds(Docsgeneral docsgeneral) {
		if (docsgeneral != null && docsgeneral.getId() != null){
			docsgeneral.setContseals(contsealRepository.findByDocsgeneral(docsgeneral));
	    	docsgeneral.setDocservices(docserviceRepository.findByDocsgeneral(docsgeneral));
	    	docsgeneral.setExfeetables(exfeetableRepository.findByDocsgeneral(docsgeneral, EntityUtil.EXFEETABLE_DEFAULT_SORTING));
	    	docsgeneral.setInlandsizes(inlandsizeRepository.findByDocsgeneral(docsgeneral));
	    	docsgeneral.setContTypes(multitypeRepository.findByDocsgeneral(docsgeneral));
	    	docsgeneral.setAttachments(attachmentRepository.findByDocsgeneral(docsgeneral));
		}
		
		if (docsgeneral.getContseals() == null || docsgeneral.getContseals().isEmpty()){
			List<Contseal> cons = new ArrayList<>();
			Contseal contseal = new Contseal();
			contseal.setIsAdded(true);
			cons.add(contseal);
			docsgeneral.setContseals(cons);
		}
		
		if (docsgeneral.getInlandsizes() == null || docsgeneral.getInlandsizes().isEmpty()){
			List<Inlandsize> inlandsizes = new ArrayList<>();
			Inlandsize inlandsize = new Inlandsize();
			inlandsize.setIsAdded(true);
			inlandsizes.add(inlandsize);
			docsgeneral.setInlandsizes(inlandsizes);
		}
		
		if (docsgeneral.getDocservices() == null || docsgeneral.getDocservices().isEmpty()){
			List<Docservice> docs = new ArrayList<>();
			Docservice docservice = new Docservice();
			docservice.setIsAdded(true);
			docs.add(docservice);
			docsgeneral.setDocservices(docs);
		}
		
		if (docsgeneral.getExfeetables() == null || docsgeneral.getExfeetables().isEmpty()){
			List<Exfeetable> exfeetables = new ArrayList<>();
			Exfeetable exfeetable = new Exfeetable();
			exfeetable.setIsAdded(true);
			exfeetables.add(exfeetable);
			docsgeneral.setExfeetables(exfeetables);
		}
		
		if (docsgeneral.getContTypes() == null || docsgeneral.getContTypes().isEmpty()){
			List<Multitype> multitypes = new ArrayList<>();
			Multitype multitype = new Multitype();
			multitype.setIsAdded(true);
			multitypes.add(multitype);
			docsgeneral.setContTypes(multitypes);
		}
		
		if (docsgeneral.getAttachments() == null
				|| docsgeneral.getAttachments().isEmpty()) {
			List<Attachment> attachments = new ArrayList<>();
			Attachment attachment = new Attachment();
			attachment.setIsAdded(true);
			attachments.add(attachment);
			docsgeneral.setAttachments(attachments);
		}else{
			for (Attachment attachment: docsgeneral.getAttachments()){
				attachment.setIsAdded(true);
			}
		}
		
	}

	@Override
	public List<Docsgeneral> findByDoDelivery(Boolean doDelivery) {
		return this.docsgeneralRepository.findByDoDelivery(doDelivery);
	}

	@Override
	public void updateAccounting(Docsgeneral docsgeneral) {
		if (docsgeneral != null && docsgeneral.getId() != null){
			Docsgeneral docsgeneralDB = docsgeneralRepository.getOne(docsgeneral.getId());
			docsgeneralDB.setDoAccounting(docsgeneral.getDoAccounting());
			docsgeneralDB.setNote(docsgeneral.getNote());
			docsgeneralRepository.save(docsgeneralDB);
		}
	}
	
	@Override
	public void updateDelivery(Docsgeneral docsgeneral) {
		if (docsgeneral != null && docsgeneral.getId() != null){
			Docsgeneral docsgeneralDB = docsgeneralRepository.getOne(docsgeneral.getId());
			docsgeneralDB.setDoDelivery(false);
			//delete contseal
			if (docsgeneralDB.getContseals() != null){
				List<Contseal> conts = docsgeneralDB.getContseals();
				contsealRepository.delete(conts);
				docsgeneralDB.setContseals(null);
			}
			docsgeneralRepository.save(docsgeneralDB);
		}
	}


	@Override
	public List<Docsgeneral> findByDoAccounting(Boolean doAccounting) {
		return this.docsgeneralRepository.findByDoAccounting(doAccounting);
	}

	@Override
	public List<Docsgeneral> findByDoAccountingAndTypeOfDocs(
			Boolean doAccounting, ServicesType servicesType) {
		return this.docsgeneralRepository.findByDoAccountingAndTypeOfDocs(doAccounting,servicesType);
	}

	@Override
	public List<Docsgeneral> findDoAccountingInlandSealand(
			Boolean doAccounting) {
		return this.docsgeneralRepository.getDoAccountingInlandSealand(doAccounting, ServicesType.DVVT_INLAND, ServicesType.DVVT_SEALAND);
	}
	
	@Override
	public List<Docsgeneral> findAllByCondition(
			AccountingTransCondition accountingTransCondition,boolean forList) {
		List<Docsgeneral> docsgenerals = this.docsgeneralRepository.getDoAccountingInlandSealandAndTime(true, ServicesType.DVVT_INLAND, ServicesType.DVVT_SEALAND, accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(),accountingTransCondition.getCustomerId(), accountingTransCondition.getJobList());
		//remove detail which is not in this month
//		this.removeNotInMonthDetail(accountingTransCondition.getMonth(), accountingTransCondition.getYear(), docsgenerals);
		if (!forList){
			
			if (docsgenerals != null && !docsgenerals.isEmpty()){
				for (Docsgeneral docsgeneral : docsgenerals){
					//fect trucking details
					List<Truckingdetail> truckingdetails = truckingdetailRepository.findWithTruckingserviceAndMonthYear(docsgeneral.getTruckingservice().getId(),accountingTransCondition.getStartDate(),accountingTransCondition.getEndDate());
					docsgeneral.getTruckingservice().setTruckingdetails(truckingdetails);
					
					//calculate other information
					if (truckingdetails != null){
						for (Truckingdetail truckingdetail : truckingdetails){
							List<Exfeetable> exfeetables = truckingdetail.getExfeetables();
							if (exfeetables != null && !exfeetables.isEmpty()){
								if (docsgeneral.getChiho() == null){
									truckingdetail.setChiho(BigDecimal.ZERO);
									truckingdetail.setChihoTruckings(new ArrayList<Exfeetable>());
								}
								
								for (Exfeetable exfeetable : exfeetables){
									if (exfeetable.getMasterFee() != null && exfeetable.getMasterFee().getId() == TypeOfFee.CHI_HO_ID){
	//									//add to accounting cus
										truckingdetail.setChiho(truckingdetail.getChiho().add(EntityUtil.calTotalWithVat(exfeetable.getAmount(),exfeetable.getVat())));
										truckingdetail.getChihoTruckings().add(exfeetable);
									}
								}
							}
					}
					}
					this.updateChiHo(docsgeneral,false);
				}
			}
		}
		return docsgenerals;
	}
	
	/**
	 * 
	 * @param docsgeneral
	 */
	public void updateChiHo(Docsgeneral docsgeneral, boolean addTruck){
		List<Exfeetable> exfeetables = exfeetableRepository.findByDocsgeneral(docsgeneral);
		if (addTruck){
			List<Exfeetable> truckingFee = exfeetableRepository.findWithTruckingService(docsgeneral.getTruckingservice().getId());
			if (exfeetables != null){
				exfeetables.addAll(truckingFee);
			}else{
				exfeetables = truckingFee;
			}
		}
		docsgeneral.setChiho(BigDecimal.ZERO);
		if (exfeetables != null && !exfeetables.isEmpty()){
			for (Exfeetable exfeetable : exfeetables){
				if (exfeetable.getMasterFee() != null && exfeetable.getMasterFee().getId() == TypeOfFee.CHI_HO_ID){
					//add to accounting cus
					docsgeneral.setChiho(docsgeneral.getChiho().add(ConvertUtil.getNotNullValue(exfeetable.getTotal())));
					if (StringUtils.isNotBlank(exfeetable.getInvoiceNo())){
						docsgeneral.setInvoiceChiho(CommonUtil.concate(docsgeneral.getInvoiceChiho(),exfeetable.getInvoiceNo()));
					}
				}
			}
		}
	}
	
	/**
	 * Update Trucking service, with just trucking detail in suitable month
	 * @param month
	 * @param year
	 */
//	private void removeNotInMonthDetail(int month, int year, List<Docsgeneral> docsgenerals){
//		if (docsgenerals != null && !docsgenerals.isEmpty()){
//			for (Docsgeneral docsgeneral : docsgenerals){
//				if (docsgeneral.getTruckingservice() != null && docsgeneral.getTruckingservice().getTruckingdetails() != null && !docsgeneral.getTruckingservice().getTruckingdetails().isEmpty()){
//					List<Truckingdetail> truckingdetails = new ArrayList<>();
//					for (Truckingdetail truckingdetail : docsgeneral.getTruckingservice().getTruckingdetails()){
//						Date devDate = truckingdetail.getDateDev();
//						if (devDate != null && CommonUtil.getMonth(devDate) == month && CommonUtil.getYear(devDate) == year){
//							truckingdetails.add(truckingdetail);
//						}
//					}
//					docsgeneral.getTruckingservice().setTruckingdetails(truckingdetails);
//				}
//			}
//		}
//	}

	@Override
	public void updateContTruck(Docsgeneral docsgeneral) {
		//update counting for LCL/FCL
		if (docsgeneral != null){
			if (docsgeneral.getTypeOfContainer() != null
					&& docsgeneral.getTypeOfContainer().getId() == TypeOfContainer.LCL){
				docsgeneral.setIsLCL(true);
			}else{
				docsgeneral.setIsLCL(false);
				List<Contseal> contseals = contsealRepository.findByDocsgeneral(docsgeneral);
				int count20 = 0;
				int count40 = 0;
				int countOt = 0;
				if (contseals != null && !contseals.isEmpty()){
					for (Contseal contseal :  contseals){
						if (contseal.getTypeOfCont() != null)
							if(contseal.getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_20_START)){
								count20+=1;
							}else if(contseal.getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_40_START)){
								count40+=1;
							}else{
								countOt+=1;
							}
						}	
					}
				docsgeneral.setNoOf20Cont(count20);
				docsgeneral.setNoOf40Cont(count40);
				docsgeneral.setOtCont(countOt);
				}
			}
		//load trucking service
//		Truckingservice truckingservice = this.truckingserviceRepository.findByDocsgeneral(docsgeneral);
//		List<Truckingdetail> truckingdetails = this.truckingdetailRepository.findByTruckingservice(truckingservice);
//		docsgeneral.setTruckingservice(truckingservice);
//		truckingservice.setTruckingdetails(truckingdetails);
	}

	@Override
	public List<Docsgeneral> searchTrucking(Search search) {
		ServicesType servicesType = null;
		if(search.getTypeOfDocs() == null){
			return docsgeneralRepository.searchTrucking(search.getCustomer(), search.getTypeOfImport(), search.getTypeOfContainer(), search.getDoAccounting(), 
					servicesType, true,search.getHasRecord(), search.getJobNo(), search.getStartDate(), search.getEndDate());
		}
		return docsgeneralRepository.searchTrucking(search.getCustomer(), search.getTypeOfImport(), search.getTypeOfContainer(), search.getDoAccounting(), 
				ServicesType.fromValue(search.getTypeOfDocs().intValue()), true,search.getHasRecord(), search.getJobNo(), search.getStartDate(), search.getEndDate());
	}

	@Override
	public List<Docsgeneral> searchAccounting(Search search) {
		return docsgeneralRepository.searchAccounting(search.getCustomer(), search.getTypeOfImport(), search.getTypeOfContainer(), 
				true, search.getServicesType(), search.getStartDate(), search.getEndDate());
	}
	
	@Override
	public List<Docsgeneral> searchExhibitionAccounting(Search search) {
		return docsgeneralRepository.searchExhibitionAccounting(search.getCustomer(), search.getTypeOfImport(), search.getTypeOfContainer(), 
				true, search.getStartDate(), search.getEndDate());
	}

	@Override
	public List<Docsgeneral> searchFeeTables(Search search) {
		ServicesType servicesType = null;
		if(search.getTypeOfDocs() == null){
			return docsgeneralRepository.searchFeeTables(search.getCustomer(), search.getJobNo(), true, servicesType, search.getStartDate(), search.getEndDate());
		}
		return docsgeneralRepository.searchFeeTables(search.getCustomer(), search.getJobNo(), true, ServicesType.fromValue(search.getTypeOfDocs().intValue()), search.getStartDate(), search.getEndDate());
	}

	@Override
	public void updateContTruckDetail(Docsgeneral docsgeneral) {
		// TODO Auto-generated method stub
		if (docsgeneral != null){
			if (docsgeneral.getTypeOfContainer() != null
					&& docsgeneral.getTypeOfContainer().getId() == TypeOfContainer.LCL){
				docsgeneral.setIsLCL(true);
			}else{
				docsgeneral.setIsLCL(false);
				List<Truckingdetail> truckingdetails = docsgeneral.getTruckingservice().getTruckingdetails();
				int count20 = 0;
				int count40 = 0;
				int countOt = 0;
				if (truckingdetails != null && !truckingdetails.isEmpty()){
					Map<Long, Boolean> checked = new HashMap<>();
					for (Truckingdetail truckingdetail :  truckingdetails){
						if (truckingdetail.getConsteal()!= null && truckingdetail.getConsteal().getTypeOfCont() != null)
							if (!checked.containsKey(truckingdetail.getConsteal().getId())){
								if(truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_20_START)){
									count20+=1;
								}else if(truckingdetail.getConsteal().getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_40_START)){
									count40+=1;
								}else{
									countOt+=1;
								}
								checked.put(truckingdetail.getConsteal().getId(), true);
							}
						}	
					}
				docsgeneral.setNoOf20Cont(count20);
				docsgeneral.setNoOf40Cont(count40);
				docsgeneral.setOtCont(countOt);
				}
			}
	}

	@Override
	public List<String> getAllJob() {
		return docsgeneralRepository.getAllJob();
	}

	@Override
	public List<Docsgeneral> searchShipment(
			AccountingTransCondition accountingTransCondition) {
		return docsgeneralRepository.searchShipment(accountingTransCondition.getCustomerId(), accountingTransCondition.getTypeOfImport(), ServicesType.DVTQ, accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(), accountingTransCondition.getConsignee(), accountingTransCondition.getShipper(), accountingTransCondition.getJob());
	}

	@Override
	public void updateTongChiPhi(Docsgeneral docsgeneral) {
		BigDecimal total = BigDecimal.ZERO;
		List<Exfeetable> exfeetables = exfeetableRepository.findByDocsgeneral(docsgeneral);
		docsgeneral.setExfeetables(exfeetables);
		if (docsgeneral != null && docsgeneral.getExfeetables() != null && !docsgeneral.getExfeetables().isEmpty()){
			for (Exfeetable exfeetable : docsgeneral.getExfeetables()){
				//add to accounting cus
				total = total.add(EntityUtil.calTotalWithVat(exfeetable.getAmount(),exfeetable.getVat()));
			}
		}
		docsgeneral.setTongChiPhi(total);
	}

	@Override
	public void updateTongChiPhi(List<Docsgeneral> docsgenerals) {
		if (docsgenerals != null && !docsgenerals.isEmpty()){
			for (Docsgeneral docsgeneral : docsgenerals){
				updateTongChiPhi(docsgeneral);
			}
		}
	}

	@Override
	public void updateDebit(Docsgeneral docsgeneral) {
		BigDecimal debit = BigDecimal.ZERO;
		if (docsgeneral != null){
			if (docsgeneral.getDebit() == null){
				if (docsgeneral.getTypeOfDocs() == ServicesType.DVTQ){
					//thong quan
					Accountingcus accountingcus = accountingcusManager.createFromDocsgeneral(docsgeneral);
					if (accountingcus != null){
						List<Accountingcusdetail> accountingcusdetails = accountingcus.getAccountingcusdetails();
						if (accountingcusdetails != null && !accountingcusdetails.isEmpty()){
							for (Accountingcusdetail accountingcusdetail: accountingcusdetails){
								debit = debit.add(ConvertUtil.getNotNullValue(accountingcusdetail.getFeewithvat()));
							}
						}
					}
				}else if (docsgeneral.getTypeOfDocs() == ServicesType.EXHS){
					//trien lam
					List<Exfeetable> exfeetables = exfeetableRepository.findByExhibition(docsgeneral.getExhibition());
					if (exfeetables != null && !exfeetables.isEmpty()){
						for (Exfeetable exfeetable : exfeetables){
//							debit = debit.add(CalculationUtil.getTotalWithVat(exfeetable.getVat(), exfeetable.getAmount()));
							debit = debit.add(ConvertUtil.getNotNullValue(exfeetable.getAmount()));
						}
					}
				}
				docsgeneral.setDebit(debit);
			}
		}
		
	}

	@Override
	public List<Docsgeneral> findByDoAccountingAndIsCollectMoney(
			Boolean doAccounting, Boolean isCollectMoney) {
		return docsgeneralRepository.findByDoAccountingAndIsCollectMoney(doAccounting, isCollectMoney);
	}
	
	@Override
	public Map<Long, String> getJobForSelection() {
		return ConvertUtil.fromDocsList2MapCusNativeNoCus(docsgeneralRepository.findAllNotForSelection());
	}
	
	//for thu tien khach hang
	/*@Override
	public void updatePhiAELAndChiHo(Docsgeneral docsgeneral, BigDecimal phiAel, BigDecimal phiChiHo) {
		Docsgeneral doc = docsgeneralRepository.getOne(docsgeneral.getId());
		doc.setPhiAEL(phiAel);
		doc.setPhiChiHo(phiChiHo);

		docsgeneralRepository.save(doc);
	}
	
	@Override
	public void updatePhiAELAndChiHo(List<AccountingTransportExport> list) {
		List<Long> ids = new ArrayList<Long>();
		Map<Long, BigDecimal[]> mapMoney = new HashMap<Long, BigDecimal[]>();
		
		for (AccountingTransportExport acc : list) {
			ids.add(acc.getJobId());
			BigDecimal[] ar = new BigDecimal[2];
			ar[0] = acc.getTotal();
			ar[1] = acc.getChiho();
			mapMoney.put(acc.getJobId(), ar);
		}
		
		List<Docsgeneral> docs = docsgeneralRepository.findAll(ids);
		for (Docsgeneral doc : docs) {
			doc.setPhiAEL(mapMoney.get(doc.getId())[0]);
			doc.setPhiChiHo(mapMoney.get(doc.getId())[1]);
		}
		
		docsgeneralRepository.save(docs);
	}*/
	
	/*@Override
	public Integer updateCollectMoneyStatus(Long jobId, int feeType) {
		Docsgeneral doc = docsgeneralRepository.getOne(jobId);
		BigDecimal phiAel = doc.getPhiAel();
		BigDecimal phiChiHo = doc.getPhiChiHo();
		int currentCollectMoneyStatus = doc.getCollectMoneyStatus();
		//collect money type
		// 0: chua thu (default)
		// 1: da thu
		// 2: chi moi thu AEL
		// 3: chi moi thu phiChiHo
		if (feeType == 0) {//phiAel
			if (phiChiHo.compareTo(BigDecimal.ZERO) == 0 || currentCollectMoneyStatus == 3) {//phiChiHo = 0 hoac da thu chiho
				doc.setCollectMoneyStatus(1);
			} else {
				doc.setCollectMoneyStatus(2);
			} 
		} else if (feeType == 1) {//phiChiHo
			if (phiAel.compareTo(BigDecimal.ZERO) == 0 || currentCollectMoneyStatus == 2) {//phiAel = 0 hoac da thu ael
				doc.setCollectMoneyStatus(1);
			} else {
				doc.setCollectMoneyStatus(3);
			}
		}

		docsgeneralRepository.save(doc);
		return doc.getCollectMoneyStatus();
	}*/
	
	/*@Override
	public void updateCollectMoneyStatus(Map<Long, Integer> feeTypeMap) {
		Set<Long> listId = (Set<Long>) feeTypeMap.keySet();
		List<Docsgeneral> docs = docsgeneralRepository.findAll(listId);
		for (Docsgeneral doc : docs) {
			Integer feeType = feeTypeMap.get(doc.getId());
			
			if (feeType == 2) {//done
				doc.setCollectMoneyStatus(1);
			} else {
				BigDecimal phiAel = doc.getPhiAel();
				BigDecimal phiChiHo = doc.getPhiChiHo();
				if (phiAel == null) phiAel = BigDecimal.ZERO;
				if (phiChiHo == null) phiChiHo = BigDecimal.ZERO;
				int currentCollectMoneyStatus = doc.getCollectMoneyStatus();
				//collect money type
				// 0: chua thu (default)
				// 1: da thu
				// 2: chi moi thu AEL
				// 3: chi moi thu phiChiHo
				if (feeType == 0) {//phiAel
					if (phiChiHo.compareTo(BigDecimal.ZERO) == 0 || currentCollectMoneyStatus == 3) {//phiChiHo = 0 hoac da thu chiho
						doc.setCollectMoneyStatus(1);
					} else {
						doc.setCollectMoneyStatus(2);
					} 
				} else if (feeType == 1) {//phiChiHo
					if (phiAel.compareTo(BigDecimal.ZERO) == 0 || currentCollectMoneyStatus == 2) {//phiAel = 0 hoac da thu ael
						doc.setCollectMoneyStatus(1);
					} else {
						doc.setCollectMoneyStatus(3);
					}
				}
			}
			
			docsgeneralRepository.save(doc);
		}
	}*/

}
