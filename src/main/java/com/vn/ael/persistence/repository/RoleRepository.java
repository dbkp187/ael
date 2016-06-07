/**
 * 
 */
package com.vn.ael.persistence.repository;

import org.appfuse.model.Role;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @author khoi
 */
public interface RoleRepository extends GenericRepository<Role> {

    public Role findByName(@Param("name") String roleName);

    @Query("delete from Role r where r.name = :roleName")
    public void deleteByName(@Param("roleName") String roleName);
}
