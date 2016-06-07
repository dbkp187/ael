/**
 *
 */
package com.vn.ael.persistence.manager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.appfuse.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.repository.AdvanceFormRepository;
import com.vn.ael.persistence.repository.AdvancedetailRepository;
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
public class AdvanceFormManagerImpl extends GenericManagerImpl<Advanceform> implements AdvanceFormManager{

    private AdvanceFormRepository advanceFormRepository;
    
    @Autowired
    private AdvancedetailRepository advancedetailRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RefunddetailRepository refundDetailRepository;
    
    @Autowired
    public AdvanceFormManagerImpl(final AdvanceFormRepository advanceFormRepository) {
        this.advanceFormRepository = advanceFormRepository;
        this.repository = advanceFormRepository;
    }

	@Override
	public void updateChilds(Advanceform advanceform) {
		if (advanceform != null && advanceform.getId() != null) {
			advanceform.setAdvancedetails(advancedetailRepository.findByAdvanceform(advanceform));
		}

		if (advanceform.getAdvancedetails() == null
				|| advanceform.getAdvancedetails().isEmpty()) {
			List<Advancedetail> items = new ArrayList<>();
			Advancedetail advancedetail = new Advancedetail();
			advancedetail.setIsAdded(true);
			items.add(advancedetail);
			advanceform.setAdvancedetails(items);
		}	
	}

	@Override
	public Advanceform saveWholePackage(Advanceform advanceform) {
		this.checkToDeleteChilds(advanceform);
		advanceform.setEmployee(userRepository.getOne(advanceform.getEmployee().getId()));
		EntityUtil.wireChildOfAdvanceform(advanceform);
		return advanceFormRepository.save(advanceform);
	}

	/**
	 * Check to delete childs
	 * @param advanceform
	 */
	private void checkToDeleteChilds(Advanceform advanceform) {
		if (advanceform.getAdvancedetails() != null){
			List<Advancedetail> items = new ArrayList<>();
			for (Advancedetail advancedetail: advanceform.getAdvancedetails()){
				if (advancedetail.getIsDeleted() != null && advancedetail.getIsDeleted() == true){
					advancedetailRepository.delete(advancedetail);
				}else{
					items.add(advancedetail);
				}
			}
			advanceform.setAdvancedetails(items);
		}
	}

	@Override
	public List<Advanceform> findByEmpoyee(User employee, boolean getAllAbility) {
		if(EntityUtil.isAdminOrAccountRole(employee) && getAllAbility){
			return this.advanceFormRepository.findAll();
		}
		return this.advanceFormRepository.findByEmployee(employee);
	}

	@Override
	public List<Advanceform> searchAdvanceForm(Search search) {
		if(search.getJob() != null && !search.getJob().isEmpty()){
			return advanceFormRepository.searchAdvanceForm(search.getEmployee(),
					search.getStartDate(), search.getEndDate(),
					search.getStartTimeRefund(), search.getEndTimeRefund(),
					search.getDoApproval(), search.getJob());
		}
		return advanceFormRepository.searchAdvanceFormAll(search.getEmployee(),
				search.getStartDate(), search.getEndDate(),
				search.getStartTimeRefund(), search.getEndTimeRefund(),
				search.getDoApproval());
		
	}

	@Override
	public BigDecimal calculateRemainAdvance(Long jobId, Long userId, Date advanceDate, Long... formId) {
		Long b1 = formId.length > 0 ? formId[0] : -99;
		// TODO Auto-generated method stub
		BigDecimal result = BigDecimal.ZERO;
		List<Advancedetail> listAdvanceByJobNo = new ArrayList<Advancedetail>();
		List<Refunddetail> listRefundByJobNo = new ArrayList<Refunddetail>();
		try {
			listAdvanceByJobNo.addAll(this.advancedetailRepository.findByJobId(jobId));
		} catch (Exception e) {
			// TODO: handle exception
			log.error("FAILED TO GET ADVANCE DETAIL BY JOB NO");
		}
		try {
			listRefundByJobNo.addAll(this.refundDetailRepository.findByJobId(jobId));
		} catch (Exception e) {
			// TODO: handle exception
			log.error("FAILED TO GET REFUND DETAIL BY JOB NO");
		}
		if (!listAdvanceByJobNo.isEmpty()) {
			for (Advancedetail advancedetail : listAdvanceByJobNo) {
				if (advancedetail.getAdvanceform()!=null) {
					if (advancedetail.getAdvanceform().getId()!=b1 && advancedetail.getAdvanceform().getDoApproval() && advancedetail.getAdvanceform().getEmployee().getId().equals(userId) && (advancedetail.getAdvanceform().getDate().before(advanceDate)||advancedetail.getAdvanceform().getDate().equals(advanceDate))) {
						result=result.add(advancedetail.getAmount());
					}
				}
			}
		}
		if (!listRefundByJobNo.isEmpty()) {
			for (Refunddetail refundDetail : listRefundByJobNo){
				if (refundDetail.getRefund()!=null) {
					if (refundDetail.getRefund().getDoApproval() && refundDetail.getRefund().getEmployee().getId().equals(userId) &&(refundDetail.getRefund().getDate().before(advanceDate)||refundDetail.getRefund().getDate().equals(advanceDate))) {
						result=result.subtract(refundDetail.getAmount());
						result=result.subtract(refundDetail.getOAmount());
					}
				}
			}
		}
		return result;
	}

	@Override
	public List<Advanceform> searchAdvanceFormBefore(Search search) {
				
		return null;
	}

	@Override
	public User getUserById(long Id) {
		// TODO Auto-generated method stub
		return userRepository.findByUserid(Id);
	}

	@Override
	public List<Advanceform> findByEmpoyeeForAccounting(Long employeeId, Boolean doApproval) {
		return this.advanceFormRepository.findByEmployeeAndDoApproval(employeeId, doApproval);
	}

	@Override
	public List<Advanceform> findByMoneyBook(Long moneyBook) {
		return this.advanceFormRepository.findByMoneyBook(moneyBook);
	}

	@Override
	public List<Advanceform> findAll() {
		return this.advanceFormRepository.findAll();
	}
}
