package com.vn.ael.persistence.manager;

import java.util.List;

import org.appfuse.model.User;

import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.webapp.dto.Search;

public interface AdvanceDetailManager extends GenericManager<Advancedetail> {
	List<Advancedetail> findAllByAdvance(Long id);
}
