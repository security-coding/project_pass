<<<<<<< HEAD
package com.pknu.pass.play.dto;

public class ConcertDto {
	private String mt20id;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;
	private String prfcast;
	private String prfcrew;
	private String prfruntime;
	private String prfage;
	private String entrpsnm;
	private String pcseguidance;
	private	String genrenm;
	private String mt10id;
	private String dtguidance;
	
	public ConcertDto() {}
	
	public ConcertDto(String mt20id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm, String genrenm) {
		super();
		this.mt20id = mt20id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.genrenm = genrenm;
	}
	
	public void setDetail(String prfcast, String prfcrew, String prfruntime, String prfage,
			String entrpsnm, String pcseguidance, String mt10id, String dtguidance) {
		this.prfcast = prfcast;
		this.prfcrew = prfcrew;
		this.prfruntime = prfruntime;
		this.prfage = prfage;
		this.entrpsnm = entrpsnm;
		this.pcseguidance = pcseguidance;
		this.mt10id = mt10id;
		this.dtguidance = dtguidance;
	}
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
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
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}
	public String getDtguidance() {
		return dtguidance;
	}
	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
	}


	
}
=======
package com.pknu.pass.play.dto;

public class ConcertDto {
	private String mt20id;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;
	private String prfcast;
	private String prfcrew;
	private String prfruntime;
	private String prfage;
	private String entrpsnm;
	private String pcseguidance;
	private	String genrenm;
	private String mt10id;
	private String dtguidance;
	
	public ConcertDto() {}
	
	public ConcertDto(String mt20id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm, String genrenm) {
		super();
		this.mt20id = mt20id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.genrenm = genrenm;
	}
	
	public void setDetail(String prfcast, String prfcrew, String prfruntime, String prfage,
			String entrpsnm, String pcseguidance, String mt10id, String dtguidance) {
		this.prfcast = prfcast;
		this.prfcrew = prfcrew;
		this.prfruntime = prfruntime;
		this.prfage = prfage;
		this.entrpsnm = entrpsnm;
		this.pcseguidance = pcseguidance;
		this.mt10id = mt10id;
		this.dtguidance = dtguidance;
	}
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
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
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}
	public String getDtguidance() {
		return dtguidance;
	}
	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
	}


	
}
>>>>>>> 9f188dada92f082683093830b08a07836a675393
