/**
 *
 */
package com.vn.ael.persistence.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Realattachment;
import com.vn.ael.persistence.repository.AttachmentRepository;
import com.vn.ael.persistence.repository.RealattachmentRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class RealattachmentManagerImpl extends GenericManagerImpl<Realattachment> implements RealattachmentManager{

    private RealattachmentRepository realattachmentRepository;
    
    @Autowired
    private AttachmentRepository attachmentRepository;
    
    @Autowired
    public RealattachmentManagerImpl(final RealattachmentRepository realattachmentRepository) {
        this.realattachmentRepository = realattachmentRepository;
        this.repository = realattachmentRepository;
    }

	@Override
	public Realattachment findByAttachment(Long id) {
		Attachment attachment = attachmentRepository.findOne(id);
		if (attachment != null){
//			Realattachment realattachment =  this.realattachmentRepository.findByAttachment(attachment);
//			realattachment.setAttachment(attachment);
			return attachment.getData();
		}
		return null;
	}
}
