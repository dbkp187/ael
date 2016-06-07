/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.entity.Inlandsize;

/**
 * @author khoi
 */
public interface InlandsizeRepository extends GenericRepository<Inlandsize> {
	
	/**
	 * Find list by LCL
	 * @param inlandlcl
	 * @return
	 */
	List<Inlandsize> findByDocsgeneral(Docsgeneral docsgeneral);
	
}
