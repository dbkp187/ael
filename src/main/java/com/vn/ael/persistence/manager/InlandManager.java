package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.webapp.dto.Search;

public interface InlandManager extends GenericManager<Inland> {

	/**
	 * Remove the in land 
	 * @param inland
	 */
	void removeWholeInland(Inland inland);

	/**
	 * Store whole Inland object
	 * @param inland
	 */
	Inland saveWholeInland(Inland inland);
	
	List<Inland> searchInland(Search search);	
}
