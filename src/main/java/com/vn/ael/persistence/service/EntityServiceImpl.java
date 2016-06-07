package com.vn.ael.persistence.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vn.ael.persistence.entity.BasedEntityTracking;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.ExfeetableManager;
import com.vn.ael.persistence.manager.UserManager;

@Service
public class EntityServiceImpl implements EntityService {

	@Autowired
	private UserManager userManager;
	
	@Autowired
	private ConfigurationManager configurationManager = null;
	 
	@Autowired
	private ExfeetableManager exfeetableManager;
	
	@Override
	public void checkUpdateInfo(BasedEntityTracking basedEntityTracking,
			boolean isNew, HttpServletRequest request) {
		User loggedUser = userManager.getLoggedUser(request);
    	if (isNew){
    		//set creator && created time
    		basedEntityTracking.setCreator(loggedUser);
    		basedEntityTracking.setCreatedDate(Calendar.getInstance().getTime());
    	}
    	else{
    		basedEntityTracking.setCreator(userManager.findById(basedEntityTracking.getCreator().getId()));
    	}
    	basedEntityTracking.setUpdator(loggedUser);
    	basedEntityTracking.setLastUpdateDate(Calendar.getInstance().getTime());
	}
	

	@Override
	public List<Docsgeneral> listContainsDuplicatedFees() {
		List<Docsgeneral> duplicated = new ArrayList<Docsgeneral>();
		
		//List<Exfeetable> fees = exfeetableManager.findAllHaveDocsgeneral();
		List<Exfeetable> fees = exfeetableManager.findAllDuplicates();
		for (Exfeetable fee : fees) {
			Docsgeneral key = fee.getDocsgeneral();
			if (!duplicated.contains(key)) {
				duplicated.add(fee.getDocsgeneral());
			}
		}
		
		return duplicated;
	}


}
