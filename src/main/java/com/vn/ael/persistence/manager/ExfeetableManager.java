package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Extendfeeacc;

public interface ExfeetableManager extends GenericManager<Exfeetable> {
	
	/**
	 * Find by docsgeneral object
	 * @param id
	 * @return
	 */
	List<Exfeetable> findByDocsgeneral(Docsgeneral docsgeneral);
	
	/**
	 * Update vat 
	 * @param exs
	 */
	void updateVats(List<Extendfeeacc> exs);
	
	/**
	 * Find by docsgeneral id
	 * @param id
	 * @return
	 */
	List<Exfeetable> findByDocsgeneral(Long id);
	
	List<Exfeetable> findByTruckingdetail(Long id);
	
	List<Exfeetable> findByRefund(Long id);
	
	List<Exfeetable> findAllDuplicates();
	
	boolean updateDuplicated(List<Exfeetable> exfeetables);

	List<Exfeetable> findByDocsgeneralAndTruckingdetails(Long docsId);
	
	List<Exfeetable> findByListId(List<Long> listId);
}
