/**
 * 
 */
package com.vn.ael.persistence.repository;

import org.appfuse.model.Role;
import org.appfuse.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @author khoi
 */
public interface UserRepository extends GenericRepository<User> {
	
	/**
	 * Find user by user name
	 * @param userName
	 * @return
	 */
	public User findByUsername(@Param("userName") String userName);

	@Query("SELECT e.password FROM User e WHERE e.id = :id")
	public String getUserPassword(@Param("id") Long id);
	
	/**
	 * Find user by user name
	 * @param userName
	 * @return
	 */
	@Query("SELECT e FROM User e WHERE e.id = :id")
	public User findByUserid(@Param("id") Long id);
}
