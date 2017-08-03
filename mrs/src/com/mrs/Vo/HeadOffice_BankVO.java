package com.mrs.Vo;

public class HeadOffice_BankVO extends PagingVO
{
	private String bank_id;
	private String v_bank;
	private String bank_use;
	
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}
	public String getV_bank() {
		return v_bank;
	}
	public void setV_bank(String v_bank) {
		this.v_bank = v_bank;
	}
	public String getBank_use() {
		return bank_use;
	}
	public void setBank_use(String bank_use) {
		this.bank_use = bank_use;
	}
}