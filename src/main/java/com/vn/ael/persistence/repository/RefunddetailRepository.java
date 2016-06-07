/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;

/**
 * @author liv1hc
 */
public interface RefunddetailRepository extends GenericRepository<Refunddetail> {

	List<Refunddetail> findByRefund(Refund advanceform);
	
	@Query("SELECT ref FROM Refunddetail ref WHERE ref.refund.id = :id")
	List<Refunddetail> findByRefund(@Param("id")Long refund);
	
	@Query("SELECT ref FROM Refunddetail ref WHERE ref.docs.id = :jobId")
	List<Refunddetail> findByJobId(@Param("jobId") long jobId);
	
	@Query("SELECT ref FROM Refunddetail ref WHERE ref.docs.id = :jobId and (ref.refund.isPhieuThu = true)")
	List<Refunddetail> findPhieuThuByJobId(@Param("jobId") long jobId);
}
