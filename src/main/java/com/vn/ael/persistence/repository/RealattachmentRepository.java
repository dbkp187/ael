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
import com.vn.ael.persistence.entity.Realattachment;

/**
 * @author liv1hc
 */
public interface RealattachmentRepository extends GenericRepository<Realattachment> {
	Realattachment findByAttachment(Attachment attachment);
	
}
