/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import com.vn.ael.persistence.entity.Docservice;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Packageinfo;

/**
 * @author khoi
 */
public interface DocserviceRepository extends GenericRepository<Docservice> {
	/**
	 * Find list of Docservice by packageInfo
	 * @param packageinfo
	 * @return
	 */
	List<Docservice> findByDocsgeneral(Docsgeneral docsgeneral);

	
}
