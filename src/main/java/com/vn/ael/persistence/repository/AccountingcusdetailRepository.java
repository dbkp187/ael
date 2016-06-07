/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Accountingcusdetail;
import com.vn.ael.persistence.entity.Docsgeneral;

/**
 * @author liv1hc
 */
public interface AccountingcusdetailRepository extends GenericRepository<Accountingcusdetail> {
	
	List<Accountingcusdetail> findByAccountingcus(Accountingcus accountingcus);
	
}
