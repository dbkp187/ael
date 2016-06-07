/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.ael.constants.BookType;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.persistence.entity.MoneyBook;

/**
 * @author phuongdbk
 */
public interface MoneyBookRepository extends GenericRepository<MoneyBook> {
	
	@Query("SELECT m FROM MoneyBook m WHERE "
			+ "m.typeOfBook = 0 and "
			+ "(m.date >= :startDate or :startDate is null) and (m.date <= :endDate or :endDate is null) "
			+ "order by m.date desc, m.voucherNo desc"
			)
	List<MoneyBook> findByDuration(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
	
	@Query("SELECT m FROM MoneyBook m WHERE "
			+ "m.typeOfBook = 1 and (:bankId is null or m.bank.id = :bankId) and " 
			+ "(m.date >= :startDate or :startDate is null) and (m.date <= :endDate or :endDate is null) "
			+ "order by m.date desc, m.voucherNo desc"
			)
	List<MoneyBook> findByDurationAndBank(@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("bankId") Long bankId);
	
	@Query("SELECT max(e.voucherNo) FROM MoneyBook e WHERE e.typeOfVoucher = :type")
	Integer findMaxVoucherNoByType(@Param("type") VoucherType type);
	
	@Query("SELECT DISTINCT m FROM MoneyBook m WHERE voucherNo = :voucherNo and typeOfVoucher = :type")
	MoneyBook findByVoucherNoAndType(@Param("voucherNo") Integer voucherNo, @Param("type") VoucherType type);
	
	@Query("SELECT m FROM MoneyBook m WHERE typeOfBook = :bookType and typeOfVoucher = :typeOfVoucher")
	List<MoneyBook> findFirstCashBalance(@Param("bookType") BookType bookType, @Param("typeOfVoucher") VoucherType typeOfVoucher);
	
	@Query("SELECT m FROM MoneyBook m WHERE typeOfBook = :bookType and typeOfVoucher = :typeOfVoucher and bank.id = :bankId")
	List<MoneyBook> findFirstBankBalance(@Param("bookType") BookType bookType, @Param("typeOfVoucher") VoucherType typeOfVoucher,
			@Param("bankId") Long bankId);
}
