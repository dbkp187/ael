package com.vn.ael.persistence.manager;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.OfferPrice;

public interface OfferPriceManager extends GenericManager<OfferPrice> {
	
	/**
	 * Find all by customer
	 * @param customer
	 * @return
	 */
	List<OfferPrice> findByCustomer(Customer customer);
	
	/**
	 * Find with customer id
	 * @param customerId
	 * @return
	 */
	List<OfferPrice> findWithCustomerId(String customerId);
	
	/**
	 * Load all childs
	 * @param offerPrice
	 */
	void updateChilds(OfferPrice offerPrice);
	
	/**
	 * Check to save/upadte the entity and its childs
	 * @param offerPrice
	 */
	void saveWholePackage(OfferPrice offerPrice);
	
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
