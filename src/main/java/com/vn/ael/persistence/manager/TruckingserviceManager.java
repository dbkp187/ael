package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.webapp.dto.AccountingTransCondition;
import com.vn.ael.webapp.dto.Search;

public interface TruckingserviceManager extends GenericManager<Truckingservice> {
	
	/**
	 * Check information inside docsgeneral to create new service info
	 * @param docsgeneral
	 * @return
	 */
	public Truckingservice createFromDocsgeneral(Docsgeneral docsgeneral);
	
	/**
	 * Update childs
	 * @param truckingservice
	 */
	public void updateChilds(Truckingservice truckingservice);

	/**
	 * Save whole package
	 * @param truckingservice
	 */
	public void saveWholePackage(Truckingservice truckingservice);
	
	/**
	 * Check to delete removed childs
	 * @param truckingservice
	 */
	public void checkToDeleteChilds(Truckingservice truckingservice);
	
	public void saveTruckingdetail(List<Truckingdetail> truckingdetails);
	
	public List<Truckingdetail> searchNhathau(AccountingTransCondition accountingTransCondition);
	
	public List<Truckingdetail> searchVantai(AccountingTransCondition accountingTransCondition);
	
	public List<Truckingdetail> searchPackageInfo(AccountingTransCondition accountingTransCondition);
	
	public List<Truckingdetail> searchProfitLoss(AccountingTransCondition accountingTransCondition);
	
	public List<Docsgeneral> searchProfitLossDocs(AccountingTransCondition accountingTransCondition);
	
	public List<Truckingdetail> findWithFullTruckingservice(Long truckingServiceId);
	
	public List<Truckingdetail> searchFeeNhathau(Search search);
	
	public List<Truckingdetail> searchFeeNhathauAdvance(Search search);
	
	public List<Truckingdetail> findByDoAccounting(Boolean doAccounting);
}

