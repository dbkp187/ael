/**
 * 
 */
package com.vn.ael.persistence.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.TruckAccounting;

/**
 * @author phuongdbk
 */
public interface TruckAccountingRepository extends
		GenericRepository<TruckAccounting> {
	
	@Query("SELECT ta FROM TruckAccounting ta WHERE "
			+ "(ta.truckingdetail.id = :truckingdetail)")
	TruckAccounting findByTruckingdetail(
			@Param(value = "truckingdetail") Long truckingdetail);
}
