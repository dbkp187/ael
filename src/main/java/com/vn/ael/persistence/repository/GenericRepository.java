/**
 * 
 */
package com.vn.ael.persistence.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;


/**
 * @author khoi
 */
@NoRepositoryBean
public interface GenericRepository<T> extends JpaRepository<T, Long> {

    public static final int DEFAULT_PAGE = 0;

    public static final int DEFAULT_PAGE_SIZE = 10;
}
