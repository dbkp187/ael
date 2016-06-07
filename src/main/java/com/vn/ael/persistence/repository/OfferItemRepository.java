/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;

/**
 * @author khoi
 */
public interface OfferItemRepository extends GenericRepository<OfferItem> {
	
	List<OfferItem> findByOfferPrice(OfferPrice offer);
	
	@Query("from OfferItem o where o.offerPrice.id = :offerId")
	List<OfferItem> findWithOfferPriceId(@Param("offerId")Long offerId);
	

}
