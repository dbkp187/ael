/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.OfferPrice;

/**
 * @author liv1hc
 */
public interface AdvancedetailRepository extends GenericRepository<Advancedetail> {

	List<Advancedetail> findByAdvanceform(Advanceform advanceform);
	
	@Query("SELECT adv FROM Advancedetail adv WHERE adv.docs.id = :jobId")
	List<Advancedetail> findByJobId(@Param("jobId") long jobId);

	@Query("SELECT adv FROM Advancedetail adv WHERE adv.advanceform.id = :id")
	List<Advancedetail> findByAdvance(@Param("id")Long id);
}
