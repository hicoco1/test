package com.mrs.Vo;

public class BranchOffice_DongVO extends PagingVO
{
	private String  seq;
	private String  city_code;
	private String  gu_code;
	private String  road_code;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCity_code() {
		return city_code;
	}
	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}
	public String getGu_code() {
		return gu_code;
	}
	public void setGu_code(String gu_code) {
		this.gu_code = gu_code;
	}
	public String getRoad_code() {
		return road_code;
	}
	public void setRoad_code(String road_code) {
		this.road_code = road_code;
	}
}