package com.vn.ael.constants;

public enum VoucherType {
	PHIEUCHI(0, "PC", 5, "moneybook.voucherType.phieuchi"), 
	PHIEUTHU(1, "PT", 5, "moneybook.voucherType.phieuthu"), 
	NTTK(2, "NTTK", 4, "moneybook.voucherType.nttk"), 
	UNC(3, "UNC", 4, "moneybook.voucherType.unc"),
	BALANCE(-1, "-", 0, "-");

    private final int value;
    private final String prefix;
    private final int lengthOfCounter;
    private final String printValue;
    private VoucherType(int value, String prefix, int lengthOfCounter, String printValue) {
        this.value = value;
        this.prefix = prefix;
        this.lengthOfCounter = lengthOfCounter;
        this.printValue = printValue;
    }

    public int getValue() {
        return value;
    }
    
    public String getPrefix() {
    	return prefix;
    }
    
    public String getPrintValue() {
    	return printValue;
    }
    public int getLengthOfCounter() {
    	return lengthOfCounter;
    }
}
