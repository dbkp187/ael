/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.ArrayList;
import java.util.List;

import org.appfuse.model.LabelValue;
import org.appfuse.model.Role;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.vn.ael.persistence.repository.RoleRepository;

/**
 * @author liv1hc
 *
 */
@Service("roleManager")
public class RoleManagerImpl extends GenericManagerImpl<Role> implements RoleManager{

    private RoleRepository roleRepository;

    public RoleManagerImpl()
    {

    }
    
    @Autowired
    public RoleManagerImpl(final RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
        this.repository = roleRepository;
    }

    /**
     * {@inheritDoc}
     */
    @Cacheable("getRoles")
    @Cache(usage= CacheConcurrencyStrategy.READ_ONLY)
    public List<Role> getRoles() {
        return this.repository.findAll();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable("getRole")
    @Cache(usage= CacheConcurrencyStrategy.READ_ONLY)
    public Role getRole(final String rolename) {
        return this.roleRepository.findByName(rolename);
    }

    /**
     * {@inheritDoc}
     */
    public Role saveRole(final Role role) {
        return this.repository.save(role);
    }

    /**
     * {@inheritDoc}
     */
    @Modifying
    @Override
    public void removeRole(final String rolename) {
        this.roleRepository.deleteByName(rolename);
    }
    
	@Override
	public Role getByIdRole(String roleId) {
		return this.repository.findOne(new Long(roleId));
	}
	
	@Override
	public void removeRoleById(String roleId) {
		this.remove(new Long(roleId));
	}

	@Override
	public List<LabelValue> getAllRoles() {
		List<Role> roles = this.getRoles();
		List<LabelValue> list = new ArrayList<LabelValue>();
	    for (Role role1 : roles) {
	            list.add(new LabelValue(role1.getName(), role1.getName()));
	        }
	        return list;
	}
}
