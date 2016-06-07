package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Exhibition;
import com.vn.ael.webapp.dto.Search;

public interface ExhibitionManager extends GenericManager<Exhibition> {

	/**
	 * Find whold object based on id
	 * @param id
	 * @return
	 */
	Exhibition findWholeObjects(String id);

	/**
	 * Remove whole objects
	 * @param exhibition
	 */
	void removeWholeExh(Exhibition exhibition);

	/**
	 * Persit whole object
	 * @param exhibition
	 */
	Exhibition saveWholeExh(Exhibition exhibition);

	/**
	 * Load information for report
	 * @param id
	 * @return
	 */
	Exhibition findReportObjects(String id);

	/**
	 * Update values for exhibition report
	 * @param exhibition
	 */
	void saveWholeExhReport(Exhibition exhibition);
	
	List<Exhibition> searchInland(Search search);
	
	List<Exfeetable> findFeeChiHo(Long exhibitionId);
	
	Docsgeneral findDocsgeneral(Long docsId);

}
