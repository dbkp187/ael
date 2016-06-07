/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Inland;

/**
 * @author liv1hc
 */
public interface InlandRepository extends GenericRepository<Inland> {

	@Query("SELECT max(e.counting) FROM Inland e WHERE e.docsgeneral.customer.id = :customerId")
	Integer findMaxCountingByCustomer(@Param("customerId")Long id);
	
	@Query("SELECT max(e.counting) FROM Inland e WHERE e.docsgeneral.customer.id = :customerId and YEAR(createdDate) = :year")
	Integer findMaxCountingByCustomerAndYear(@Param("customerId")Long id, @Param("year")Integer year);
	
	//Add Phuc 1.8
	@Query("SELECT distinct e FROM Inland e left join fetch e.docsgeneral d left join fetch d.contseals c WHERE (e.docsgeneral.customer.id = :customerId or :customerId is null) and "
			+ "(e.docsgeneral.typeOfContainer.id =:typeOfContainer or :typeOfContainer is null) and "
			+ "(e.docsgeneral.doDelivery =:doDelivery or :doDelivery is null) and "
			+ "(e.docsgeneral.jobNo like %:jobNo% or :jobNo is null) and "
			/*+ "(c.id = :contSeal or :contSeal is null) and "*/
			+ "(e.docsgeneral.docReceiveDate >= :startDate or :startDate is null) and (e.docsgeneral.docReceiveDate <= :endDate or :endDate is null) ")
	List<Inland> searchInland(@Param("customerId") Long customerId,
			@Param("typeOfContainer") Long typeOfContainer, @Param("doDelivery") Boolean doDelivery,
			@Param("startDate") Date startDate, @Param("endDate") Date endDate,
			@Param("jobNo") String jobNo);
	//End Add Phuc 1.8
}
