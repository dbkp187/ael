package com.vn.ael.persistence.manager;

import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Realattachment;

public interface RealattachmentManager extends GenericManager<Realattachment> {
	
	Realattachment findByAttachment(Long id);

}
