/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.OfferPrice;

/**
 * @author liv1hc
 */
public interface AttachmentRepository extends GenericRepository<Attachment> {
	
	List<Attachment> findByOfferPrice(OfferPrice offerPrice);
	
	List<Attachment> findByDocsgeneral(Docsgeneral docsgeneral);
	
}
