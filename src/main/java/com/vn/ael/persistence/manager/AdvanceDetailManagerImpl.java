/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.ArrayList;
import java.util.List;

import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.repository.AdvanceFormRepository;
import com.vn.ael.persistence.repository.AdvancedetailRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.RefundRepository;
import com.vn.ael.persistence.repository.RefunddetailRepository;
import com.vn.ael.persistence.repository.UserRepository;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.EntityUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class AdvanceDetailManagerImpl extends GenericManagerImpl<Advancedetail> implements AdvanceDetailManager{

    private AdvancedetailRepository advancedetailRepository;
    
    @Autowired
    public AdvanceDetailManagerImpl(final AdvancedetailRepository advancedetailRepository) {
        this.advancedetailRepository = advancedetailRepository;
        this.repository = advancedetailRepository;
    }
//
//	@Override
//	public List<Refunddetail> findAllByRefund(Long id) {
//		return refunddetailRepository.findByRefund(id);
//	}

	@Override
	public List<Advancedetail> findAllByAdvance(Long id) {
		// TODO Auto-generated method stub
		return advancedetailRepository.findByAdvance(id);
	}

}
