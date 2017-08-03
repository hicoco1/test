package com.mrs.Vo;

public class BranchOfficeInfo_PrinterVO extends PagingVO
{
	private String  idx;
	private String  printer_id;
	private String  printer_detail;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getPrinter_id() {
		return printer_id;
	}
	public void setPrinter_id(String printer_id) {
		this.printer_id = printer_id;
	}
	public String getPrinter_detail() {
		return printer_detail;
	}
	public void setPrinter_detail(String printer_detail) {
		this.printer_detail = printer_detail;
	}
	
}