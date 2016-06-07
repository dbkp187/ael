/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.entity.Inlandsize;
import com.vn.ael.persistence.repository.InlandsizeRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class InlansizeManagerImpl extends GenericManagerImpl<Inlandsize> implements InlandsizeManager{

    private InlandsizeRepository inlandsizeRepository;

    @Autowired
    public InlansizeManagerImpl(final InlandsizeRepository inlandsizeRepository) {
        this.inlandsizeRepository = inlandsizeRepository;
        this.repository = inlandsizeRepository;
    }


}
