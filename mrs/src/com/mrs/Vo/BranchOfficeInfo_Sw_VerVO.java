package com.mrs.Vo;

import org.springframework.web.multipart.MultipartFile;

public class BranchOfficeInfo_Sw_VerVO extends PagingVO
{
	private String  branch_sw_version;
	private String  branch_sw_update;
	private String  branch_sw_url;
	private String  branch_sw_update_org;
	private String  fileName;
	private MultipartFile  uploadfile;
	private String  branch_sw_memo;
	private String  branch_sw_version_org;
	
	
	public String getBranch_sw_version_org() {
		return branch_sw_version_org;
	}
	public void setBranch_sw_version_org(String branch_sw_version_org) {
		this.branch_sw_version_org = branch_sw_version_org;
	}
	public String getBranch_sw_memo() {
		return branch_sw_memo;
	}
	public void setBranch_sw_memo(String branch_sw_memo) {
		this.branch_sw_memo = branch_sw_memo;
	}
	public String getBranch_sw_update_org() {
		return branch_sw_update_org;
	}
	public void setBranch_sw_update_org(String branch_sw_update_org) {
		this.branch_sw_update_org = branch_sw_update_org;
	}
	public String getBranch_sw_version() {
		return branch_sw_version;
	}
	public void setBranch_sw_version(String branch_sw_version) {
		this.branch_sw_version = branch_sw_version;
	}
	public String getBranch_sw_update() {
		return branch_sw_update;
	}
	public void setBranch_sw_update(String branch_sw_update) {
		this.branch_sw_update = branch_sw_update;
	}
	public String getBranch_sw_url() {
		return branch_sw_url;
	}
	public void setBranch_sw_url(String branch_sw_url) {
		this.branch_sw_url = branch_sw_url;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}