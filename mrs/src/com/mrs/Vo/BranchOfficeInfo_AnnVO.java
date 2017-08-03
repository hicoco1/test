package com.mrs.Vo;

public class BranchOfficeInfo_AnnVO extends PagingVO
{
	private String org_id;     
	private String seq;    
	private String org_name;   
	private String send_time;
	private String announce_type;
	private String announce_flag;
	private String reserved_time;
	private String rs_flag;     
	private String dest_id;   
	private String dest_name;
	private String announce_text;
	private String up_op;     
	private String up_date; 
	private String send_result;
	private String reason;
	
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public String getAnnounce_type() {
		return announce_type;
	}
	public void setAnnounce_type(String announce_type) {
		this.announce_type = announce_type;
	}
	public String getAnnounce_flag() {
		return announce_flag;
	}
	public void setAnnounce_flag(String announce_flag) {
		this.announce_flag = announce_flag;
	}
	public String getReserved_time() {
		return reserved_time;
	}
	public void setReserved_time(String reserved_time) {
		this.reserved_time = reserved_time;
	}
	public String getRs_flag() {
		return rs_flag;
	}
	public void setRs_flag(String rs_flag) {
		this.rs_flag = rs_flag;
	}
	public String getDest_id() {
		return dest_id;
	}
	public void setDest_id(String dest_id) {
		this.dest_id = dest_id;
	}
	public String getDest_name() {
		return dest_name;
	}
	public void setDest_name(String dest_name) {
		this.dest_name = dest_name;
	}
	public String getAnnounce_text() {
		return announce_text;
	}
	public void setAnnounce_text(String announce_text) {
		this.announce_text = announce_text;
	}
	public String getUp_op() {
		return up_op;
	}
	public void setUp_op(String up_op) {
		this.up_op = up_op;
	}
	public String getUp_date() {
		return up_date;
	}
	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	public String getSend_result() {
		return send_result;
	}
	public void setSend_result(String send_result) {
		this.send_result = send_result;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}