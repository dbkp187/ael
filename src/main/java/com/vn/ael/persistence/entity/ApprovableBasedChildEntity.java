package com.vn.ael.persistence.entity;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.vn.ael.constants.AELConst;

@MappedSuperclass
public class ApprovableBasedChildEntity extends BaseEntity implements Serializable{

	@Transient
	private Boolean isAdded = false;
	
	@Transient
	private Boolean isDeleted = false;
	
	private Boolean approved = false;
	
	private Boolean checkByAdmin = false;
	
	public Boolean getIsAdded() {
		return isAdded;
	}

	public void setIsAdded(Boolean isAdded) {
		this.isAdded = isAdded;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	public Boolean getApproved() {
		return approved;
	}

	public void setApproved(Boolean approved) {
		this.approved = approved;
	}
	
	@Transient
	public String getApprovedText(){
		if (this.approved == null || ! this.approved){
			return AELConst.ACC_FEE_ISNOT_APPROVED;
		}
		return AELConst.ACC_FEE_IS_APPROVED;
	}
	
	@Transient
	public String getCheckByAdminText(){
		if (this.checkByAdmin == null || ! this.checkByAdmin){
			return AELConst.ACC_FEE_ISNOT_APPROVED;
		}
		return AELConst.ACC_FEE_IS_APPROVED;
	}
	
	public Boolean getCheckByAdmin() {
		return checkByAdmin;
	}

	public void setCheckByAdmin(Boolean checkByAdmin) {
		this.checkByAdmin = checkByAdmin;
	}
}
