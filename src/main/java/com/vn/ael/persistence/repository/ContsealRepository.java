/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.entity.Packageinfo;

/**
 * @author khoi
 */
public interface ContsealRepository extends GenericRepository<Contseal> {
	
	/**
	 * Find list of contseal by package ino object
	 * @param packageinfo
	 * @return
	 */
	List<Contseal> findByDocsgeneral(Docsgeneral docsgeneral);
	
}
