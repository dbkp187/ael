package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Packageinfo;

public interface ContsealManager extends GenericManager<Contseal> {
	
	/**
	 * Find list of contseal by package ino object
	 * @param docsgeneral
	 * @return
	 */
	List<Contseal> findByDocsgeneral(Docsgeneral docsgeneral);

}
