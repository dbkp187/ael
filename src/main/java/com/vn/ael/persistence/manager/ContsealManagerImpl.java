/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.repository.ConfigurationRepository;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.OfferItemRepository;
import com.vn.ael.persistence.repository.OfferPriceRepository;
import com.vn.ael.persistence.repository.PackageinfoRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class ContsealManagerImpl extends GenericManagerImpl<Contseal> implements ContsealManager{

    private ContsealRepository contsealRepository;

    @Autowired
    public ContsealManagerImpl(final ContsealRepository contsealRepository) {
        this.contsealRepository = contsealRepository;
        this.repository = contsealRepository;
    }

	@Override
	public List<Contseal> findByDocsgeneral(Docsgeneral docsgeneral) {
		return this.contsealRepository.findByDocsgeneral(docsgeneral);
	}

}
