/**
 *
 */
package com.vn.ael.persistence.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.vn.ael.persistence.entity.Multitype;
import com.vn.ael.persistence.repository.MultitypeRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class MultitypeManagerImpl extends GenericManagerImpl<Multitype> implements MultitypeManager{

    private MultitypeRepository multitypeRepository;

    @Autowired
    public MultitypeManagerImpl(final MultitypeRepository multitypeRepository) {
        this.multitypeRepository = multitypeRepository;
        this.repository = multitypeRepository;
    }

}
