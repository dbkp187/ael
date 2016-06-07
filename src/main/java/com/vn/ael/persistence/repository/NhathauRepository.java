/**
 * 
 */
package com.vn.ael.persistence.repository;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Nhathau;

/**
 * @author khoi
 */
public interface NhathauRepository extends GenericRepository<Nhathau> {
	
	List<Nhathau> findByType(Integer type, Sort sort);

}
