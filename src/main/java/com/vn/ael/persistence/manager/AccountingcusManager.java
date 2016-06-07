package com.vn.ael.persistence.manager;

import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Truckingservice;

public interface AccountingcusManager extends GenericManager<Accountingcus> {

	Accountingcus createFromDocsgeneral(Docsgeneral docsgeneral);

	void saveWholePackage(Accountingcus accountingcus);
	
}
