/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.entity.Multitype;

/**
 * @author khoi
 */
public interface MultitypeRepository extends GenericRepository<Multitype> {

	/**
	 * Find list of Multitype by docsgeneral
	 * @param inland
	 * @return
	 */
	List<Multitype> findByDocsgeneral(Docsgeneral docsgeneral);
	
	
}
