package com.vn.ael.persistence.manager;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.BookType;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.MoneyBook;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.repository.AdvanceFormRepository;
import com.vn.ael.persistence.repository.MoneyBookRepository;
import com.vn.ael.persistence.repository.RefundRepository;

@Transactional
@Service
public class AccountingMoneyBookManagerImpl extends GenericManagerImpl<MoneyBook> implements AccountingMoneyBookManager {
	
    private MoneyBookRepository moneyBookRepository;
    
    @Autowired
    private AdvanceFormRepository advanceFormRepository;
    
    @Autowired
    private RefundRepository refundRepository;
    
	@Autowired
    public AccountingMoneyBookManagerImpl(final MoneyBookRepository moneyBookRepository) {
        this.moneyBookRepository = moneyBookRepository;
        this.repository = moneyBookRepository;
    }

	
	@Override
	public List<MoneyBook> findByDuration(Date startDate, Date endDate) {
		return this.moneyBookRepository.findByDuration(startDate, endDate);
	}

	@Override
	public List<MoneyBook> findByDurationAndBank(Date startDate, Date endDate, Long bankId) {
		return this.moneyBookRepository.findByDurationAndBank(startDate, endDate, bankId);
	}
	
	@Override
	public List<MoneyBook> findByMoneyVoucher(Integer typeOfVoucher) {
		//return this.moneyBookRepository.findByMoneyVoucher(1);
		return null;
	}
	

	
	@Override
	public MoneyBook insertMoneyBook(MoneyBook moneyBook) {
	    moneyBook = this.moneyBookRepository.save(moneyBook);
	    return moneyBook;
	}
	
	@Override
	public void updateBasicAdvance(Advanceform form, MoneyBook moneyBook) {
		String[] ids = form.getMultipleIds().split(",");
		List<Long> listIds = new ArrayList<Long>();
		for (int i = 0; i < ids.length; i++) {
			listIds.add(Long.parseLong(ids[i]));
		}
		List<Advanceform> forms = advanceFormRepository.findAll(listIds);
		for (Advanceform f : forms) {
			f.setMoneyBook(moneyBook);
			f.setDoPrint(true);
			advanceFormRepository.save(f);
		}
	}
	
	@Override
	public void updateBasicAdvance(Refund form, MoneyBook moneyBook) {
		String[] ids = form.getMultipleIds().split(",");
		List<Long> listIds = new ArrayList<Long>();
		for (int i = 0; i < ids.length; i++) {
			listIds.add(Long.parseLong(ids[i]));
		}
		List<Refund> forms = refundRepository.findAll(listIds);
		for (Refund f : forms) {
			f.setMoneyBook(moneyBook);
			f.setDoPrint(true);
			refundRepository.save(f);
		}
	}
	
	@Override
	public MoneyBook checkFirstBalance(BookType bookType, Long bankId) {
		List<MoneyBook> moneyBooks = null;
		if (bookType == BookType.CASHBOOK) {
			moneyBooks = this.moneyBookRepository.findFirstCashBalance(bookType, VoucherType.BALANCE);
		} else {
			moneyBooks = this.moneyBookRepository.findFirstBankBalance(bookType, VoucherType.BALANCE, bankId);
		}
		if (moneyBooks == null || moneyBooks.size() == 0) {
			return null;
		}
		return moneyBooks.get(0);
	}
	
	@Override
	public void insertFirstBalance(MoneyBook firstBalance) {
		this.moneyBookRepository.save(firstBalance);
	}
	
	@Override
	public Integer getMaxVoucherNo(VoucherType type) {
		Integer i = this.moneyBookRepository.findMaxVoucherNoByType(type);
		return i != null ? i : 0;
	}


	@Override
	public MoneyBook getMoneyBookByVoucherNoAndType(Integer voucherNo, VoucherType type) {
		return this.moneyBookRepository.findByVoucherNoAndType(voucherNo, type);
	}
	
	@Override
	public MoneyBook updateMoneyBook(Long id, Integer voucherNo, Date date, String reason) {
		MoneyBook book = moneyBookRepository.getOne(id);
		book.setVoucherNo(voucherNo);
		book.setDate(date);
		book.setDescription(reason);
		moneyBookRepository.save(book);
		return book;
	}
	
}
