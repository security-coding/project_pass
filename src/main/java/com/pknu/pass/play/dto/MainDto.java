package com.pknu.pass.play.dto;

public class MainDto {
	private String imageUrl;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;	
	private	String genrenm;
	@Override
	public String toString() {
		return "MainDto [imageUrl=" + imageUrl + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom + ", prfpdto="
				+ prfpdto + ", fcltynm=" + fcltynm + ", genrenm=" + genrenm + "]";
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