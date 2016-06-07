/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Docservice;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.repository.DocserviceRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class DocserviceManagerImpl extends GenericManagerImpl<Docservice> implements DocserviceManager{

    private DocserviceRepository docserviceRepository;

    @Autowired
    public DocserviceManagerImpl(final DocserviceRepository docserviceRepository) {
        this.docserviceRepository = docserviceRepository;
        this.repository = docserviceRepository;
    }

	@Override
	public List<Docservice> findByDocsgeneral(Docsgeneral docsgeneral) {
		return this.docserviceRepository.findByDocsgeneral(docsgeneral);
	}

}
