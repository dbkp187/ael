/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.appfuse.model.Role;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.repository.CustomerRepository;
import com.vn.ael.persistence.repository.RoleRepository;
import com.vn.ael.webapp.controller.ReloadController;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service("customerManager")
public class CustomerManagerImpl extends GenericManagerImpl<Customer> implements CustomerManager{
	private final Log log = LogFactory.getLog(CustomerManagerImpl.class);
    private CustomerRepository customerRepository;

    @Autowired
    public CustomerManagerImpl(final CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
        this.repository = customerRepository;
    }

	@Override
	public void saveCustomer(Customer customer) {
		try{
			this.customerRepository.save(customer);
		}
		catch(Exception e){
			log.error(e);
		}
		
	}

	@Override
	public Customer find(String id) {
		return this.get(new Long(id));
	}

	@Override
	public Customer findByCode(String code) {
		return this.customerRepository.findByCode(code);
	}

}
