package com.vn.ael.persistence.manager;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.appfuse.model.User;

import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.webapp.dto.Search;

public interface AdvanceFormManager extends GenericManager<Advanceform> {

	void updateChilds(Advanceform advanceform);

	Advanceform saveWholePackage(Advanceform advanceform);
	
	List<Advanceform> findByEmpoyee(User employee, boolean getAllAbility);

	List<Advanceform> searchAdvanceForm(Search search);
	
	BigDecimal calculateRemainAdvance(Long jobId, Long userId, Date advanceDate, Long... formId);
	
	List<Advanceform> searchAdvanceFormBefore(Search search);
	
	User getUserById(long Id);
	
	List<Advanceform> findByEmpoyeeForAccounting(Long employeeId, Boolean doApproval);
	
	List<Advanceform> findByMoneyBook(Long moneyBook);
	
	List<Advanceform> findAll();
	
	/*void updateAdvanceForm(Advanceform advanceform);*/
}
