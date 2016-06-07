/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exhibition;

/**
 * @author liv1hc
 */
public interface ExhibitionRepository extends GenericRepository<Exhibition> {

	@Query("SELECT max(e.counting) FROM Exhibition e WHERE e.docsgeneral.customer.id = :customerId")
	Integer findMaxCountingByCustomer(@Param("customerId")Long id);
	
	@Query("SELECT max(e.counting) FROM Exhibition e WHERE e.docsgeneral.customer.id = :customerId and YEAR(createdDate) = :year")
	Integer findMaxCountingByCustomerAndYear(@Param("customerId")Long id, @Param("year")Integer year);
	
	@Query("SELECT e FROM Exhibition e where (e.docsgeneral.customer.id = :customerId or :customerId is null) and "
			+ "(e.docsgeneral.typeOfImport.id =:typeOfImport or :typeOfImport is null) and "
			+ "(e.docsgeneral.doDelivery =:doDelivery or :doDelivery is null) and "
			+ "(e.docsgeneral.jobNo like %:jobNo% or :jobNo is null) and "
			+ "(e.docsgeneral.typeOfContainer.id =:typeOfContainer or :typeOfContainer is null) and "
			+ "(e.devDate >= :startDate or :startDate is null) and (e.devDate <= :endDate or :endDate is null) ")
	List<Exhibition> searchExhibition(@Param("customerId") Long customerId,
			@Param("typeOfImport") Long typeOfImport,
			@Param("doDelivery") Boolean doDelivery,
			@Param("typeOfContainer") Long typeOfContainer,
			@Param(value="jobNo") String jobNo,
			@Param(value="startDate") Date startDate,
			@Param(value="endDate") Date endDate);
 
	@Query("FROM Docsgeneral d inner join fetch d.exhibition e WHERE e.id = :exhId")
	Docsgeneral findDocsgeneral(@Param("exhId")Long id);
}
