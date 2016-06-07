/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.AELConst;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Inland;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.CustomerRepository;
import com.vn.ael.persistence.repository.DocsgeneralRepository;
import com.vn.ael.persistence.repository.InlandRepository;
import com.vn.ael.persistence.repository.InlandsizeRepository;
import com.vn.ael.persistence.repository.MultitypeRepository;
import com.vn.ael.persistence.repository.UserRepository;
import com.vn.ael.webapp.dto.Search;
import com.vn.ael.webapp.util.EntityUtil;
import com.vn.ael.webapp.util.CommonUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service
public class InlandManagerImpl extends GenericManagerImpl<Inland> implements InlandManager{

    private InlandRepository inlandRepository;
    
    @Autowired
    private InlandsizeRepository inlandsizeRepository;
    
    @Autowired
    private DocsgeneralRepository docsgeneralRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private ContsealRepository contsealRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private MultitypeRepository multitypeRepository;

    @Autowired
    public InlandManagerImpl(final InlandRepository inlandRepository) {
        this.inlandRepository = inlandRepository;
        this.repository = inlandRepository;
    }

	@Override
	public void removeWholeInland(Inland inland) {
		docsgeneralRepository.delete(inland.getDocsgeneral().getId());
	}

	@Override
	public Inland saveWholeInland(Inland inland) {
		//wire staff
		inland.getDocsgeneral().setCustomer(customerRepository.findOne(inland.getDocsgeneral().getCustomer().getId()));
		inland.getDocsgeneral().setProcessingStaff(userRepository.findOne(inland.getDocsgeneral().getProcessingStaff().getId()));
		this.updateJobNo(inland);
		if (inland.getIsInland() == null || inland.getIsInland()){
			inland.getDocsgeneral().setTypeOfDocs(ServicesType.DVVT_INLAND);
		}else{
			inland.getDocsgeneral().setTypeOfDocs(ServicesType.DVVT_SEALAND);
		}
		
		inland.getDocsgeneral().setInland(inland);
		EntityUtil.wiredChildOfDocsGeneral(inland.getDocsgeneral());
		Docsgeneral docsgeneral =  docsgeneralRepository.save(inland.getDocsgeneral());
		return docsgeneral.getInland();
	}
	
	/**
	 * Update Jobno 
	 * @param packageinfo
	 */
	private void updateJobNo(Inland inland){
		if (inland.getId() == null || !inland.getDocsgeneral().getJobNo().startsWith(inland.getDocsgeneral().getCustomer().getCode())){
			Integer currentYear = CommonUtil.getCurrentYearYYYY();
			if (inland.getId() == null){
				//Integer counting = inlandRepository.findMaxCountingByCustomer(inland.getDocsgeneral().getCustomer().getId());
				Integer counting = inlandRepository.findMaxCountingByCustomerAndYear(inland.getDocsgeneral().getCustomer().getId(), currentYear);
				if (counting == null ){
					counting = AELConst.START_COUNT_JOB_ID;
				}
				inland.setCounting(counting+1);
			}
			String jobNo = inland.getDocsgeneral().getCustomer().getCode()+ServicesType.DVVT.getLabel()+CommonUtil.addZero(inland.getCounting(), CommonUtil.LENGTH_OF_COUNTER);
			if (currentYear > 2015) {
				jobNo = inland.getDocsgeneral().getCustomer().getCode()+ServicesType.DVVT.getLabel()+ currentYear%1000 + "-" + CommonUtil.addZero(inland.getCounting(), CommonUtil.LENGTH_OF_COUNTER);
			}
			inland.getDocsgeneral().setJobNo(jobNo);
		}
		
	}

	@Override
	public List<Inland> searchInland(Search search) {
		List<Inland> list = null;
		try {
			list = inlandRepository.searchInland(search.getCustomer(), search.getTypeOfContainer(), search.getDoDelivery(), search.getStartDate(), search.getEndDate(), search.getJobNo());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
