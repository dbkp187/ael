package com.vn.ael.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.ael.constants.URLReference;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.manager.AttachmentManager;
import com.vn.ael.persistence.manager.OfferItemManager;
import com.vn.ael.persistence.manager.OfferPriceManager;

@Controller
public class OfferPriceListController extends BaseFormController {

    private OfferPriceManager offerpriceManager;
    
    private AttachmentManager attachmentManager;

    @Autowired
    public void setOfferpriceManager(final OfferPriceManager offerpriceManager) {
        this.offerpriceManager = offerpriceManager;
    }
    
    @Autowired
    public void setAttachmentManager(final AttachmentManager attachmentManager) {
        this.attachmentManager = attachmentManager;
    }
    
    
    private OfferItemManager offerItemManager = null;
	 
    @Autowired
    public void setOfferItemManager(final OfferItemManager offerItemManager) {
        this.offerItemManager = offerItemManager;
    }

    public OfferPriceListController() {
        setCancelView("redirect:"+URLReference.HOME_PAGE);
        setSuccessView("redirect:"+URLReference.OFFERPRICE_LIST);
    }

    @Override
    @InitBinder
    protected void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) {
        super.initBinder(request, binder);
        binder.setDisallowedFields("password", "confirmPassword");
    }
    
    @RequestMapping(method = RequestMethod.GET, value=URLReference.OFFERPRICE_LIST)
    public ModelAndView handleRequest() throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute(offerpriceManager.getAll());
        return new ModelAndView(URLReference.OFFERPRICE_LIST, model.asMap());
    }
    
    @RequestMapping(value=URLReference.OFFERPRICE_LIST+"/list*", method = RequestMethod.POST)
    @ResponseBody
    public List<OfferPrice> getList(HttpServletRequest request){
    	String customerId = request.getParameter("customerId");
    	if (customerId != null){
    		return offerpriceManager.findWithCustomerId(customerId);
    	}
    	return new ArrayList<OfferPrice>();
    }
    
    @RequestMapping(value=URLReference.OFFERITEM_LIST+"/list*", method = RequestMethod.POST)
    @ResponseBody
    public List<OfferItem> getListItems(HttpServletRequest request){
    	String offerPriceId = request.getParameter("offerId");
    	if (offerPriceId != null){
    		return offerItemManager.findWithOfferPriceId(offerPriceId);
    	}
    	return new ArrayList<OfferItem>();
    }
    
    @RequestMapping(value=URLReference.OFFERPRICE_ATTACHMENT_LIST+"*", method = RequestMethod.POST)
    @ResponseBody
    public List<Attachment> getListItemsFiles(HttpServletRequest request){
    	String offerPriceId = request.getParameter("offerId");
    	if (offerPriceId != null){
    		return attachmentManager.findWithOfferPriceId(offerPriceId);
    	}
    	return new ArrayList<Attachment>();
    }
}

