/**
 * 
 */
package com.vn.ael.persistence.repository;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Truckingservice;

/**
 * @author liv1hc
 */
public interface TruckingserviceRepository extends GenericRepository<Truckingservice> {
	
	/**
	 * Find by docsgeneral
	 * @param docsgeneral
	 * @return
	 */
	Truckingservice findByDocsgeneral(Docsgeneral docsgeneral);

}
