package com.pknu.pass.play.dto;

public class BoxofficeDto {
	private String area;
	private String prfdtcnt;
	private String nmrs;
	private String prfpd;
	private String cate;
	private String prfplcnm;
	private String prfnm;
	private int rnum;
	private String catecode;
	private String mt20id;
	
	public BoxofficeDto() {}
	
	public BoxofficeDto(String area, String prfdtcnt, String nmrs, String prfpd, String cate, String prfplcnm,
			String prfnm, int rnum, String catecode ,String mt20id) {
		this.area = area;
		this.prfdtcnt = prfdtcnt;
		this.nmrs = nmrs;
		this.prfpd = prfpd;
		this.cate = cate;
		this.prfplcnm = prfplcnm;
		this.prfnm = prfnm;
		this.rnum = rnum;
		this.catecode = catecode;
		this.mt20id = mt20id;
	}
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPrfdtcnt() {
		return prfdtcnt;
	}
	public void setPrfdtcnt(String prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}
	public String getNmrs() {
		return nmrs;
	}
	public void setNmrs(String nmrs) {
		this.nmrs = nmrs;
	}
	public String getPrfpd() {
		return prfpd;
	}
	public void setPrfpd(String prfpd) {
		this.prfpd = prfpd;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getPrfplcnm() {
		return prfplcnm;
	}
	public void setPrfplcnm(String prfplcnm) {
		this.prfplcnm = prfplcnm;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public String getCatecode() {
		return catecode;
	}

	public void setCatecode(String catecode) {
		this.catecode = catecode;
	}

	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}

	@Override
	public String toString() {
		return "BoxofficeDto [area=" + area + ", prfdtcnt=" + prfdtcnt + ", nmrs=" + nmrs + ", prfpd=" + prfpd
				+ ", cate=" + cate + ", prfplcnm=" + prfplcnm + ", prfnm=" + prfnm + ", rnum=" + rnum + ", catecode="
				+ catecode + ", mt20id=" + mt20id + "]";
	}
	
	
}
