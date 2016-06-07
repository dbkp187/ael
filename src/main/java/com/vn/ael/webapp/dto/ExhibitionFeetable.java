/**
 * 
 */
package com.vn.ael.webapp.dto;

import java.util.List;

/**
 * @author hiendn1992
 *
 */
public class ExhibitionFeetable {
	private String m_type;
	private List<AccountingExhibitionItemExport> m_fees;
	/**
	 * @return the m_type
	 */
	public String getType() {
		return m_type;
	}
	/**
	 * @param m_type the m_type to set
	 */
	public void setType(String m_type) {
		this.m_type = m_type;
	}
	/**
	 * @return the m_fees
	 */
	public List<AccountingExhibitionItemExport> getFees() {
		return m_fees;
	}
	/**
	 * @param m_fees the m_fees to set
	 */
	public void setM_fees(List<AccountingExhibitionItemExport> mFees) {
		this.m_fees = m_fees;
	}
	public ExhibitionFeetable(List<AccountingExhibitionItemExport> fees, String type) {
		m_fees = fees;
		m_type = type;
    }
}
