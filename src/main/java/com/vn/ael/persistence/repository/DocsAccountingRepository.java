/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.DocsAccounting;
import com.vn.ael.persistence.entity.Docsgeneral;

/**
 * @author phuongdbk
 */
public interface DocsAccountingRepository extends
		GenericRepository<DocsAccounting> {
	/**
	 * Find by docsgeneral
	 * 
	 * @param docs
	 *            id
	 * @return
	 */
	DocsAccounting findByDocsgeneral(Docsgeneral docsgeneral);

	@Query("SELECT da FROM DocsAccounting da WHERE da.docsgeneral.id in :listId")
	List<DocsAccounting> findByDocsgeneralIds(@Param("listId") List<Long> listId);

	@Query("SELECT e FROM Docsgeneral e inner join fetch e.docsAccounting f WHERE "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "(e.customer.id = :customer or :customer is null) and "
			+ "e.doAccounting =:doAccounting and "
			+ "(e.docReceiveDate >= :startDate or :startDate is null) and (e.docReceiveDate <= :endDate or :endDate is null) and "
			+ "(e.collectMoneyStatus =:collectMoneyStatus or :collectMoneyStatus is null) "
			)
	List<Docsgeneral> searchDebit(@Param("doAccounting") Boolean doAccounting,
			@Param(value = "typeOfDocs") ServicesType typeOfDocs,
			@Param(value = "customer") Long customer,
			@Param(value = "collectMoneyStatus") Integer collectMoneyStatus,
			@Param(value = "startDate") Date startDate,
			@Param(value = "endDate") Date endDate);
	
	
	
	/*@Query("SELECT e FROM Docsgeneral e left join fetch e.exfeetables f WHERE "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "(e.customer.id = :customer or :customer is null) and "
			+ "e.doAccounting =:doAccounting and "
			+ "(e.collectMoneyStatus =:collectMoneyStatus or :collectMoneyStatus is null) "
			+ "group by e")
	List<Docsgeneral> searchDebit(@Param("doAccounting") Boolean doAccounting,
			@Param(value = "typeOfDocs") ServicesType typeOfDocs,
			@Param(value = "customer") Long customer,
			@Param(value = "collectMoneyStatus") Integer collectMoneyStatus);

	@Query("SELECT e FROM Docsgeneral e left join fetch e.exfeetables f WHERE "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "(e.customer.id = :customer or :customer is null) and "
			+ "e.checkByAdmin =:checkByAdmin and "
			+ "(e.collectMoneyStatus =:moneyStatus or :moneyStatus is null) "
			+ "group by e")
	List<Docsgeneral> searchTruckingFee(
			@Param("checkByAdmin") Boolean checkByAdmin,
			@Param(value = "typeOfDocs") ServicesType typeOfDocs,
			@Param(value = "nhathau") Long nhathau,
			@Param(value = "moneyStatus") Integer moneyStatus);*/
}
