package com.vn.ael.persistence.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.vn.ael.constants.BookType;
import com.vn.ael.constants.VoucherType;
import com.vn.ael.webapp.util.CommonUtil;

@Entity
@NamedQuery(name="MoneyBook.findAll", query="SELECT mb FROM MoneyBook mb")
public class MoneyBook extends BaseEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Date date;
	
	private BookType typeOfBook;
	
	/*private Integer typeOfVoucher;//payment(chi): 0, recept(thu): 1
*/	
	private Integer voucherNo;
	
	private VoucherType typeOfVoucher;
	
	@Transient
	private String voucherNoPrint;
	
	private BigDecimal paymentMoney;
	
	private BigDecimal receptMoney; 
	
	private BigDecimal balance;
	
	private String description;
	
	private String refNos;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="bank")
	private Bank bank;
	
	@OneToMany(mappedBy="moneyBook")
	private List<Advanceform> advanceForms;
	
	@OneToMany(mappedBy="moneyBook")
	private List<Refund> refunds;
	
	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return the typeOfBook
	 */
	public BookType getTypeOfBook() {
		return typeOfBook;
	}

	/**
	 * @param typeOfBook the typeOfBook to set
	 */
	public void setTypeOfBook(BookType typeOfBook) {
		this.typeOfBook = typeOfBook;
	}

	/**
	 * @return the typeOfVoucher
	 */
	public VoucherType getTypeOfVoucher() {
		return typeOfVoucher;
	}

	/**
	 * @param typeOfVoucher the typeOfVoucher to set
	 */
	public void setTypeOfVoucher(VoucherType typeOfVoucher) {
		this.typeOfVoucher = typeOfVoucher;
	}

	/**
	 * @return the voucherNo
	 */
	public Integer getVoucherNo() {
		return voucherNo;
	}
	
	public String getVoucherNoPrint() {
		String prefix = typeOfVoucher.getPrefix();
		String number = CommonUtil.addZero(String.valueOf(voucherNo), typeOfVoucher.getLengthOfCounter());
		String voucherNoPrint = "-";
		if (!"-".equals(prefix)) {
			voucherNoPrint = prefix + number ;
		}
		return voucherNoPrint;
	}

	/**
	 * @param voucherNo the voucherNo to set
	 */
	public void setVoucherNo(Integer voucherNo) {
		this.voucherNo = voucherNo;
	}

	/**
	 * @return the paymentMoney
	 */
	public BigDecimal getPaymentMoney() {
		return paymentMoney;
	}

	/**
	 * @param paymentMoney the paymentMoney to set
	 */
	public void setPaymentMoney(BigDecimal paymentMoney) {
		this.paymentMoney = paymentMoney;
	}

	/**
	 * @return the receptMoney
	 */
	public BigDecimal getReceptMoney() {
		return receptMoney;
	}

	/**
	 * @param receptMoney the receptMoney to set
	 */
	public void setReceptMoney(BigDecimal receptMoney) {
		this.receptMoney = receptMoney;
	}

	/**
	 * @return the balance
	 */
	public BigDecimal getBalance() {
		return balance;
	}

	/**
	 * @param balance the balance to set
	 */
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public String getRefNos() {
		return refNos;
	}

	public void setRefNos(String refNos) {
		this.refNos = refNos;
	}

	public List<Advanceform> getAdvanceForms() {
		return advanceForms;
	}

	public void setAdvanceForms(List<Advanceform> advanceForms) {
		this.advanceForms = advanceForms;
	}

	public List<Refund> getRefunds() {
		return refunds;
	}

	public void setRefunds(List<Refund> refunds) {
		this.refunds = refunds;
	}

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}
	
	
}
