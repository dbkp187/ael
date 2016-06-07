package com.vn.ael.persistence.manager;

import java.util.List;

import org.appfuse.model.User;

import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.webapp.dto.Search;

public interface RefundManager extends GenericManager<Refund> {

	void updateChilds(Refund refund);

	Refund saveWholePackage(Refund refund);
	
	Refund saveRefund(Refund refund);
	
	List<Refund> findByEmpoyee(User employee, boolean getAllAbility);
	
	List<Refund> searchRefund(Search search);

	List<Refund> findByEmpoyeeForAccounting(Long employeeId, Boolean doApproval);
	
	List<Refund> findAllPhieuThu();
	
	List<Refund> findAllThanhtoan();

	List<Refund> searchPhieuThu(Search search);
	
	List<Refund> searchFeeRefund(Search search);
	
	List<Refund> findByDoApproval(Boolean doApproval);
	
	List<Refund> findByMoneyBook(Long moneyBook);
}
