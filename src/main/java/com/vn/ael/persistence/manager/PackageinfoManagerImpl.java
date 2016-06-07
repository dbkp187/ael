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
import com.vn.ael.persistence.entity.Packageinfo;
import com.vn.ael.persistence.repository.ContsealRepository;
import com.vn.ael.persistence.repository.CustomerRepository;
import com.vn.ael.persistence.repository.DocserviceRepository;
import com.vn.ael.persistence.repository.DocsgeneralRepository;
import com.vn.ael.persistence.repository.ExfeetableRepository;
import com.vn.ael.persistence.repository.PackageinfoRepository;
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
public class PackageinfoManagerImpl extends GenericManagerImpl<Packageinfo> implements PackageinfoManager{

    private PackageinfoRepository packageinfoRepository;
    
    @Autowired
    private DocsgeneralRepository docsgeneralRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private ContsealRepository contsealRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private DocserviceRepository docserviceRepository;
    
    @Autowired
    private ExfeetableRepository exfeetableRepository;

    @Autowired
    public PackageinfoManagerImpl(final PackageinfoRepository packageinfoRepository) {
        this.packageinfoRepository = packageinfoRepository;
        this.repository = packageinfoRepository;
    }

	@Override
	public Packageinfo saveWholePackage(Packageinfo packageinfo) {
		//wire staff
		packageinfo.getDocsgeneral().setCustomer(customerRepository.findOne(packageinfo.getDocsgeneral().getCustomer().getId()));
		packageinfo.getDocsgeneral().setProcessingStaff(userRepository.findOne(packageinfo.getDocsgeneral().getProcessingStaff().getId()));
		this.updateJobNo(packageinfo);
		packageinfo.getDocsgeneral().setTypeOfDocs(ServicesType.DVTQ);
		packageinfo.getDocsgeneral().setPackageinfo(packageinfo);
		EntityUtil.wiredChildOfDocsGeneral(packageinfo.getDocsgeneral());
		Docsgeneral docsgeneral = docsgeneralRepository.save(packageinfo.getDocsgeneral());
		return docsgeneral.getPackageinfo();
		
	}
	
	/**
	 * Update Jobno 
	 * @param packageinfo
	 */
	private void updateJobNo(Packageinfo packageinfo){
		if (packageinfo.getId() == null || !packageinfo.getDocsgeneral().getJobNo().startsWith(packageinfo.getDocsgeneral().getCustomer().getCode())){
			Integer currentYear = CommonUtil.getCurrentYearYYYY();
			if (packageinfo.getId() == null){
				//Integer counting = packageinfoRepository.findMaxCountingByCustomer(packageinfo.getDocsgeneral().getCustomer().getId());
				Integer counting = packageinfoRepository.findMaxCountingByCustomerAndYear(packageinfo.getDocsgeneral().getCustomer().getId(), currentYear);
				if (counting == null ){
					counting = AELConst.START_COUNT_JOB_ID;
				}
				packageinfo.setCounting(counting+1);
			}
			String jobNo = packageinfo.getDocsgeneral().getCustomer().getCode()+ServicesType.DVTQ.getLabel()+CommonUtil.addZero(packageinfo.getCounting(), CommonUtil.LENGTH_OF_COUNTER);
			if (currentYear > 2015) {
				 jobNo = packageinfo.getDocsgeneral().getCustomer().getCode()+ServicesType.DVTQ.getLabel() 
						 + currentYear%1000 + "-" + CommonUtil.addZero(packageinfo.getCounting(), CommonUtil.LENGTH_OF_COUNTER);
			}
			packageinfo.getDocsgeneral().setJobNo(jobNo);
		}
		
	}

	@Override
	public void deleteWholePackage(Packageinfo packageinfo) {
		docsgeneralRepository.delete(packageinfo.getDocsgeneral());
	}

	@Override
	public List<Packageinfo> searchPackageInfo(Search search) {
		return packageinfoRepository.searchPackageInfo(search.getCustomer(),
				search.getTypeOfImport(), search.getTypeOfContainer(),
				search.getJobNo(), search.getCusDecOnNo(),
				search.getDoDelivery(), search.getDoRelease(),
				search.getStartDate(), search.getEndDate());
	}

	@Override
	public List<String> findAllShipper() {
		return packageinfoRepository.findShipper();
	}

	@Override
	public List<String> findAllConsignee() {
		return packageinfoRepository.findConsignee();
	}

}
