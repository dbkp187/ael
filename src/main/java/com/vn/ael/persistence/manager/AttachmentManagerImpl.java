/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.TypeOfFee;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Accountingcusdetail;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Extendfeeacc;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.repository.AccountingcusRepository;
import com.vn.ael.persistence.repository.AccountingcusdetailRepository;
import com.vn.ael.persistence.repository.AttachmentRepository;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.DocsgeneralRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.ExtendfeeaccRepository;
import com.vn.ael.persistence.repository.OfferPriceRepository;
import com.vn.ael.persistence.repository.TruckingdetailRepository;
import com.vn.ael.persistence.repository.TruckingserviceRepository;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.CommonUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class AttachmentManagerImpl extends GenericManagerImpl<Attachment> implements AttachmentManager{

    private AttachmentRepository attachmentRepository;
    
    @Autowired
    OfferPriceRepository offerPriceRepository;
    
    @Autowired
    public AttachmentManagerImpl(final AttachmentRepository attachmentRepository) {
        this.attachmentRepository = attachmentRepository;
        this.repository = attachmentRepository;
    }

	@Override
	public List<Attachment> findWithOfferPriceId(String offerPriceId) {
		OfferPrice offerPrice = offerPriceRepository.findOne(Long.valueOf(offerPriceId));
		return attachmentRepository.findByOfferPrice(offerPrice);
	}

}
