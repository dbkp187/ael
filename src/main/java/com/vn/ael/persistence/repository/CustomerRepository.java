/**
 * 
 */
package com.vn.ael.persistence.repository;

import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.Customer;

/**
 * @author khoi
 */
public interface CustomerRepository extends GenericRepository<Customer> {

	/**
	 * Find customer by name
	 * @param roleName
	 * @return
	 */
    public Customer findByName(@Param("name") String name);
    
    /**
     * Find customer by code
     * @param roleName
     * @return
     */
    public Customer findByCode(@Param("code") String code);
}
