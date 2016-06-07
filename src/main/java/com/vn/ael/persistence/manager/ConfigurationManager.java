package com.vn.ael.persistence.manager;

import java.util.List;
import java.util.Map;

import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.webapp.dto.DocsSelection;

public interface ConfigurationManager extends GenericManager<Configuration> {

	/**
	 * Persist the config
	 * @param configuration
	 */
	void saveConfig(Configuration configuration);
	
	
	/**
	 * Get all available configuration by type
	 * @return
	 */
	List<Configuration> getAllByType(ConfigurationType type, Boolean... enabled);
	
	/**
	 * Get a map of configuration objects by type
	 * @param type
	 * @return
	 */
	Map<Long,String> getSelectionsByType(ConfigurationType type, Boolean... enabled);
	
	/**
	 * Init all selection for docs
	 * @return
	 */
	DocsSelection loadSelectionForDocsPage(ConfigurationType... configurationTypes);
	
	/**
	 * 
	 * @param hasJobs
	 * @param configurationTypes
	 * @return
	 */
	DocsSelection loadSelectionForDocsPage(boolean hasJobs,ConfigurationType... configurationTypes);
	
	/**
	 * 
	 * @param configurationTypes
	 * @return
	 */
	Map<String,Map<Long,String>> createSelections(ConfigurationType... configurationTypes );
	
}
