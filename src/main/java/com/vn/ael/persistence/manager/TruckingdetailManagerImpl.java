/**
 *
 */
package com.vn.ael.persistence.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.repository.TruckingdetailRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class TruckingdetailManagerImpl extends GenericManagerImpl<Truckingdetail> implements TruckingdetailManager {
	private TruckingdetailRepository truckingdetailRepository;

	@Autowired
	public TruckingdetailManagerImpl(final TruckingdetailRepository truckingdetailRepository) {
	    this.truckingdetailRepository = truckingdetailRepository;
	    this.repository = truckingdetailRepository;
	}
}
