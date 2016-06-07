/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.Date;
import java.util.List;

import org.appfuse.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Advanceform;

/**
 * @author liv1hc
 */
public interface AdvanceFormRepository extends GenericRepository<Advanceform> {
	
	List<Advanceform> findByEmployee(User employee);
	
	@Query("SELECT e FROM Advanceform e LEFT JOIN FETCH e.advancedetails adv WHERE (e.employee.id = :employeeId or :employeeId is null) and "
			+ "(e.date >= :startDate or :startDate is null) and (e.date <= :endDate or :endDate is null) and "
			+ "(e.timeRefund >= :startTimeRefund or :startTimeRefund is null) and (e.timeRefund <= :endTimeRefund or :endTimeRefund is null) and "
			+ "(e.doApproval =:doApproval or :doApproval is null) and "
			+ "(adv.docs.jobNo = :jobNo or :jobNo = '')")
	List<Advanceform> searchAdvanceForm(@Param("employeeId") Long employeeId,
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate,
			@Param("startTimeRefund") Date startTimeRefund,
			@Param("endTimeRefund") Date endTimeRefund,
			@Param("doApproval") Boolean doApproval,
			@Param("jobNo") String jobNo);
	
	@Query("SELECT e FROM Advanceform e WHERE (e.employee.id = :employeeId or :employeeId is null) and "
			+ "(e.date >= :startDate or :startDate is null) and (e.date <= :endDate or :endDate is null) and "
			+ "(e.timeRefund >= :startTimeRefund or :startTimeRefund is null) and (e.timeRefund <= :endTimeRefund or :endTimeRefund is null) and "
			+ "(e.doApproval =:doApproval or :doApproval is null)")
	List<Advanceform> searchAdvanceFormAll(@Param("employeeId") Long employeeId,
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate,
			@Param("startTimeRefund") Date startTimeRefund,
			@Param("endTimeRefund") Date endTimeRefund,
			@Param("doApproval") Boolean doApproval); 
	
	@Query("SELECT e FROM Advanceform e WHERE (e.employee.id = :employeeId or :employeeId is null) and "
			+ "(e.date = :startDate ) and "
			+ "(e.timeRefund between :startTimeRefund and :endTimeRefund) and "
			+ "(e.doApproval =:doApproval or :doApproval is null)")
	List<Advanceform> searchAdvanceFormBefore(@Param("employeeId") Long employeeId,
			@Param("startDate") Date startDate,
			@Param("startTimeRefund") Date startTimeRefund,
			@Param("endTimeRefund") Date endTimeRefund,
			@Param("doApproval") Boolean doApproval);
	
	@Query("SELECT e FROM Advanceform e WHERE (e.employee.id = :employeeId or :employeeId is null) and "			
			+ "e.doApproval =:doApproval")
	List<Advanceform> findByEmployeeAndDoApproval(@Param("employeeId") Long employeeId, 
			@Param("doApproval") Boolean doApproval);
	
	@Query("SELECT e FROM Advanceform e WHERE e.moneyBook.id = :moneyBook")
	List<Advanceform> findByMoneyBook(@Param("moneyBook") Long moneyBook);
}
