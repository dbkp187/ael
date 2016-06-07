package com.vn.ael.enums;

public enum ReportMergeInfo {
	
	BANG_KE_CUOC_VAN_CHUYEN(18,0,1,3,4,5,6,7,8,11,12,15,16),
	BANG_KE_CUOC_VAN_CHUYEN_L2(18,10),
	
	KE_HOACH_VAN_TAI_NOI_DIA(5,0,1,3,4,15,16),
	KE_HOACH_VAN_TAI_NOI_DIA_L2(5,5,6,7,8),
	
	KE_HOACH_VAN_TAI(5,0,1,2,4,5,6),
	KE_HOACH_VAN_TAI_L2(5,7,8,9,10,11),
	
	KE_HOACH_VAN_TAI_THONGQUAN(6,0),
	KE_HOACH_VAN_TAI_THONGQUAN_L2(6,1,2,3,4,5,6,7,8,13,14,15),
	KE_HOACH_VAN_TAI_THONGQUAN_L3(6,9,10,11,12),
	
	PROFIT_LOSS(3,0,1),
	PROFIT_LOSS_L2(3,2);
	
	
	private int startingRow;
	private int[] cols;
	
	ReportMergeInfo(int startingRow,int... cols){
		this.startingRow = startingRow;
		this.cols = cols;
	}

	public int getStartingRow() {
		return startingRow;
	}

	public void setStartingRow(int startingRow) {
		this.startingRow = startingRow;
	}

	public int[] getCols() {
		return cols;
	}

	public void setCols(int[] cols) {
		this.cols = cols;
	}
	
}
