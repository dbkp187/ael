/**
 *
 */
package com.vn.ael.persistence.manager;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vn.ael.constants.AELConst;
import com.vn.ael.enums.ConfigurationType;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.repository.ConfigurationRepository;
import com.vn.ael.persistence.repository.CustomerRepository;
import com.vn.ael.persistence.repository.DocsgeneralRepository;
import com.vn.ael.persistence.repository.UserRepository;
import com.vn.ael.webapp.dto.DocsSelection;
import com.vn.ael.webapp.util.ConvertUtil;
import com.vn.ael.webapp.util.EntityUtil;

/**
 * @author liv1hc
 *
 */
@Transactional
@Service("configurationManager")
public class ConfigurationManagerImpl extends GenericManagerImpl<Configuration> implements ConfigurationManager{

    private ConfigurationRepository configurationRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private DocsgeneralRepository docsgeneralRepository;

    @Autowired
    public ConfigurationManagerImpl(final ConfigurationRepository configurationRepository) {
        this.configurationRepository = configurationRepository;
        this.repository = configurationRepository;
    }

	@Override
	public void saveConfig(Configuration configuration) {
		this.configurationRepository.save(configuration);
	}

	@Override
	public List<Configuration> getAllByType(ConfigurationType type, Boolean... enabled) {
		if (enabled.length == 0){
			//by default, just get enabled one
			return this.configurationRepository.findByType(type.getValue(),EntityUtil.CONFIGURATION_DEFAULT_SORTING);
		}else{
			return this.configurationRepository.findByTypeAndEnabled(type.getValue(),enabled[0],EntityUtil.CONFIGURATION_DEFAULT_SORTING);
		}
	}

	@Override
	public Map<Long, String> getSelectionsByType(ConfigurationType type, Boolean... enabled) {
		return ConvertUtil.fromConfigurationList2Map(this.getAllByType(type,enabled),type.isDisplayWithDes());
	}

	@Override
	public DocsSelection loadSelectionForDocsPage(ConfigurationType... configurationTypes) {
		// TODO Auto-generated method stub
		DocsSelection docsSelection = new DocsSelection();
		docsSelection.setSelections(this.createSelections(configurationTypes));
		 //load customer
		docsSelection.setCustomers(customerRepository.findAll());
        //load staff
		docsSelection.setStaff(userRepository.findAll());
		return docsSelection;
	}
	
	@Override
	public DocsSelection loadSelectionForDocsPage(boolean hasJobs,ConfigurationType... configurationTypes) {
		// TODO Auto-generated method stub
		DocsSelection docsSelection = this.loadSelectionForDocsPage(configurationTypes);
		//load docs
		if (hasJobs){
			docsSelection.getSelections().put(AELConst.SELECTION_DOCSGENERAL,ConvertUtil.fromDocsList2MapCusNativeNoCus(docsgeneralRepository.findAllNotForSelection()));
		}
		return docsSelection;
	}

	@Override
	public Map<String, Map<Long, String>> createSelections(ConfigurationType... configurationTypes) {
		Map<String, Map<Long, String>> mapMeta= new LinkedHashMap<>();
		for (ConfigurationType configurationType : configurationTypes){
			Map<Long, String> maps = this.getSelectionsByType(configurationType);
			mapMeta.put(configurationType.getKey(), maps);
		}
		return  mapMeta;
	}

}
