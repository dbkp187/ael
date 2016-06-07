/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Docsgeneral;

/**
 * @author liv1hc
 */
public interface AccountingcusRepository extends GenericRepository<Accountingcus> {
	
	Accountingcus findByDocsgeneral(Docsgeneral docsgeneral);

	@Query("SELECT max(e.counting) FROM Accountingcus e WHERE e.docsgeneral.customer.id = :customerId")
	Integer findMaxCountingByCustomer(@Param("customerId")Long id);
	

}
