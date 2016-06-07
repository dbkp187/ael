package com.vn.ael.persistence.entity.interceptors;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.tuple.Pair;
import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class EntityChangeInterceptor extends EmptyInterceptor {

	@PostConstruct
	public void init() {
		StaticInterceptor.setInterceptor(this);
	}

	private int updates;

	@Override
	public boolean onFlushDirty(Object entity, Serializable id,
			Object[] currentState, Object[] previousState,
			String[] propertyNames, Type[] types) {
		Map<String, Pair<Object,Object>> trackingChanges = new LinkedHashMap<>(); 
//		boolean report = false;
//		for (int i = 0; i < currentState.length; i++) {
//			if (currentState[i] == null) {
//				if (previousState[i] != null) {
//					report = true;
//				}
//			} else if (!currentState[i].equals(previousState[i])) {
//				report = true;
//			}
//
//			if (report) {
//				trackingChanges.put(propertyNames[i], Pair.of(previousState[i], currentState[i]));
//				report = false;
//			}
//		}
		return false;
	}

}
