/**
 *
 */
package com.vn.ael.persistence.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Bank;
import com.vn.ael.persistence.repository.BankRepository;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class BankManagerImpl extends GenericManagerImpl<Bank> implements BankManager{
	private BankRepository bankRepository;

    @Autowired
    public BankManagerImpl(final BankRepository bankRepository) {
        this.bankRepository = bankRepository;
        this.repository = bankRepository;
    }

}
