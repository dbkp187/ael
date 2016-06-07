/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Truckingdetail;

/**
 * @author liv1hc
 */
public interface ExfeetableRepository extends GenericRepository<Exfeetable> {
	
	/**
	 * Find by docsgeneral, with soting condition
	 * @param docsgeneral
	 * @return
	 */
	List<Exfeetable> findByDocsgeneral(Docsgeneral docsgeneral, Sort sort);
	
	/**
	 * Find by docsgeneral
	 * @param docsgeneral
	 * @return
	 */
	List<Exfeetable> findByDocsgeneral(Docsgeneral docsgeneral);
	
	/**
	 * Find by truckingdetail
	 * @param truckingdetail
	 * @return
	 */
	List<Exfeetable> findByTruckingdetail(Truckingdetail truckingdetail);

	/**
	 * Find by truckingdetail
	 * @param truckingdetail
	 * @return
	 */
	@Query("from Exfeetable e where e.truckingdetail.truckingservice.id = :truckingId ")
	List<Exfeetable> findWithTruckingService(@Param(value = "truckingId") long truckingId);
	
	/**
	 * Find by Exhibition
	 * @param exhibition
	 * @return
	 */
	List<Exfeetable> findByExhibition(Exhibition exhibition);
	
	List<Exfeetable> findByRefund(Refund refund);
	
	List<Exfeetable> findByDocsgeneralAndMasterFeeAndNameAndAmountAndVatAndInvoiceNo(Docsgeneral docsgeneral, 
			Configuration masterFee, Configuration name,BigDecimal amount, BigDecimal vat, String invoiceNo);
	
	
	
	@Query("select distinct e "
			+ "from Exfeetable e where e.docsgeneral is not null "
			+ "group by e.docsgeneral, e.name, e.amount, e.vat, e.invoiceNo having count(e) > 1")
			//+ "group by e.docsgeneral, e.masterFee, e.name, e.amount, e.vat, e.invoiceNo having count(e) > 1")
	List<Exfeetable> findAllDuplicates();
	
	@Query(   " select e from Exfeetable e "
			+ "  where e.docsgeneral.id = :docsId "
			+ "  or e.truckingdetail in ( "
			+ "     select td.id from Truckingdetail td where td.truckingservice.id = "
			+ "     (select ts.id from Truckingservice ts where ts.docsgeneral.id = :docsId) "
			+ "  ) "
			+ " order by e.truckingdetail asc, e.docsgeneral.id asc ")
	List<Exfeetable> findByDocsgeneralAndTruckingdetails(@Param(value = "docsId")Long docsId);
	
	@Query(   " select e from Exfeetable e "
			+ "  where (e.docsgeneral.id = :docsId "
			+ "  or e.truckingdetail in ( "
			+ "  select td.id from Truckingdetail td where td.truckingservice.id = (select ts.id from Truckingservice ts where ts.docsgeneral.id = :docsId) "
			+ " )) and e.masterFee = -10 ")
	List<Exfeetable> findChiHoByDocsgeneralAndTruckingdetails(@Param(value = "docsId")Long docsId);

	@Query(   " select e from Exfeetable e "
			+ "  where id in :listId ")
	List<Exfeetable> findByListId(@Param(value = "listId")List<Long> listId);
}
