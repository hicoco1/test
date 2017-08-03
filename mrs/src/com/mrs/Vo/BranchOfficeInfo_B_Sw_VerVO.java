package com.mrs.Vo;

import org.springframework.web.multipart.MultipartFile;

public class BranchOfficeInfo_B_Sw_VerVO extends PagingVO
{
	private String  branchapp_sw_version;
	private String  branchapp_sw_update;
	private String  branchapp_sw_url;
	private String  branchapp_sw_update_org;
	private String  fileName;
	private MultipartFile  uploadfile;
	private String  branchapp_sw_memo;
	private String  branchapp_sw_version_org;
	
	public String getBranchapp_sw_version_org() {
		return branchapp_sw_version_org;
	}
	public void setBranchapp_sw_version_org(String branchapp_sw_version_org) {
		this.branchapp_sw_version_org = branchapp_sw_version_org;
	}
	public String getBranchapp_sw_memo() {
		return branchapp_sw_memo;
	}
	public void setBranchapp_sw_memo(String branchapp_sw_memo) {
		this.branchapp_sw_memo = branchapp_sw_memo;
	}
	public String getBranchapp_sw_update_org() {
		return branchapp_sw_update_org;
	}
	public void setBranchapp_sw_update_org(String branchapp_sw_update_org) {
		this.branchapp_sw_update_org = branchapp_sw_update_org;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getBranchapp_sw_version() {
		return branchapp_sw_version;
	}
	public void setBranchapp_sw_version(String branchapp_sw_version) {
		this.branchapp_sw_version = branchapp_sw_version;
	}
	public String getBranchapp_sw_update() {
		return branchapp_sw_update;
	}
	public void setBranchapp_sw_update(String branchapp_sw_update) {
		this.branchapp_sw_update = branchapp_sw_update;
	}
	public String getBranchapp_sw_url() {
		return branchapp_sw_url;
	}
	public void setBranchapp_sw_url(String branchapp_sw_url) {
		this.branchapp_sw_url = branchapp_sw_url;
	}
}