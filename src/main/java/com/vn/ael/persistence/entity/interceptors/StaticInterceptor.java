package com.vn.ael.persistence.entity.interceptors;

import java.io.Serializable;
import java.util.Iterator;

import org.hibernate.CallbackException;
import org.hibernate.EmptyInterceptor;
import org.hibernate.EntityMode;
import org.hibernate.Interceptor;
import org.hibernate.Transaction;
import org.hibernate.type.Type;

public class StaticInterceptor extends EmptyInterceptor{
	
	    private static Interceptor interceptor; 

	    public static void setInterceptor(Interceptor interceptor) {
	    	StaticInterceptor.interceptor = interceptor;
	    }

	    public void onDelete(
				Object entity, 
				Serializable id, 
				Object[] state, 
				String[] propertyNames, 
				Type[] types) {
	    	StaticInterceptor.interceptor.onDelete(entity, id, state, propertyNames, types);
	    }

		public boolean onFlushDirty(
				Object entity, 
				Serializable id, 
				Object[] currentState, 
				Object[] previousState, 
				String[] propertyNames, 
				Type[] types) {
			return StaticInterceptor.interceptor.onFlushDirty(entity, id, currentState, previousState, propertyNames, types);
		}

		public boolean onLoad(
				Object entity, 
				Serializable id, 
				Object[] state, 
				String[] propertyNames, 
				Type[] types) {
			return StaticInterceptor.interceptor.onLoad(entity, id, state, propertyNames, types);
		}

		public boolean onSave(
				Object entity, 
				Serializable id, 
				Object[] state, 
				String[] propertyNames, 
				Type[] types) {
			return StaticInterceptor.interceptor.onSave(entity, id, state, propertyNames, types);
		}

		public void postFlush(Iterator entities) {
			StaticInterceptor.interceptor.postFlush(entities);
		}
		public void preFlush(Iterator entities) {
			StaticInterceptor.interceptor.preFlush(entities);
		}

		public Boolean isTransient(Object entity) {
			return StaticInterceptor.interceptor.isTransient(entity);
		}

		public Object instantiate(String entityName, EntityMode entityMode, Serializable id) {
			return StaticInterceptor.interceptor.instantiate(entityName, entityMode, id);
		}

		public int[] findDirty(Object entity,
				Serializable id,
				Object[] currentState,
				Object[] previousState,
				String[] propertyNames,
				Type[] types) {
			return StaticInterceptor.interceptor.findDirty(entity, id, currentState, previousState, propertyNames, types);
		}

		public String getEntityName(Object object) {
			return StaticInterceptor.interceptor.getEntityName(object);
		}

		public Object getEntity(String entityName, Serializable id) {
			return StaticInterceptor.interceptor.getEntity(entityName, id);
		}

		public void afterTransactionBegin(Transaction tx) {
			StaticInterceptor.interceptor.afterTransactionBegin(tx);
		}
		public void afterTransactionCompletion(Transaction tx) {
			StaticInterceptor.interceptor.afterTransactionCompletion(tx);
		}
		public void beforeTransactionCompletion(Transaction tx) {
			StaticInterceptor.interceptor.beforeTransactionCompletion(tx);
		}

		public String onPrepareStatement(String sql) {
			return StaticInterceptor.interceptor.onPrepareStatement(sql);
		}

		public void onCollectionRemove(Object collection, Serializable key) throws CallbackException {
			StaticInterceptor.interceptor.onCollectionRemove(collection, key);
		}

		public void onCollectionRecreate(Object collection, Serializable key) throws CallbackException {
			StaticInterceptor.interceptor.onCollectionRecreate(collection, key);
		}

		public void onCollectionUpdate(Object collection, Serializable key) throws CallbackException {
			StaticInterceptor.interceptor.onCollectionUpdate(collection, key);
		}

}
