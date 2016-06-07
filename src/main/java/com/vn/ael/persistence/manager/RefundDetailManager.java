package com.vn.ael.persistence.manager;

import java.util.List;

import org.appfuse.model.User;

import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.webapp.dto.Search;

public interface RefundDetailManager extends GenericManager<Refunddetail> {
	List<Refunddetail> findAllByRefund(Long id);

}
