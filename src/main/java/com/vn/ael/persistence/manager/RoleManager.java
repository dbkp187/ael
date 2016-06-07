package com.vn.ael.persistence.manager;

import java.util.List;

import org.appfuse.model.LabelValue;
import org.appfuse.model.Role;

public interface RoleManager extends GenericManager<Role> {

	/**
	 * Get role by id in String
	 * 
	 * @param long1
	 */
	public Role getByIdRole(final String roleId);

	/**
	 * Get role by roleName
	 * 
	 * @param long1
	 */
	public Role getRole(String rolename);

	/**
	 * Remove role by roleName
	 * @param rolename
	 */
	public void removeRole(String rolename);
	
	/**
	 * Remove role by id in String
	 * @param rolename
	 */
	public void removeRoleById(String roleId);

	/**
	 * Get all role with LabelValue
	 * @return
	 */
	public List<LabelValue> getAllRoles();

}
