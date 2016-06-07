package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.OfferItem;

public interface AttachmentManager extends GenericManager<Attachment> {

	List<Attachment> findWithOfferPriceId(String offerPriceId);

}
