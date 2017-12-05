<<<<<<< HEAD
package com.pknu.pass.play.dto;

public class PlaceDto {

	private String fcltynm;		//공연시설명
	private String mt10id;		//공연시설ID
	private String mt13cnt;		//공연장 수
	private String fcltychartr;	//시설특성
	private String opende;		//개관연도
	private String seatscale;	//객석 수
	private String telno;		//전화번호
	private String relateurl;	//홈페이지
	private String adres;		//주소
	private String sidonm;		//지역(시도)
	private String la;			//위도
	private String lo;			//경도
	
	public PlaceDto() {}
	
	public PlaceDto(String fcltynm ,String mt10id, String sidonm) {
		this.fcltynm = fcltynm;
		this.mt10id = mt10id;
		this.sidonm = sidonm;
	}
	
	public void setDetail(String mt13cnt,String fcltychartr, String opende, String seatscale, String telno, String relateurl, String adres, String la, String lo) {
		this.mt13cnt = mt13cnt;
		this.fcltychartr = fcltychartr;
		this.opende = opende;
		this.seatscale = seatscale;
		this.telno = telno;
		this.relateurl = relateurl;
		this.adres = adres;
		this.la = la;
		this.lo = lo;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public String getMt10id() {
		return mt10id;
	}

	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}

	public String getMt13cnt() {
		return mt13cnt;
	}

	public void setMt13cnt(String mt13cnt) {
		this.mt13cnt = mt13cnt;
	}

	public String getFcltychartr() {
		return fcltychartr;
	}

	public void setFcltychartr(String fcltychartr) {
		this.fcltychartr = fcltychartr;
	}

	public String getOpende() {
		return opende;
	}

	public void setOpende(String opende) {
		this.opende = opende;
	}

	public String getSeatscale() {
		return seatscale;
	}

	public void setSeatscale(String seatscale) {
		this.seatscale = seatscale;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getRelateurl() {
		return relateurl;
	}

	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getSidonm() {
		return sidonm;
	}

	public void setSidonm(String sidonm) {
		this.sidonm = sidonm;
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

	@Override
	public String toString() {
		return "PlaceDto [fcltynm=" + fcltynm + ", mt10id=" + mt10id + ", mt13cnt=" + mt13cnt + ", fcltycharty="
				+ fcltychartr + ", opende=" + opende + ", seatscale=" + seatscale + ", telno=" + telno + ", relateurl="
				+ relateurl + ", adres=" + adres + ", sidonm=" + sidonm + ", la=" + la + ", lo=" + lo + "]";
	}
	
	
	
}
=======
package com.pknu.pass.play.dto;

public class PlaceDto {

	private String fcltynm;		//공연시설명
	private String mt10id;		//공연시설ID
	private String mt13cnt;		//공연장 수
	private String fcltychartr;	//시설특성
	private String opende;		//개관연도
	private String seatscale;	//객석 수
	private String telno;		//전화번호
	private String relateurl;	//홈페이지
	private String adres;		//주소
	private String sidonm;		//지역(시도)
	private String la;			//위도
	private String lo;			//경도
	
	public PlaceDto() {}
	
	public PlaceDto(String fcltynm ,String mt10id, String sidonm) {
		this.fcltynm = fcltynm;
		this.mt10id = mt10id;
		this.sidonm = sidonm;
	}
	
	public void setDetail(String mt13cnt,String fcltychartr, String opende, String seatscale, String telno, String relateurl, String adres, String la, String lo) {
		this.mt13cnt = mt13cnt;
		this.fcltychartr = fcltychartr;
		this.opende = opende;
		this.seatscale = seatscale;
		this.telno = telno;
		this.relateurl = relateurl;
		this.adres = adres;
		this.la = la;
		this.lo = lo;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public String getMt10id() {
		return mt10id;
	}

	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}

	public String getMt13cnt() {
		return mt13cnt;
	}

	public void setMt13cnt(String mt13cnt) {
		this.mt13cnt = mt13cnt;
	}

	public String getFcltychartr() {
		return fcltychartr;
	}

	public void setFcltychartr(String fcltychartr) {
		this.fcltychartr = fcltychartr;
	}

	public String getOpende() {
		return opende;
	}

	public void setOpende(String opende) {
		this.opende = opende;
	}

	public String getSeatscale() {
		return seatscale;
	}

	public void setSeatscale(String seatscale) {
		this.seatscale = seatscale;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getRelateurl() {
		return relateurl;
	}

	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getSidonm() {
		return sidonm;
	}

	public void setSidonm(String sidonm) {
		this.sidonm = sidonm;
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

	@Override
	public String toString() {
		return "PlaceDto [fcltynm=" + fcltynm + ", mt10id=" + mt10id + ", mt13cnt=" + mt13cnt + ", fcltycharty="
				+ fcltychartr + ", opende=" + opende + ", seatscale=" + seatscale + ", telno=" + telno + ", relateurl="
				+ relateurl + ", adres=" + adres + ", sidonm=" + sidonm + ", la=" + la + ", lo=" + lo + "]";
	}
	
	
	
}
>>>>>>> 9f188dada92f082683093830b08a07836a675393
