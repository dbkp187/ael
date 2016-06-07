/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.OfferPrice;

/**
 * @author khoi
 */
public interface OfferPriceRepository extends GenericRepository<OfferPrice> {
	
	/**
	 * Find all by customer
	 * @param customer
	 * @return
	 */
	List<OfferPrice> findByCustomer(Customer customer);
	
	/**
	 * Find all with customer id
	 * @param customerId
	 * @return
	 */
	@Query("from OfferPrice o where o.customer.id = :customerId")
	List<OfferPrice> findWithCustomerId(@Param("customerId")Long customerId);
	
	/**
	 * Find all by customer and type of service
	 * @param customer
	 * @param servicesType
	 * @return
	 */
	List<OfferPrice> findByCustomerAndTypeOfService(Customer customer, ServicesType servicesType);
	
	/**
	 * Find all by customer and type of service and isValid
	 * @param customer
	 * @param servicesType
	 * @param isValid
	 * @return
	 */
	List<OfferPrice> findByCustomerAndTypeOfServiceAndIsValid(Customer customer, ServicesType servicesType, Boolean isValid);

}
