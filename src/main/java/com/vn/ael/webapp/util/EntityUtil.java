package com.vn.ael.webapp.util;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.appfuse.model.Role;
import org.appfuse.model.User;
import org.springframework.data.domain.Sort;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.RoleMapping;
import com.vn.ael.constants.TypeOfContainer;
import com.vn.ael.persistence.entity.Accountingcus;
import com.vn.ael.persistence.entity.Accountingcusdetail;
import com.vn.ael.persistence.entity.Advancedetail;
import com.vn.ael.persistence.entity.Advanceform;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Contseal;
import com.vn.ael.persistence.entity.Docservice;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Extendfeeacc;
import com.vn.ael.persistence.entity.Inlandsize;
import com.vn.ael.persistence.entity.Multitype;
import com.vn.ael.persistence.entity.Nhathau;
import com.vn.ael.persistence.entity.OfferItem;
import com.vn.ael.persistence.entity.OfferPrice;
import com.vn.ael.persistence.entity.Refund;
import com.vn.ael.persistence.entity.Refunddetail;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.persistence.entity.Truckingservice;
import com.vn.ael.webapp.dto.ContsealSelections;

public class EntityUtil {
	
	public static Sort EXFEETABLE_DEFAULT_SORTING = new Sort(Sort.Direction.ASC, "masterFee", "id");
	
	public static Sort CONFIGURATION_DEFAULT_SORTING = new Sort(Sort.Direction.ASC, "type", "value", "id");
	
	public static Sort TRUCKING_DETAIL_CONTSEAL_SORTING = new Sort(Sort.Direction.ASC, "consteal", "nhathau", "id");
	
	public static Sort NHATHAU_DEFAULT_SORTING = new Sort(Sort.Direction.ASC, "name", "code", "id");
	
	/**
	 * Wired all childs of Docsgeneral
	 * @param docsgeneral
	 */
	public static void wiredChildOfDocsGeneral(Docsgeneral docsgeneral){
		List<Contseal> conts = new ArrayList<>();
		if (docsgeneral.getContseals() != null && !docsgeneral.getContseals().isEmpty()){
			for (Contseal contseal: docsgeneral.getContseals()){
				if (contseal.getIsAdded() == null || !contseal.getIsAdded()){
					contseal.setDocsgeneral(docsgeneral);
					conts.add(contseal);
				}
			}
			docsgeneral.setContseals(conts);
		}
		
		List<Docservice> docservices = new ArrayList<>();
		if (docsgeneral.getDocservices() != null && !docsgeneral.getDocservices().isEmpty()){
			for (Docservice docservice: docsgeneral.getDocservices()){
				if (docservice.getIsAdded() == null || !docservice.getIsAdded()){
					docservice.setDocsgeneral(docsgeneral);
					docservices.add(docservice);
				}
			}
			docsgeneral.setDocservices(docservices);
		}
		
		List<Exfeetable> exfeetables = new ArrayList<>();
		if (docsgeneral.getExfeetables() != null && !docsgeneral.getExfeetables().isEmpty()){
			for (Exfeetable exfeetable: docsgeneral.getExfeetables()){
				if ((exfeetable.getIsAdded() == null || !exfeetable.getIsAdded()) &&( exfeetable.getApproved() == null || !exfeetable.getApproved())){
					exfeetable.setDocsgeneral(docsgeneral);
					exfeetables.add(exfeetable);
				}
			}
			docsgeneral.setExfeetables(exfeetables);
		}
		
		List<Inlandsize> inlandsizes = new ArrayList<>();
		if (docsgeneral.getInlandsizes() != null && !docsgeneral.getInlandsizes().isEmpty()){
			for (Inlandsize inlandsize: docsgeneral.getInlandsizes()){
				if (inlandsize.getIsAdded() == null || !inlandsize.getIsAdded()){
					inlandsize.setDocsgeneral(docsgeneral);
					inlandsizes.add(inlandsize);
				}
			}
			docsgeneral.setInlandsizes(inlandsizes);
		}
		
		List<Multitype> multitypes = new ArrayList<>();
		if (docsgeneral.getContTypes() != null && !docsgeneral.getContTypes().isEmpty()){
			for (Multitype multitype: docsgeneral.getContTypes()){
				if (multitype.getIsAdded() == null || !multitype.getIsAdded()){
					multitype.setDocsgeneral(docsgeneral);
					multitypes.add(multitype);
				}
			}
			docsgeneral.setContTypes(multitypes);
		}
		
		List<Attachment> attachments = new ArrayList<>();
		if (docsgeneral.getAttachments() != null && !docsgeneral.getAttachments().isEmpty()){
			for (Attachment attachment: docsgeneral.getAttachments()){
				if (attachment.getIsAdded() == null || !attachment.getIsAdded()){
					attachment.setDocsgeneral(docsgeneral);
					attachments.add(attachment);
				}
			}
			docsgeneral.setAttachments(attachments);
		}
		
	}
	
	/**
	 * Attach child of offer price
	 * @param offerPrice
	 */
	public static void wireChildOfOfferPrice(OfferPrice offerPrice){
		List<OfferItem> items = new ArrayList<>();
		if (offerPrice.getOfferItems() != null && !offerPrice.getOfferItems().isEmpty()){
			for (OfferItem item: offerPrice.getOfferItems()){
				if (item.getIsAdded() == null || !item.getIsAdded()){
					item.setOfferPrice(offerPrice);
					items.add(item);
				}
			}
			offerPrice.setOfferItems(items);
		}
		
		List<Attachment> attachments = new ArrayList<>();
		if (offerPrice.getAttachments() != null && !offerPrice.getAttachments().isEmpty()){
			for (Attachment attachment: offerPrice.getAttachments()){
				if (attachment.getIsAdded() == null || !attachment.getIsAdded()){
					attachment.setOfferPrice(offerPrice);
					attachments.add(attachment);
				}
			}
			offerPrice.setAttachments(attachments);
		}
	}

	/**
	 * Wired truckingdetails for trucking service
	 * @param truckingservice
	 */
	public static void wiredChildOfTruckingService(
			Truckingservice truckingservice) {
		List<Truckingdetail> items = new ArrayList<>();
		if (truckingservice.getTruckingdetails() != null && !truckingservice.getTruckingdetails().isEmpty()){
			for (Truckingdetail item: truckingservice.getTruckingdetails()){
				if (item.getIsAdded() == null || !item.getIsAdded()){
					item.setTruckingservice(truckingservice);
					items.add(item);
					wireChildOfTruckingdetail(item);
				}
			}
			truckingservice.setTruckingdetails(items);
		}
	}
	
	/**
	 * Wire info 
	 * @param truckingdetail
	 */
	public static void wireChildOfTruckingdetail(Truckingdetail truckingdetail){
		List<Exfeetable> items = new ArrayList<>();
		if (truckingdetail.getExfeetables() != null && !truckingdetail.getExfeetables().isEmpty()){
			for (Exfeetable exfeetable: truckingdetail.getExfeetables()){
				if (exfeetable.getIsAdded() == null || !exfeetable.getIsAdded()){
					exfeetable.setTruckingdetail(truckingdetail);
					items.add(exfeetable);
				}
			}
			truckingdetail.setExfeetables(items);
		}
	}
	
	/**
	 * Attach child of offer price
	 * @param accountingcus
	 */
	public static void wireChildOfAccountingcus(Accountingcus accountingcus){
		List<Accountingcusdetail> items = new ArrayList<>();
		if (accountingcus.getAccountingcusdetails() != null && !accountingcus.getAccountingcusdetails().isEmpty()){
			for (Accountingcusdetail item: accountingcus.getAccountingcusdetails()){
				if (item.getIsAdded() == null || !item.getIsAdded()){
					item.setAccountingcus(accountingcus);
					items.add(item);
				}
			}
			accountingcus.setAccountingcusdetails(items);
		}
		
		if (accountingcus.getExtendfeeaccs() != null && !accountingcus.getExtendfeeaccs().isEmpty()){
			for (Extendfeeacc extendfeeacc: accountingcus.getExtendfeeaccs()){
					extendfeeacc.setAccountingcus(accountingcus);
			}
		}
	}
	

	/**
	 * Create cont and seal map
	 * @param contseals
	 * @return
	 */
	public static ContsealSelections fromContseals(List<Contseal> contseals){
		ContsealSelections contsealSelections  = new ContsealSelections();
		if (contseals != null && !contseals.isEmpty()){
			Map<Long, String> conts = new LinkedHashMap<>();
			Map<Long, String> seals = new LinkedHashMap<>();
			for (Contseal contseal : contseals){
				conts.put(contseal.getId(), contseal.getNoOfCont());
				seals.put(contseal.getId(), contseal.getNoSeal());
			}
			contsealSelections.setConts(conts);
			contsealSelections.setSeal(seals);
		}
		return contsealSelections;
	}

	/**
	 * Add one element exfeetable for truckingdetail
	 * @param truckingdetails
	 */
	public static void updateExfeetableForNewTruckingdetail(
			List<Truckingdetail> truckingdetails,Boolean... add) {
		if (truckingdetails != null && !truckingdetails.isEmpty()){
			for (Truckingdetail truckingdetail : truckingdetails){
				List<Exfeetable> exfeetables = new ArrayList<>();
				Exfeetable exfeetable = new Exfeetable();
				exfeetable.setIsAdded(add.length > 0 ? add[0] : false);
				exfeetables.add(exfeetable);
				truckingdetail.setExfeetables(exfeetables);
			}
		}
	}
	
	/**
	 * 
	 * @param nhathaus
	 * @return
	 */
	public static Map<Long,String> fromNhathauList2Map(List<Nhathau> nhathaus){
		Map<Long,String> nhathauMap = new LinkedHashMap<>();
		
		if (nhathaus != null && !nhathaus.isEmpty()){
			for (Nhathau nhathau : nhathaus){
				if (nhathau.getCode() != null && nhathau.getName() != null){
					String nhathauName = nhathau.getCode() + AELConst.SEPARATOR + nhathau.getName();
					nhathauMap.put(nhathau.getId(), nhathauName);
				}else{
					nhathauMap.put(nhathau.getId(),AELConst.EMPTY_STRING);
				}
			}
		}
		return nhathauMap;
	}
	
	/**
	 * Calculate total by amount and vat
	 * @param amount
	 * @param vat
	 * @return
	 */
	public static BigDecimal calTotalWithVat(BigDecimal amount, BigDecimal vat){
		return ConvertUtil.getNotNullValue(amount).add(ConvertUtil.getNotNullValue(amount).multiply(ConvertUtil.getNotNullValue(vat).divide(new BigDecimal(AELConst.VAT_PERCENT))));
	}
	
	/**
     * Load file from request
     * @param attachments
     * @param request
     */
    public static void updateFilesUpload(List<Attachment>attachments, HttpServletRequest request,String... prefix){
    	 final MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
    	 if (attachments != null && !attachments.isEmpty()){
    		 for (int i = 0 ; i< attachments.size(); ++ i){
    			 String filePath = (prefix.length >0 ? prefix[0]+AELConst.DOT: "")+AELConst.ATTACHMENT_REQUEST_PARAM+AELConst.INDEX_OPEN+i+AELConst.INDEX_CLOSE+AELConst.DOT+AELConst.ATTACHMENT_REQUEST_DATA+AELConst.DOT+AELConst.ATTACHMENT_REQUEST_DATA;
    			 final CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile(filePath);
    			 if(file != null && file.getSize() > 0){
    				 try{
     				 	final InputStream stream = file.getInputStream();
     				 	attachments.get(i).getData().setAttachment(attachments.get(i));
     				 	attachments.get(i).getData().setData(IOUtils.toByteArray(stream));
     				 	attachments.get(i).setIsAdded(false);
     				} catch (IOException e) {
     					e.printStackTrace();
     				}
    			 }else{
    				 attachments.get(i).setIsAdded(false);
    				 attachments.get(i).setData(null);
    			 }
    			 
    		 }
    	 }
    }

    /**
     * Wired childs of advance form
     */
	public static void wireChildOfAdvanceform(Advanceform advanceform) {
		List<Advancedetail> items = new ArrayList<>();
		Boolean status = advanceform.getDoApproval();
		if (advanceform.getAdvancedetails() != null && !advanceform.getAdvancedetails().isEmpty()){
			for (Advancedetail advancedetail: advanceform.getAdvancedetails()){
				if (advancedetail.getIsAdded() == null || !advancedetail.getIsAdded()){
					advancedetail.setAdvanceform(advanceform);
					//14.9 change status correspondingly Advanceform <-> Advancedetails
					advancedetail.setApproved(status);
					items.add(advancedetail);
				}
			}
			advanceform.setAdvancedetails(items);
		}
	}

	public static void wireChildOfRefund(Refund refund) {
		List<Refunddetail> items = new ArrayList<>();
		Boolean status = refund.getDoApproval();
		List<Exfeetable> exfeetables = new ArrayList<>();
		if (refund.getRefunddetails() != null && !refund.getRefunddetails().isEmpty()){
			for (Refunddetail refunddetail: refund.getRefunddetails()){
				if (refunddetail.getIsAdded() == null || !refunddetail.getIsAdded()){
					refunddetail.setRefund(refund);
					//14.9 change status correspondingly
					refunddetail.setApproved(status);
					items.add(refunddetail);
				}
			}
			refund.setRefunddetails(items);
		}
		if(refund.getExfeetables() != null && !refund.getExfeetables().isEmpty()){
			for(Exfeetable exfeetable : refund.getExfeetables()){
				if(exfeetable.getIsAdded() == null || !exfeetable.getIsAdded()){
					exfeetable.setRefund(refund);
					//24.2 change status correspondingly
					exfeetable.setApproved(status);
					if (exfeetable.getDateChange() == null) {
						exfeetable.setDateChange(new Date());
					}
					exfeetables.add(exfeetable);
				}
			}
			refund.setExfeetables(exfeetables);
		}
		
	}
	
	public static void countCont(List<Contseal> contseals, Docsgeneral docsgeneral){
		int count20 = 0;
		int count40 = 0;
		int countOt = 0;
		if (contseals != null && !contseals.isEmpty()){
			for (Contseal contseal :  contseals){
				if (contseal.getTypeOfCont() != null)
					if(contseal.getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_20_START)){
						count20+=1;
					}else if(contseal.getTypeOfCont().getValue().startsWith(TypeOfContainer.FCL_40_START)){
						count40+=1;
					}else{
						countOt+=1;
					}
				}	
			}
		docsgeneral.setNoOf20Cont(count20);
		docsgeneral.setNoOf40Cont(count40);
		docsgeneral.setOtCont(countOt);
	}
	
	public static boolean isAdminOrAccountRole(User user){
		Set<String> roleNames = new HashSet<>();
		Set<Role> roles = user.getRoles();
		if(roles != null && !roles.isEmpty()){
			for (Role role : roles) {
				roleNames.add(role.getName());
			}
			if(roleNames.contains(RoleMapping.ACCOUNTING) || roleNames.contains(RoleMapping.ADMIN)){
				return true;
			}
		}
		return false;
	}
}
