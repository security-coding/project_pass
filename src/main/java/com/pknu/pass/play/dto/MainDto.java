package com.pknu.pass.play.dto;

public class MainDto {
	private String imageUrl;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;	
	private	String genrenm;
	private String mt20id;
	private String pType;
	private String sidonm;

	

	

	@Override
	public String toString() {
		return "MainDto [imageUrl=" + imageUrl + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom + ", prfpdto="
				+ prfpdto + ", fcltynm=" + fcltynm + ", genrenm=" + genrenm + ", mt20id=" + mt20id + ", pType=" + pType
				+ ", sidonm=" + sidonm + "]";
	}

	public String getSidonm() {
		return sidonm;
	}

	public void setSidonm(String sidonm) {
		this.sidonm = sidonm;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public String getMt20id() {
		return mt20id;
	}

	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getPrfpdfrom() {
		return prfpdfrom;
	}
	public void setPrfpdfrom(String prfpdfrom) {
		this.prfpdfrom = prfpdfrom;
	}
	public String getPrfpdto() {
		return prfpdto;
	}
	public void setPrfpdto(String prfpdto) {
		this.prfpdto = prfpdto;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
		
}
