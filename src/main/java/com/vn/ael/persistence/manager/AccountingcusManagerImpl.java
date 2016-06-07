/**
 *
 */
package com.vn.ael.persistence.manager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.record.DConRefRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.TypeOfContainer;
import com.vn.ael.constants.TypeOfFee;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Accountingcusdetail;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Extendfeeacc;
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.persistence.repository.AccountingcusRepository;
import com.vn.ael.persistence.repository.AccountingcusdetailRepository;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.DocsgeneralRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.ExtendfeeaccRepository;
import com.vn.ael.persistence.repository.TruckingdetailRepository;
import com.vn.ael.persistence.repository.TruckingserviceRepository;
import com.vn.ael.webapp.util.ConvertUtil;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.CommonUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class AccountingcusManagerImpl extends GenericManagerImpl<Accountingcus> implements AccountingcusManager{

    private AccountingcusRepository accountingcusRepository;
    
    @Autowired
    private ExfeetableRepository exfeetableRepository;
    
    @Autowired
    private TruckingserviceRepository truckingserviceRepository;
    
    @Autowired
    private TruckingdetailRepository truckingdetailRepository; 
    
    @Autowired
    private ContsealRepository contsealRepository;
    
    @Autowired
    private DocsgeneralRepository docsgeneralRepository;
    
    @Autowired
    private AccountingcusdetailRepository accountingcusdetailRepository;
    
    @Autowired
    private ExtendfeeaccRepository extendfeeaccRepository;
    
    @Autowired
    public AccountingcusManagerImpl(final AccountingcusRepository accountingcusRepository) {
        this.accountingcusRepository = accountingcusRepository;
        this.repository = accountingcusRepository;
    }

	@Override
	public Accountingcus createFromDocsgeneral(Docsgeneral docsgeneral) {
		if (docsgeneral != null){
			Accountingcus accountingcus = accountingcusRepository.findByDocsgeneral(docsgeneral);
			if (accountingcus == null){
				// create new accoutning for custom service
				accountingcus = new Accountingcus();
				accountingcus.setDocsgeneral(docsgeneral);
			}
			this.updateChilds(accountingcus);
			this.updateCustomFee(accountingcus);
			return accountingcus;
		}
		return null;
	}

	@Override
	public void saveWholePackage(Accountingcus accountingcus) {
		//calculate ref no
		this.updateJobNo(accountingcus);
		this.deleteRemoval(accountingcus);
		EntityUtil.wireChildOfAccountingcus(accountingcus);
		//persit object
		this.save(accountingcus);
	}
	
	/**
	 * Remove the child which has been removed at client side
	 * @param accountingcus
	 */
	private void deleteRemoval(Accountingcus accountingcus) {
		if (accountingcus != null && accountingcus.getAccountingcusdetails() != null && !accountingcus.getAccountingcusdetails().isEmpty()){
			List<Accountingcusdetail> accountingcusdetails = new ArrayList<>();
			for (Accountingcusdetail accountingcusdetail : accountingcus.getAccountingcusdetails()){
				if (accountingcusdetail.getIsDeleted() != null && accountingcusdetail.getIsDeleted() == true){
					this.accountingcusdetailRepository.delete(accountingcusdetail);
				}else if (accountingcusdetail.getIsAdded() == null || !accountingcusdetail.getIsAdded()){
					accountingcusdetails.add(accountingcusdetail);
				}
			}
			accountingcus.setAccountingcusdetails(accountingcusdetails);
		}
		
	}

	/**
	 * Update Jobno 
	 * @param accountingcus
	 */
	private void updateJobNo(Accountingcus accountingcus){
		if (accountingcus.getId() == null || accountingcus.getRefNo() == null || accountingcus.getRefNo().isEmpty() || accountingcus.getCounting() == null){
			if (accountingcus.getDocsgeneral() != null && accountingcus.getDocsgeneral().getId() != null){
				accountingcus.setDocsgeneral(docsgeneralRepository.getOne(accountingcus.getDocsgeneral().getId()));
			}
			Integer counting = accountingcusRepository.findMaxCountingByCustomer(accountingcus.getDocsgeneral().getCustomer().getId());
				if (counting == null ){
					counting = AELConst.START_COUNT_JOB_ID;
				}
				accountingcus.setCounting(counting+1);
			//String jobNo = ServicesType.DVTQ.getDebit()+accountingcus.getDocsgeneral().getCustomer().getCode()+CommonUtil.addZero(accountingcus.getCounting(), CommonUtil.LENGTH_OF_COUNTER);
			String jobNo = accountingcus.getDocsgeneral().getJobNo();
			accountingcus.setRefNo(jobNo);
		}
		
	}
	
	/**
	 * New accounting cus is created, update values
	 * @param accountingcus
	 */
	private void updateChilds(Accountingcus accountingcus){
		if (accountingcus != null && accountingcus.getId() != null){
			accountingcus.setAccountingcusdetails(accountingcusdetailRepository.findByAccountingcus(accountingcus));
		}
		
		if (accountingcus.getAccountingcusdetails() == null || accountingcus.getAccountingcusdetails().isEmpty()){
			List<Accountingcusdetail> accountingcusdetails =  new ArrayList<>();
			Accountingcusdetail accountingcusdetail = new Accountingcusdetail();
			accountingcusdetail.setIsAdded(true);
			accountingcusdetails.add(accountingcusdetail);
			accountingcus.setAccountingcusdetails(accountingcusdetails);
		}
	}
	
	/**
	 * Calculate chiho and total amount from tablefee
	 * @param accountingcus
	 */
	private void updateCustomFee(Accountingcus accountingcus){
		//calculate trucking fee
		List<Exfeetable> exfeetables = exfeetableRepository.findByDocsgeneral(accountingcus.getDocsgeneral());
		List<Exfeetable> truckingFee = exfeetableRepository.findWithTruckingService(accountingcus.getDocsgeneral().getTruckingservice().getId());
		if (exfeetables != null){
			exfeetables.addAll(truckingFee);
		}else{
			exfeetables = truckingFee;
		}
		List<Extendfeeacc> chiho = new ArrayList<Extendfeeacc>();
		if (exfeetables != null && !exfeetables.isEmpty()){
			for (Exfeetable exfeetable : exfeetables){
				if (exfeetable.getMasterFee() != null && exfeetable.getMasterFee().getId() == TypeOfFee.CHI_HO_ID){
					if (accountingcus.getId() == null || exfeetable.getExtendfeeacc() == null){
						Extendfeeacc extendfeeacc = new Extendfeeacc();
						extendfeeacc.setFeeowner(exfeetable);
						//add to chiho list
						chiho.add(extendfeeacc);
					}
					else{
						chiho.add(exfeetable.getExtendfeeacc());
					}
				}
			}
		}
		accountingcus.setExtendfeeaccs(chiho);
	}
	
}
