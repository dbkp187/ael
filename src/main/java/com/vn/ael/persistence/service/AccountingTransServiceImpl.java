package com.vn.ael.persistence.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.entity.Transreportext;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.repository.InlandRepository;
import com.vn.ael.persistence.repository.TransreportextRepository;
import com.vn.ael.persistence.repository.TruckingdetailRepository;
import com.vn.ael.webapp.dto.AccountingTrans;

@Service
public class AccountingTransServiceImpl implements AccountingTransService{

	@Autowired
	private TransreportextRepository transreportextRepository;
	
	@Override
	public void saveWholePackage(AccountingTrans accountingTrans) {
		if (accountingTrans != null && accountingTrans.getDocs() != null && !accountingTrans.getDocs().isEmpty()){
			List<Transreportext> transreportexts = new ArrayList<>();
			for (Docsgeneral docsgeneral : accountingTrans.getDocs()){
				if (docsgeneral.getTruckingservice() != null && docsgeneral.getTruckingservice().getTruckingdetails() != null){
					for (Truckingdetail truckingdetail : docsgeneral.getTruckingservice().getTruckingdetails()){
						if (truckingdetail.getId() != null){
							truckingdetail.getTransreportext().setTruckingdetail(truckingdetail);
							transreportexts.add(truckingdetail.getTransreportext());
						}
					}
				}
			}
			transreportextRepository.save(transreportexts);
		}
	}
}
