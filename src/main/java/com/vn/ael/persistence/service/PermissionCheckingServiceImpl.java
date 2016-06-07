package com.vn.ael.persistence.service;

import org.appfuse.model.Role;
import org.appfuse.model.User;
import org.springframework.stereotype.Service;

import com.vn.ael.constants.RoleMapping;

@Service
public class PermissionCheckingServiceImpl implements PermissionCheckingService{

	@Override
	public boolean couldViewUserAdvance(User currentUser) {
		if (currentUser.getRoles() != null && !currentUser.getRoles().isEmpty()){
			for (Role role : currentUser.getRoles()){
				if (role.getName().equalsIgnoreCase(RoleMapping.ACCOUNTING) || role.getName().equalsIgnoreCase(RoleMapping.ADMIN)){
					return true;
				}
			}
		}
		return false;
	}

}
