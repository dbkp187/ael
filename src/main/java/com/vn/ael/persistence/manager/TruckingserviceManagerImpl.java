/**
 *
 */
package com.vn.ael.persistence.manager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.TypeOfContainer;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.TruckAccounting;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.DocserviceRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.TruckingdetailRepository;
import com.vn.ael.persistence.repository.TruckingserviceRepository;
import com.vn.ael.webapp.dto.AccountingTransCondition;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.EntityUtil;

/**
 * @author liv1hc
 *
 */
@Service
public class TruckingserviceManagerImpl extends GenericManagerImpl<Truckingservice> implements TruckingserviceManager{

    private TruckingserviceRepository truckingserviceRepository;
    
    @Autowired
    private DocserviceRepository docserviceRepository;
    
    @Autowired
    private ContsealRepository contsealRepository;
    
    @Autowired
    private TruckingdetailRepository truckingdetailRepository;
    
    @Autowired
    private ExfeetableRepository exfeetableRepository;

    @Autowired
    public TruckingserviceManagerImpl(final TruckingserviceRepository truckingserviceRepository) {
        this.truckingserviceRepository = truckingserviceRepository;
        this.repository = truckingserviceRepository;
    }

    @Transactional(readOnly=true)
	@Override
	public Truckingservice createFromDocsgeneral(Docsgeneral docsgeneral) {
		if (docsgeneral !=null){
			Truckingservice truckingservice = this.truckingserviceRepository.findByDocsgeneral(docsgeneral);
			if (truckingservice == null){
				//create new
				truckingservice = new Truckingservice();
				List<Truckingdetail> truckingdetails = new ArrayList<>();
				List<Contseal> contseals = contsealRepository.findByDocsgeneral(docsgeneral);
				docsgeneral.setContseals(contseals);
				if (docsgeneral.getTypeOfContainer() != null && docsgeneral.getTypeOfContainer().getId() != TypeOfContainer.LCL && contseals != null && !contseals.isEmpty()){
					//create each detail for each contseals
					for (Contseal contseal : contseals){
						Truckingdetail truckingdetail = new Truckingdetail();
						truckingdetail.setConsteal(contseal);
						truckingdetails.add(truckingdetail);
						if (docsgeneral.getTypeOfDocs() == ServicesType.DVVT_SEALAND){
							truckingdetails.add(truckingdetail);
							truckingdetails.add(truckingdetail);
						}
						truckingdetail.setNoOfVehicle(docsgeneral.getSochuyen());
						truckingdetail.setVehicleNo(docsgeneral.getNameVehicle());
					}
				}
				else{
					Truckingdetail truckingdetail = new Truckingdetail();
					truckingdetail.setNoOfVehicle(docsgeneral.getSochuyen());
					truckingdetail.setVehicleNo(docsgeneral.getNameVehicle());
					truckingdetail.setIsAdded(true);
					truckingdetails.add(truckingdetail);
				}
				truckingservice.setDocsgeneral(docsgeneral);
				truckingservice.setTruckingdetails(truckingdetails);
				EntityUtil.updateExfeetableForNewTruckingdetail(truckingdetails);
			}else{
				this.updateChilds(truckingservice);
			}
			
			if (docsgeneral.getTypeOfContainer() != null && docsgeneral.getTypeOfContainer().getId() == TypeOfContainer.LCL){
				docsgeneral.setContseals(new ArrayList<Contseal>());
			}
			return truckingservice;
		}
		return null;
	}

    @Transactional(readOnly=true)
	@Override
	public void updateChilds(Truckingservice truckingservice) {
		if (truckingservice != null && truckingservice.getId() != null){
			truckingservice.setTruckingdetails(truckingdetailRepository.findByTruckingservice(truckingservice));
			List<Contseal> contseals = contsealRepository.findByDocsgeneral(truckingservice.getDocsgeneral());
			truckingservice.getDocsgeneral().setContseals(contseals);
			
			if (truckingservice.getTruckingdetails() == null || truckingservice.getTruckingdetails().isEmpty()){
				List<Truckingdetail> truckingdetails = new ArrayList<>();
				Truckingdetail truckingdetail = new Truckingdetail();
				truckingdetail.setNoOfVehicle(truckingservice.getDocsgeneral().getSochuyen());
				truckingdetail.setVehicleNo(truckingservice.getDocsgeneral().getNameVehicle());
				truckingdetail.setIsAdded(true);
				truckingdetails.add(truckingdetail);
				truckingservice.setTruckingdetails(truckingdetails);
				EntityUtil.updateExfeetableForNewTruckingdetail(truckingdetails);
			}
			//check conteal again
			if (contseals != null && !contseals.isEmpty()){
				for (Contseal contseal: contseals){
					boolean isSet = false;
					for (Truckingdetail truckingdetail : truckingservice.getTruckingdetails()){
						if (truckingdetail.getConsteal() != null && truckingdetail.getConsteal().getId() == contseal.getId()){
							isSet = true;
							break;
						}
					}
					if (!isSet){
						//this is new consteal
						Truckingdetail truckingdetail = new Truckingdetail();
						truckingdetail.setConsteal(contseal);
						truckingdetail.setNoOfVehicle(truckingservice.getDocsgeneral().getSochuyen());
						truckingdetail.setVehicleNo(truckingservice.getDocsgeneral().getNameVehicle());
						truckingservice.getTruckingdetails().add(truckingdetail);
//						if (truckingservice.getDocsgeneral().getTypeOfDocs() == ServicesType.DVVT_SEALAND){
//							truckingservice.getTruckingdetails().add(truckingdetail);
//							truckingservice.getTruckingdetails().add(truckingdetail);
//						}
					}
				}
			}
			
			//wire fees
			List<Truckingdetail> truckingdetailsEmpty = new  ArrayList<>();
			for (Truckingdetail truckingdetail: truckingservice.getTruckingdetails()){
				if (truckingdetail.getId() != null){
					truckingdetail.setExfeetables(exfeetableRepository.findByTruckingdetail(truckingdetail));
					if (truckingdetail.getExfeetables() == null || truckingdetail.getExfeetables().isEmpty() ){
						truckingdetailsEmpty.add(truckingdetail);
					}
				}
			}
			EntityUtil.updateExfeetableForNewTruckingdetail(truckingdetailsEmpty,true);
		}
		
	}

    @Transactional
	@Override
	public void saveWholePackage(Truckingservice truckingservice) {
		//wire staff
		this.checkToDeleteChilds(truckingservice);
		EntityUtil.wiredChildOfTruckingService(truckingservice);
		truckingserviceRepository.save(truckingservice);
	}

    @Transactional
	@Override
	public void checkToDeleteChilds(Truckingservice truckingservice) {
		if (truckingservice.getTruckingdetails() != null){
			List<Truckingdetail> truckingdetails = new ArrayList<>();
			for (Truckingdetail truckingdetail: truckingservice.getTruckingdetails()){
				if (truckingdetail.getIsDeleted() != null && truckingdetail.getIsDeleted() == true){
					truckingdetailRepository.delete(truckingdetail);
				}else{
					truckingdetails.add(truckingdetail);
					
					if (truckingdetail.getExfeetables() != null){
						List<Exfeetable> exfeetables = new ArrayList<>();
						for (Exfeetable exfeetable : truckingdetail.getExfeetables()){
							if (exfeetable.getIsDeleted() != null && exfeetable.getIsDeleted() ==true){
								exfeetableRepository.delete(exfeetable);
							}
							else if (exfeetable.getAmount() != BigDecimal.ZERO){
								exfeetables.add(exfeetable);
							}
						}
						truckingdetail.setExfeetables(exfeetables);
					}
				}
			}
			truckingservice.setTruckingdetails(truckingdetails);
		}
		
	}

    @Transactional
	@Override
	public void saveTruckingdetail(List<Truckingdetail> truckingdetails) {	
		if(truckingdetails != null && !truckingdetails.isEmpty()){
			List<Truckingdetail> list = new ArrayList<>();
			for (Truckingdetail truckingdetail : truckingdetails) {
				Truckingdetail truckingdetail2 = truckingdetailRepository.findOne(truckingdetail.getId());
				truckingdetail2.setPhuthu(truckingdetail.getPhuthu());
				BigDecimal price = truckingdetail.getAccountingPrice() != null ? truckingdetail.getAccountingPrice() : BigDecimal.ZERO;
				BigDecimal others = truckingdetail.getOtherFees() != null ? truckingdetail.getOtherFees() : BigDecimal.ZERO;
				BigDecimal phuthu = truckingdetail.getPhuthu() != null ? truckingdetail.getPhuthu() : BigDecimal.ZERO;
				BigDecimal phiAel = price.add(others).add(phuthu);
				BigDecimal chiHo = truckingdetail.getChiho();
				
				if (truckingdetail2.getTruckAccounting() == null) {
					//set accounting for this truck
					TruckAccounting ta = new TruckAccounting();
					ta.setPhiAelChuaChi(phiAel);
					ta.setPhiChiHoChuaChi(chiHo);
					ta.setPhiAelDaChi(BigDecimal.ZERO);
					ta.setPhiChiHoDaChi(BigDecimal.ZERO);
					ta.setPayMoneyStatus(0);
					ta.setTruckingdetail(truckingdetail2);
					truckingdetail2.setTruckAccounting(ta);
				} else {
					if (truckingdetail2.getTruckAccounting().getPayMoneyStatus() == 0) {
						truckingdetail2.getTruckAccounting().setPhiAelChuaChi(phiAel);
						truckingdetail2.getTruckAccounting().setPhiChiHoChuaChi(chiHo);
						truckingdetail2.getTruckAccounting().setPhiAelDaChi(BigDecimal.ZERO);
						truckingdetail2.getTruckAccounting().setPhiChiHoDaChi(BigDecimal.ZERO);
					}
				}

				list.add(truckingdetail2);
			}
			truckingdetailRepository.save(list);
		}		
	}

    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> searchNhathau(
			AccountingTransCondition accountingTransCondition) {
		return truckingdetailRepository.searchNhathau(accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(), accountingTransCondition.getNhathauId(), accountingTransCondition.getJob(), accountingTransCondition.getCustomerId());
	}

    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> searchVantai(
			AccountingTransCondition accountingTransCondition) {
		return truckingdetailRepository.findAllByConditionVantai(ServicesType.fromValue(accountingTransCondition.getTransId().intValue()), accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(), accountingTransCondition.getCustomerId(), accountingTransCondition.getNhathauId(), accountingTransCondition.getJob());
	}

    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> searchPackageInfo(
			AccountingTransCondition accountingTransCondition) {
		return truckingdetailRepository.findAllByConditionPackageInfo(ServicesType.DVTQ, accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(), accountingTransCondition.getCustomerId(), accountingTransCondition.getJob(), accountingTransCondition.getConsignee(), accountingTransCondition.getShipper());
	}

    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> searchProfitLoss(
			AccountingTransCondition accountingTransCondition) {
    	if(accountingTransCondition.getTypeOfDocs() == null){
    		return truckingdetailRepository.searchProfitLoss(accountingTransCondition.getCustomerId(), 
    				true, accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(), 
    				null, accountingTransCondition.getJob());

		} else {
			return truckingdetailRepository.searchProfitLoss(accountingTransCondition.getCustomerId(), 
					true, accountingTransCondition.getStartDate(), accountingTransCondition.getEndDate(), 
					ServicesType.fromValue(accountingTransCondition.getTypeOfDocs().intValue()), accountingTransCondition.getJob());
		}
	}

    @Transactional(readOnly=true)
	@Override
	public List<Docsgeneral> searchProfitLossDocs(
			AccountingTransCondition search) {

		if(search.getTypeOfDocs() == null){
			return truckingdetailRepository.searchProfitLossDocs(search.getCustomerId(), true, 
					null, search.getJob());
		} else {
			return truckingdetailRepository.searchProfitLossDocs(search.getCustomerId(), true, 
					ServicesType.fromValue(search.getTypeOfDocs().intValue()), search.getJob());
		}
	}
    
    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> findWithFullTruckingservice(
			Long truckingServiceId) {
		return truckingdetailRepository.findWithFullTruckingservice(truckingServiceId);
	}

    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> searchFeeNhathau(Search search) {
		return truckingdetailRepository.searchFeeNhathau(search.getStartDate(), search.getEndDate(), search.getJobNo(), 
				search.getNhathau(), true, search.getCheckByAdmin(), search.getApproved());
	}

    @Transactional(readOnly=true)
	@Override
	public List<Truckingdetail> findByDoAccounting(Boolean doAccounting) {
		return truckingdetailRepository.findByDoAccounting(doAccounting);
	}

	@Override
	public List<Truckingdetail> searchFeeNhathauAdvance(Search search) {
		return truckingdetailRepository.searchFeeNhathauAdvance(search.getStartDate(), search.getEndDate(), 
				search.getJobNo(), search.getNhathau(), search.getCheckByAdmin(), search.getApproved());
	}	
}
