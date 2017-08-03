package com.mrs.Vo;

import org.springframework.web.multipart.MultipartFile;

public class BranchOfficeInfo_Sapp_Sw_VerVO extends PagingVO
{
	private String  storeapp_sw_version;
	private String  storeapp_sw_update;
	private String  storeapp_sw_url;
	private String  storeapp_sw_update_org;
	private String  fileName;
	private MultipartFile  uploadfile;
	private String  storeapp_sw_memo;
	private String  storeapp_sw_version_org;
	
	public String getStoreapp_sw_version_org() {
		return storeapp_sw_version_org;
	}
	public void setStoreapp_sw_version_org(String storeapp_sw_version_org) {
		this.storeapp_sw_version_org = storeapp_sw_version_org;
	}
	public String getStoreapp_sw_memo() {
		return storeapp_sw_memo;
	}
	public void setStoreapp_sw_memo(String storeapp_sw_memo) {
		this.storeapp_sw_memo = storeapp_sw_memo;
	}
	public String getStoreapp_sw_version() {
		return storeapp_sw_version;
	}
	public void setStoreapp_sw_version(String storeapp_sw_version) {
		this.storeapp_sw_version = storeapp_sw_version;
	}
	public String getStoreapp_sw_update() {
		return storeapp_sw_update;
	}
	public void setStoreapp_sw_update(String storeapp_sw_update) {
		this.storeapp_sw_update = storeapp_sw_update;
	}
	public String getStoreapp_sw_url() {
		return storeapp_sw_url;
	}
	public void setStoreapp_sw_url(String storeapp_sw_url) {
		this.storeapp_sw_url = storeapp_sw_url;
	}
	public String getStoreapp_sw_update_org() {
		return storeapp_sw_update_org;
	}
	public void setStoreapp_sw_update_org(String storeapp_sw_update_org) {
		this.storeapp_sw_update_org = storeapp_sw_update_org;
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
	
	
} 