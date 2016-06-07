package com.vn.ael.persistence.manager;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;

public interface OfferItemManager extends GenericManager<OfferItem> {
	
	/**
	 * Find all OfferItem by the OfferPrice
	 * @param offer
	 * @return
	 */
	List<OfferItem> findByOfferPrice(OfferPrice offer);
	
	/**
	 * Find with offer price id
	 * @param offerId
	 * @return
	 */
	List<OfferItem> findWithOfferPriceId(String offerId);
	
	/**
	 * 
	 * @param customer
	 * @param servicesType
	 * @return
	 */
	List<OfferItem> findByCustomerAndTypeOfServices(Customer customer, ServicesType servicesType);
	
}
