/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.ArrayList;
import java.util.List;

import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.RefundRepository;
import com.vn.ael.persistence.repository.RefunddetailRepository;
import com.vn.ael.persistence.repository.UserRepository;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.EntityUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class RefundManagerImpl extends GenericManagerImpl<Refund> implements RefundManager{

    private RefundRepository refundRepository;
    
    @Autowired
    private RefunddetailRepository refunddetailRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private ExfeetableRepository exfeetableRepository;
    
    @Autowired
    public RefundManagerImpl(final RefundRepository refundRepository) {
        this.refundRepository = refundRepository;
        this.repository = refundRepository;
    }

	@Override
	public void updateChilds(Refund refund) {
		if (refund != null && refund.getId() != null) {
			refund.setRefunddetails(refunddetailRepository.findByRefund(refund));
			refund.setExfeetables(exfeetableRepository.findByRefund(refund));
		}

		if (refund.getRefunddetails() == null
				|| refund.getRefunddetails().isEmpty()) {
			List<Refunddetail> items = new ArrayList<>();
			Refunddetail refunddetail = new Refunddetail();
			refunddetail.setIsAdded(true);
			items.add(refunddetail);
			refund.setRefunddetails(items);
		}	
		
		if (refund.getExfeetables() == null || refund.getExfeetables().isEmpty()){
			List<Exfeetable> exfeetables = new ArrayList<>();
			Exfeetable exfeetable = new Exfeetable();
			exfeetable.setIsAdded(true);
			exfeetables.add(exfeetable);
			refund.setExfeetables(exfeetables);
		}
	}

	@Override
	public Refund saveWholePackage(Refund refund) {
		this.checkToDeleteChilds(refund);
		refund.setEmployee(userRepository.getOne(refund.getEmployee().getId()));
		EntityUtil.wireChildOfRefund(refund);
		return refundRepository.save(refund);
	}
	
	@Override
	public Refund saveRefund(Refund refund) {
		List<Exfeetable> exfeetables = new ArrayList<>();
		if(refund.getExfeetables() != null && !refund.getExfeetables().isEmpty()){
			for(Exfeetable exfeetable : refund.getExfeetables()){
				if(exfeetable.getIsAdded() == null || !exfeetable.getIsAdded()){
					exfeetable.setRefund(refund);
					exfeetables.add(exfeetable);
				}
			}
			refund.setExfeetables(exfeetables);
		}
		return refundRepository.save(refund);
	}
	/**
	 * Check to delete childs
	 * @param advanceform
	 */
	private void checkToDeleteChilds(Refund refund) {
		if (refund.getRefunddetails() != null){
			List<Refunddetail> items = new ArrayList<>();
			for (Refunddetail refunddetail: refund.getRefunddetails()){
				if (refunddetail.getIsDeleted() != null && refunddetail.getIsDeleted() == true){
					refunddetailRepository.delete(refunddetail);
				}else{
					items.add(refunddetail);
				}
			}
			refund.setRefunddetails(items);
		}
		
		if (refund.getExfeetables() != null){
			List<Exfeetable> items = new ArrayList<>();
			for (Exfeetable exfeetable: refund.getExfeetables()){
				if (exfeetable.getIsDeleted() != null && exfeetable.getIsDeleted() == true){
					exfeetableRepository.delete(exfeetable);
				}else{
					items.add(exfeetable);
				}
			}
			refund.setExfeetables(items);
		}
	}

	@Override
	public List<Refund> findByEmpoyee(User employee, boolean getAllAbility) {
		if(EntityUtil.isAdminOrAccountRole(employee) && getAllAbility){
			return this.refundRepository.findAllThanhToan();
		}
		return this.refundRepository.findAllThanhToanEmployee(employee.getId());
	}

	@Override
	public List<Refund> searchRefund(Search search) {
		if(search.getJob() != null && !search.getJob().isEmpty()){
			return this.refundRepository.searchRefund(search.getEmployee(), search.getStartDate(), search.getEndDate(), search.getDoApproval(), search.getJob());
		}
		return this.refundRepository.searchRefundAll(search.getEmployee(), search.getStartDate(), search.getEndDate(), search.getDoApproval());
	}

	@Override
	public List<Refund> findByEmpoyeeForAccounting(Long employeeId, Boolean doApproval) {
		return this.refundRepository.findPhieuThuByEmployeeAndDoApproval(employeeId);

	}

	@Override
	public List<Refund> findAllPhieuThu() {
		return this.refundRepository.findAllPhieuThu();
	}
	
	@Override
	public List<Refund> searchPhieuThu(Search search) {
		return this.refundRepository.searchPhieuThu(search.getEmployee(), search.getStartDate(), search.getEndDate(), search.getDoApproval());
	}

	@Override
	public List<Refund> findAllThanhtoan() {
		return this.refundRepository.findAllThanhToan();
	}

	@Override
	public List<Refund> searchFeeRefund(Search search) {
		return this.refundRepository.searchFeeRefundAdmin(search.getEmployee(), search.getStartPayDate(), search.getEndPayDate(),  true, search.getCheckByAdmin(), search.getApproved());
	}

	@Override
	public List<Refund> findByDoApproval(Boolean doApproval) {
		return this.refundRepository.findByDoApproval(doApproval);
	}

	@Override
	public List<Refund> findByMoneyBook(Long moneyBook) {
		return this.refundRepository.findByMoneyBook(moneyBook);
	}
}
