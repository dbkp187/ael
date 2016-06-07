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

import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
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
public class RefundDetailManagerImpl extends GenericManagerImpl<Refunddetail> implements RefundDetailManager{

    private RefunddetailRepository refunddetailRepository;
    
    @Autowired
    public RefundDetailManagerImpl(final RefunddetailRepository refunddetailRepository) {
        this.refunddetailRepository = refunddetailRepository;
        this.repository = refunddetailRepository;
    }

	@Override
	public List<Refunddetail> findAllByRefund(Long id) {
		return refunddetailRepository.findByRefund(id);
	}

}
