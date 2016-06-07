package com.vn.ael.persistence.manager;

import java.util.List;

public interface GenericManager<T> {
	
	 /**
     * Get all objects
     */
    public List<T> getAll();

    /**
     * Get object by id
     */
    public T get(Long id);

    /**
     * Does object with @id exist
     */
    public boolean exists(Long id);

    /**
     * Save object
     */
    public T save(T object);

    /**
     * Remove object
     */
    public void remove(T object);

    /**
     * Remove object by id
     */
    public void remove(Long id);
    
    /**
     * Find object by id in String
     * @param id
     */
    public T find(String id);

}
