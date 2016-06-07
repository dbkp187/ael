package com.vn.ael.persistence.manager;

import com.vn.ael.persistence.entity.Customer;

public interface CustomerManager extends GenericManager<Customer> {
	
	/**
	 * Save customer
	 * @param customer
	 */
	public void saveCustomer(Customer customer);

	/**
	 * Find customer by code
	 * @param code
	 * @return
	 */
	public Customer findByCode(String code);
	
}
