package com.mrs.Vo;

import org.springframework.web.multipart.MultipartFile;

public class BranchOfficeInfo_R_Sw_VerVO extends PagingVO
{
	private String  riderapp_sw_version;
	private String  riderapp_sw_update;
	private String  riderapp_sw_url;
	private String  riderapp_sw_update_org;
	private String  fileName;
	private MultipartFile  uploadfile;
	private String  riderapp_sw_memo;
	private String  riderapp_sw_version_org;
	
	public String getRiderapp_sw_version_org() {
		return riderapp_sw_version_org;
	}
	public void setRiderapp_sw_version_org(String riderapp_sw_version_org) {
		this.riderapp_sw_version_org = riderapp_sw_version_org;
	}
	public String getRiderapp_sw_memo() {
		return riderapp_sw_memo;
	}
	public void setRiderapp_sw_memo(String riderapp_sw_memo) {
		this.riderapp_sw_memo = riderapp_sw_memo;
	}
	public String getRiderapp_sw_update_org() {
		return riderapp_sw_update_org;
	}
	public void setRiderapp_sw_update_org(String riderapp_sw_update_org) {
		this.riderapp_sw_update_org = riderapp_sw_update_org;
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
	public String getRiderapp_sw_version() {
		return riderapp_sw_version;
	}
	public void setRiderapp_sw_version(String riderapp_sw_version) {
		this.riderapp_sw_version = riderapp_sw_version;
	}
	public String getRiderapp_sw_update() {
		return riderapp_sw_update;
	}
	public void setRiderapp_sw_update(String riderapp_sw_update) {
		this.riderapp_sw_update = riderapp_sw_update;
	}
	public String getRiderapp_sw_url() {
		return riderapp_sw_url;
	}
	public void setRiderapp_sw_url(String riderapp_sw_url) {
		this.riderapp_sw_url = riderapp_sw_url;
	}
} 