package com.vn.ael.constants;

public enum BookType {
	CASHBOOK(0), BANKBOOK(1);

    private final int value;
    private BookType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
