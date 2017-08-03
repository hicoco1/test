package com.mrs.Vo;

import org.springframework.web.multipart.MultipartFile;

public class BranchOfficeInfo_S_Sw_VerVO extends PagingVO
{
	private String  store_sw_version;
	private String  store_sw_update;
	private String  store_sw_url;
	private String  store_sw_update_org;
	private String  fileName;
	private MultipartFile  uploadfile;
	private String  store_sw_memo;
	private String  store_sw_version_org;
	
	public String getStore_sw_version_org() {
		return store_sw_version_org;
	}
	public void setStore_sw_version_org(String store_sw_version_org) {
		this.store_sw_version_org = store_sw_version_org;
	}
	public String getStore_sw_memo() {
		return store_sw_memo;
	}
	public void setStore_sw_memo(String store_sw_memo) {
		this.store_sw_memo = store_sw_memo;
	}
	public String getStore_sw_update_org() {
		return store_sw_update_org;
	}
	public void setStore_sw_update_org(String store_sw_update_org) {
		this.store_sw_update_org = store_sw_update_org;
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
	public String getStore_sw_version() {
		return store_sw_version;
	}
	public void setStore_sw_version(String store_sw_version) {
		this.store_sw_version = store_sw_version;
	}
	public String getStore_sw_update() {
		return store_sw_update;
	}
	public void setStore_sw_update(String store_sw_update) {
		this.store_sw_update = store_sw_update;
	}
	public String getStore_sw_url() {
		return store_sw_url;
	}
	public void setStore_sw_url(String store_sw_url) {
		this.store_sw_url = store_sw_url;
	}
	
}