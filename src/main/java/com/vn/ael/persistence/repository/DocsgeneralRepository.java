/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.Docsgeneral;

/**
 * @author khoi
 */
public interface DocsgeneralRepository extends GenericRepository<Docsgeneral> {
	
	/**
	 * Find all by jobNo value
	 * @param jobNo
	 * @return
	 */
	Docsgeneral findByJobNo(String jobNo);
	
	/**
	 * Find all by doDelivery value
	 * @param doDelivery
	 * @return
	 */
	List<Docsgeneral> findByDoDelivery(Boolean doDelivery);
	
	/**
	 * Find all by doAccounting value
	 * @param doAccounting
	 * @return
	 */
	List<Docsgeneral> findByDoAccounting(Boolean doAccounting);
	
	/**
	 * Find all by doAccounting value
	 * @param doAccounting
	 * @return
	 */
	List<Docsgeneral> findByDoAccountingAndTypeOfDocs(Boolean doAccounting, ServicesType typeOfDocs);
	
	/**
	 * Find all by doAccounting value and isCollectMoney
	 * @param doAccounting
	 * @param isCollectMoney
	 * @return
	 */
	List<Docsgeneral> findByDoAccountingAndIsCollectMoney(Boolean doAccounting, Boolean isCollectMoney);
	
	/**
	 * Find all by doAccounting and Inland/Sealand
	 * @param doAccounting
	 * @return
	 */
	@Query("from Docsgeneral d where d.doAccounting = :doAccounting and (d.typeOfDocs = :inland or d.typeOfDocs = :seaType) ")
	List<Docsgeneral> getDoAccountingInlandSealand(@Param(value = "doAccounting")Boolean doAccounting,@Param(value = "inland")ServicesType inland,@Param(value = "seaType")ServicesType seaType);
	
	/**
	 * Find all by doAccounting and Inland/Sealand
	 * @param doAccounting
	 * @return
	 */
//	@Query("from Docsgeneral d where d.customer.id=:customerId and d.doAccounting = :doAccounting and (d.typeOfDocs = :inland or d.typeOfDocs = :seaType) "
//			+"and MONTH(d.inland.createdDate) = :month "
//			+"and YEAR(d.inland.createdDate) = :year "
//			)
//	//TODO: Find correct date for comparing
//	List<Docsgeneral> getDoAccountingInlandSealandAndTime(@Param(value = "doAccounting")Boolean doAccounting,@Param(value = "inland")ServicesType inland,@Param(value = "seaType")ServicesType seaType
//			,@Param(value="month") int month, @Param(value="year") int year, @Param(value="customerId")long customerId);
	
	@Query("select d from Docsgeneral d left join fetch d.truckingservice ser left join fetch ser.truckingdetails detail "
	+ "where (d.customer.id = :customerId or :customerId is null) and d.doAccounting = :doAccounting and (d.typeOfDocs = :inland or d.typeOfDocs = :seaType) "
	+"and (detail.dateDev >= :startDate or :startDate is null) and (detail.dateDev <= :endDate or :endDate is null) and "
	+ "(d.id in (:jobList) or COALESCE(:jobList) is null) "
	+ "group by d")
	List<Docsgeneral> getDoAccountingInlandSealandAndTime(@Param(value = "doAccounting")Boolean doAccounting,@Param(value = "inland")ServicesType inland,
			@Param(value = "seaType")ServicesType seaType, @Param(value="startDate") Date startDate, @Param(value="endDate") Date endDate, 
			@Param(value="customerId")Long customerId, @Param(value="jobList") List<Long> jobList);

	
//	Add Phuc 1.8
	@Query("SELECT distinct e FROM Docsgeneral e left join fetch e.contseals c WHERE (e.customer.id = :customerId or :customerId is null) and "
			+ "(e.typeOfImport.id =:typeOfImport or :typeOfImport is null) and "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "(e.typeOfContainer.id =:typeOfContainer or :typeOfContainer is null) and "
			+ "(e.doAccounting =:doAccounting or :doAccounting is null) and "
			+ "(e.doDelivery =:doDelivery or :doDelivery is null) and "
			+ "(e.jobNo like %:jobNo% or :jobNo is null) and "
			/*+ "(c.id =:contSeal or :contSeal is null) and "*/
			+ "(e.docReceiveDate >= :startDate or :startDate is null) and (e.docReceiveDate <= :endDate or :endDate is null) and "
			+ "((e.truckingservice is not null and :hasRecord = true) or (e.truckingservice is null and :hasRecord = false) or ( :hasRecord is null))"
			)
	List<Docsgeneral> searchTrucking(@Param("customerId") Long customerId,
			@Param("typeOfImport") Long typeOfImport,
			@Param("typeOfContainer") Long typeOfContainer,
			@Param("doAccounting") Boolean doAccounting,
			@Param(value="typeOfDocs") ServicesType typeOfDocs,
			@Param(value="doDelivery") Boolean doDelivery,
			@Param(value="hasRecord") Boolean hasRecord,
			@Param(value="jobNo") String jobNo,
			@Param(value="startDate") Date startDate,
			@Param(value="endDate") Date endDate/*,
			@Param(value="contSeal") String contSeal*/
			);
//	Add Phuc 1.8
	
	@Query("SELECT e FROM Docsgeneral e WHERE (e.customer.id = :customerId or :customerId is null) and "
			+ "(e.typeOfImport.id =:typeOfImport or :typeOfImport is null) and "
			+ "e.typeOfDocs =:typeOfDocs and "
			+ "(e.typeOfContainer.id =:typeOfContainer or :typeOfContainer is null) and "
			+ "e.doAccounting =:doAccounting and "
			+ "(e.docReceiveDate >= :startDate or :startDate is null) and (e.docReceiveDate <= :endDate or :endDate is null) ")
	List<Docsgeneral> searchAccounting(@Param("customerId") Long customerId,
			@Param("typeOfImport") Long typeOfImport,
			@Param("typeOfContainer") Long typeOfContainer,
			@Param("doAccounting") Boolean doAccounting,
			@Param(value="typeOfDocs") ServicesType typeOfDocs,
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate);
	
	@Query("SELECT e FROM Docsgeneral e inner join fetch e.exhibition ex WHERE (e.customer.id = :customerId or :customerId is null) and "
			+ "(e.typeOfImport.id =:typeOfImport or :typeOfImport is null) and "
			+ "(e.typeOfContainer.id =:typeOfContainer or :typeOfContainer is null) and "
			+ "e.doAccounting =:doAccounting and "
			+ "(ex.devDate >= :startDate or :startDate is null) and (ex.devDate <= :endDate or :endDate is null) ")

	List<Docsgeneral> searchExhibitionAccounting(@Param("customerId") Long customerId,
			@Param("typeOfImport") Long typeOfImport,
			@Param("typeOfContainer") Long typeOfContainer,
			@Param("doAccounting") Boolean doAccounting,
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate);
	
	@Query("SELECT DISTINCT e.jobNo FROM Docsgeneral e")
	List<String> getAllJob();
	
	@Query("SELECT e FROM Docsgeneral e WHERE (e.customer.id = :customerId or :customerId is null) and "
			+ "(e.typeOfImport.id =:typeOfImport or :typeOfImport is null) and "
			+ "e.typeOfDocs =:typeOfDocs and "
			+ "(e.docReceiveDate >= :startDate or :startDate is null) and (e.docReceiveDate <= :endDate or :endDate is null) and "			
			+ "(e.packageinfo.consignee = :consignee or :consignee = '') and "
			+ "(e.packageinfo.shipper = :shipper or :shipper = '') and "
			+ "(e.jobNo = :jobNo or :jobNo = '')"
			+ " order by e.jobNo, e.docReceiveDate")
	List<Docsgeneral> searchShipment(@Param("customerId") Long customerId,
			@Param("typeOfImport") Long typeOfImport,
			@Param(value="typeOfDocs") ServicesType typeOfDocs,
			@Param(value="startDate") Date startDate,
			@Param(value="endDate") Date endDate,
			@Param(value="consignee") String consignee,
			@Param(value="shipper") String shipper,
			@Param(value="jobNo") String jobNo);
	
	@Query("SELECT e FROM Docsgeneral e left join fetch e.exfeetables f WHERE "
			+ "(e.customer.id = :customerId or :customerId is null) and "
			+ "(e.jobNo like %:jobNo% or :jobNo is null) and "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "e.doAccounting =:doAccounting and "
			+ "(e.docReceiveDate >= :startDate or :startDate is null) and (e.docReceiveDate <= :endDate or :endDate is null) "
			/*
			+ "(e.typeOfImport.id =:typeOfImport or :typeOfImport is null) and "
			+ "(e.typeOfContainer.id =:typeOfContainer or :typeOfContainer is null) and "
			+ "(e.doDelivery =:doDelivery or :doDelivery is null) and "
			+ "(f.checkByAdmin =:checkByAdmin or :checkByAdmin is null) and "
			+ "(f.approved =:approved or :approved is null) "
			*/
			+ "group by e")
	List<Docsgeneral> searchFeeTables(
			@Param("customerId") Long customerId,
			@Param("jobNo") String jobNo,
			@Param("doAccounting") Boolean doAccounting,
			@Param(value="typeOfDocs") ServicesType typeOfDocs,
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate);
	
	/*	@Query("SELECT e FROM Docsgeneral e left join fetch e.exfeetables f WHERE "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "(e.customer.id = :customer or :customer is null) and "
			+ "e.doAccounting =:doAccounting and "
			+ "(e.collectMoneyStatus =:collectMoneyStatus or :collectMoneyStatus is null) "
			+ "group by e")
	List<Docsgeneral> searchDebit(@Param("doAccounting") Boolean doAccounting,
			@Param(value="typeOfDocs") ServicesType typeOfDocs,
			@Param(value="customer") Long customer,
			@Param(value="collectMoneyStatus") Integer collectMoneyStatus);
	
	@Query("SELECT e FROM Docsgeneral e left join fetch e.exfeetables f WHERE "
			+ "(e.typeOfDocs =:typeOfDocs or :typeOfDocs is null) and "
			+ "(e.customer.id = :customer or :customer is null) and "
			+ "e.checkByAdmin =:checkByAdmin and "
			+ "(e.collectMoneyStatus =:moneyStatus or :moneyStatus is null) "
			+ "group by e")
	List<Docsgeneral> searchTruckingFee(@Param("checkByAdmin") Boolean checkByAdmin,
			@Param(value="typeOfDocs") ServicesType typeOfDocs,
			@Param(value="nhathau") Long nhathau,
			@Param(value="moneyStatus") Integer moneyStatus);*/
	
	@Query(value = "SELECT d.id, d.jobNo, c.name FROM Docsgeneral d left join Customers c on d.customer = c.id", nativeQuery = true)
	List<Object> findAllNotForSelection();
	
}

