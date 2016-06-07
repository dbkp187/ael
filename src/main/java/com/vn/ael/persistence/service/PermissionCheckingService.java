package com.vn.ael.persistence.service;

import org.appfuse.model.User;

public interface PermissionCheckingService {
	
	boolean couldViewUserAdvance(User currentUser);
	

}
