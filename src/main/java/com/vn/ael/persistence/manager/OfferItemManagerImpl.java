/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Customer;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.repository.OfferItemRepository;
import com.vn.ael.persistence.repository.OfferPriceRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class OfferItemManagerImpl extends GenericManagerImpl<OfferItem> implements OfferItemManager{

	@Autowired
	private OfferPriceRepository offerPriceRepository;
	
    private OfferItemRepository offerItemRepository;

    @Autowired
    public OfferItemManagerImpl(final OfferItemRepository offerItemRepository) {
        this.offerItemRepository = offerItemRepository;
        this.repository = offerItemRepository;
    }

	@Override
	public List<OfferItem> findByOfferPrice(OfferPrice offer) {
		return this.offerItemRepository.findByOfferPrice(offer);
	}

	@Override
	public List<OfferItem> findWithOfferPriceId(String offerId) {
		return this.offerItemRepository.findWithOfferPriceId(new Long(offerId));
	}

	@Override
	public List<OfferItem> findByCustomerAndTypeOfServices(Customer customer,
			ServicesType servicesType) {
		List<OfferPrice> offerPrices = this.offerPriceRepository.findByCustomerAndTypeOfService(customer, servicesType);
		List<OfferItem> offerItems = new ArrayList<>();
		if (offerPrices != null && !offerPrices.isEmpty()){
			for (OfferPrice offerPrice : offerPrices){
				List<OfferItem> items = this.offerItemRepository.findByOfferPrice(offerPrice);
				offerItems.addAll(items);
			}
		}
		return offerItems;
	}

}
