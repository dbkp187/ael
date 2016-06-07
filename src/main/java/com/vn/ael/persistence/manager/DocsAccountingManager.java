package com.vn.ael.persistence.manager;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.vn.ael.persistence.entity.DocsAccounting;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.TruckAccounting;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.webapp.dto.AccountingCollectMoneyCondition;
import com.vn.ael.webapp.dto.AccountingContractorPaymentCondition;
import com.vn.ael.webapp.dto.AccountingTransportExport;

public interface DocsAccountingManager extends GenericManager<DocsAccounting> {

	void updateAccounting(Docsgeneral docsgeneral, BigDecimal phiAel, BigDecimal phiChiHo);
	void updateAccounting(List<AccountingTransportExport> list);
	
	void updateCollectMoneyStatus(Map<Long, DocsAccounting> accountingMap);
	void updatePayMoneyStatus(Map<Long, TruckAccounting> accountingMap);
	
	List<Docsgeneral> searchDebit(AccountingCollectMoneyCondition search);
	List<Truckingdetail> searchDocsTruckingFee(AccountingContractorPaymentCondition search);
	
	void updateTruckAccounting(Truckingdetail docsgeneral, BigDecimal phiAel, BigDecimal phiChiHo);
	void revertDocsAccounting(Docsgeneral docsgeneral, BigDecimal phiAelRevert, BigDecimal phiChiHoRevert);
	void revertTruckAccounting(Truckingdetail truckingdetail, BigDecimal phiAelRevert, BigDecimal phiChiHoRevert);
}
