package com.vn.ael.persistence.manager;

import java.util.List;

import com.vn.ael.enums.NhathauType;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Nhathau;
import com.vn.ael.persistence.entity.Packageinfo;

public interface NhathauManager extends GenericManager<Nhathau> {
	
	List<Nhathau> findByType(NhathauType type);

}
