package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Docservice;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Packageinfo;

public interface DocserviceManager extends GenericManager<Docservice> {
	
	/**
	 * Find list of Docservice by packageInfo
	 * @param packageinfo
	 * @return
	 */
	List<Docservice> findByDocsgeneral(Docsgeneral docsgeneral);
	
}
