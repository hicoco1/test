package com.mrs.Vo;

public class HeadOffice_ConfigVO extends PagingVO
{
	private String b_sequence;
	private String h_http_ip_addr;
	private String b_cs_address_web_link;
	private String h_bank;
	private String h_account;
	private String h_name;
	private String h_institution_code;
	
	public String getH_bank() {
		return h_bank;
	}
	public void setH_bank(String h_bank) {
		this.h_bank = h_bank;
	}
	public String getH_account() {
		return h_account;
	}
	public void setH_account(String h_account) {
		this.h_account = h_account;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getH_institution_code() {
		return h_institution_code;
	}
	public void setH_institution_code(String h_institution_code) {
		this.h_institution_code = h_institution_code;
	}
	public String getB_sequence() {
		return b_sequence;
	}
	public void setB_sequence(String b_sequence) {
		this.b_sequence = b_sequence;
	}
	public String getH_http_ip_addr() {
		return h_http_ip_addr;
	}
	public void setH_http_ip_addr(String h_http_ip_addr) {
		this.h_http_ip_addr = h_http_ip_addr;
	}
	public String getB_cs_address_web_link() {
		return b_cs_address_web_link;
	}
	public void setB_cs_address_web_link(String b_cs_address_web_link) {
		this.b_cs_address_web_link = b_cs_address_web_link;
	}
	
}