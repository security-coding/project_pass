package com.pknu.pass.play.dto;

public class DetailDto {

	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;
	private String prfcast;
	private String prfcrew;
	private String prfruntime;
	private String prfage;
	private String entrpsnm;
	private String pcseguidance;
	private String dtguidance;
	private String prfnm;
	private	String genrenm;
	private String la;
	private String lo;
	
	@Override
	public String toString() {
		return "DetailDto [prfpdfrom=" + prfpdfrom + ", prfpdto=" + prfpdto + ", fcltynm=" + fcltynm + ", prfcast="
				+ prfcast + ", prfcrew=" + prfcrew + ", prfruntime=" + prfruntime + ", prfage=" + prfage + ", entrpsnm="
				+ entrpsnm + ", pcseguidance=" + pcseguidance + ", dtguidance=" + dtguidance + ", prfnm=" + prfnm
				+ ", genrenm=" + genrenm + ", la=" + la + ", lo=" + lo + "]";
	}

	public String getLa() {
		return la;
	}


	public void setLa(String la) {
		this.la = la;
	}


	public String getLo() {
		return lo;
	}

	public void setLo(String lo) {
		this.lo = lo;
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

	public String getPrfcast() {
		return prfcast;
	}

	public void setPrfcast(String prfcast) {
		this.prfcast = prfcast;
	}

	public String getPrfcrew() {
		return prfcrew;
	}

	public void setPrfcrew(String prfcrew) {
		this.prfcrew = prfcrew;
	}

	public String getPrfruntime() {
		return prfruntime;
	}

	public void setPrfruntime(String prfruntime) {
		this.prfruntime = prfruntime;
	}

	public String getPrfage() {
		return prfage;
	}

	public void setPrfage(String prfage) {
		this.prfage = prfage;
	}

	public String getEntrpsnm() {
		return entrpsnm;
	}

	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}

	public String getPcseguidance() {
		return pcseguidance;
	}

	public void setPcseguidance(String pcseguidance) {
		this.pcseguidance = pcseguidance;
	}

	public String getDtguidance() {
		return dtguidance;
	}

	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
	}

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	public String getGenrenm() {
		return genrenm;
	}

	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}

}
