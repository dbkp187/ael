/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.vn.ael.persistence.entity.Configuration;

/**
 * @author khoi
 */
public interface ConfigurationRepository extends GenericRepository<Configuration> {
	
	/**
	 * Find configuration by type
	 * @param type
	 * @return
	 */
	public List<Configuration> findByType(Integer type, Sort sort);

	/**
	 * 
	 * @param value
	 * @param boolean1
	 * @return
	 */
	public List<Configuration> findByTypeAndEnabled(Integer value, Boolean enabled, Sort sort);

}
