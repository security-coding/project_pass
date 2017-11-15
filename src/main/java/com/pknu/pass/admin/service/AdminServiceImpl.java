package com.pknu.pass.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.pknu.pass.admin.common.FileUtil;
import com.pknu.pass.admin.dao.AdminDao;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.PlaceDto;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;
	@Autowired
	FileUtil fileUpload;
	@Resource
	private String API_KEY;
	
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

	@Override
	public void getConertInf(HttpSession session) throws Exception {
		Date cur_date = new Date();
		Calendar cal_date = Calendar.getInstance();
		cal_date.setTime(cur_date);
		cal_date.add(Calendar.DATE, 15);

		StringBuffer url = new StringBuffer("http://kopis.or.kr/openApi/restful/pblprfr");
		String stdate = dateFormat.format(cur_date);
		String eddate = dateFormat.format(cal_date.getTime());
		String cpage = "1";
		String rows = "20";

		url.append("?service=" + API_KEY + "&stdate=" + stdate + "&eddate=" + eddate + "&cpage=" + cpage + "&rows="
				+ rows);

		ArrayList<ConcertDto> concertList = new ArrayList<>();

		Document xmlDoc = getXMLInf(url.toString()); 
		Element root = xmlDoc.getDocumentElement();
		
		NodeList nodeList = root.getElementsByTagName("db");

		for (int i = 0; i < nodeList.getLength(); i++) {
			Node dbNode = nodeList.item(i);
			Element dbElement = (Element) dbNode;

			String mt20id = dbElement.getElementsByTagName("mt20id").item(0).getTextContent();
			String prfnm = dbElement.getElementsByTagName("prfnm").item(0).getTextContent();
			String prfpdfrom = dbElement.getElementsByTagName("prfpdfrom").item(0).getTextContent();
			String prfpdto = dbElement.getElementsByTagName("prfpdto").item(0).getTextContent();
			String fcltynm = dbElement.getElementsByTagName("fcltynm").item(0).getTextContent();
			String genrenm = dbElement.getElementsByTagName("genrenm").item(0).getTextContent();
			
			concertList.add(new ConcertDto(mt20id, prfnm, prfpdfrom, prfpdto, fcltynm, genrenm));
		}
		insertConcertInf(concertList, session);

	}

	private void insertConcertInf(ArrayList<ConcertDto> concertList, HttpSession session) throws Exception {
		ArrayList<String> imageUrlList = null;
		ArrayList<ImageDto> imageList = null;
		
		for (ConcertDto concert : concertList) {
			imageUrlList = new ArrayList<>();
			imageList = new ArrayList<>();
			
			StringBuffer url = new StringBuffer("http://www.kopis.or.kr/openApi/restful/pblprfr/");

			String mt20id = concert.getMt20id();

			url.append(mt20id);
			url.append("?service=" + API_KEY);

			Document xmlDoc = getXMLInf(url.toString()); 
			Element root = xmlDoc.getDocumentElement();

			Element dbElement = (Element) root.getElementsByTagName("db").item(0);
			
			String prfcast = dbElement.getElementsByTagName("prfcast").item(0).getTextContent();
			String prfcrew = dbElement.getElementsByTagName("prfcrew").item(0).getTextContent();
			String prfruntime = dbElement.getElementsByTagName("prfruntime").item(0).getTextContent();
			String prfage = dbElement.getElementsByTagName("prfage").item(0).getTextContent();
			String entrpsnm = dbElement.getElementsByTagName("entrpsnm").item(0).getTextContent();
			String pcseguidance = dbElement.getElementsByTagName("pcseguidance").item(0).getTextContent();
			String mt10id = dbElement.getElementsByTagName("mt10id").item(0).getTextContent();
			String dtguidance = dbElement.getElementsByTagName("dtguidance").item(0).getTextContent();
			
			concert.setDetail(prfcast, prfcrew, prfruntime, prfage, entrpsnm, pcseguidance, mt10id, dtguidance);
			
			String poster = dbElement.getElementsByTagName("poster").item(0).getTextContent();
			imageUrlList.add(poster);
			
			NodeList styurlsNode = dbElement.getElementsByTagName("styurls").item(0).getChildNodes();
			
			System.out.println(styurlsNode.getLength());
			for (int j = 0; j < styurlsNode.getLength(); j++) {
				String styurl = styurlsNode.item(j).getTextContent();
				if (!styurl.trim().equals("")) {
					imageUrlList.add(styurl);
				}
			}
			
			// 공연 상세정보 DB 업로드
			adminDao.insertConcertInf(concert);
			// 사진 업로드 부분
			imageList = fileUpload.upload(mt20id, imageUrlList, session);
			
			for(ImageDto image : imageList) {
				adminDao.insertImageInf(image);
			}
		}
	}

	@Override
	public void getPlaceInf() {
		ArrayList<PlaceDto> placeList = null;

		StringBuffer url = new StringBuffer("http://kopis.or.kr/openApi/restful/prfplc");
		String cpage = "1";
		String rows = "1103";

		url.append("?service=" + API_KEY + "&cpage=" + cpage + "&rows=" + rows);

		try {
			placeList = new ArrayList<>();

			Document xmlDoc = getXMLInf(url.toString()); 
			Element root = xmlDoc.getDocumentElement();
			
			NodeList nodeList = root.getElementsByTagName("db");

			for (int i = 0; i < nodeList.getLength(); i++) {
				Node dbNode = nodeList.item(i);
				Element dbElement = (Element) dbNode;

				String fcltynm = dbElement.getElementsByTagName("fcltynm").item(0).getTextContent();
				String mt10id = dbElement.getElementsByTagName("mt10id").item(0).getTextContent();
				String sidonm = dbElement.getElementsByTagName("sidonm").item(0).getTextContent();
				placeList.add(new PlaceDto(fcltynm, mt10id, sidonm));
			}
			insertPlaceInf(placeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void insertPlaceInf(ArrayList<PlaceDto> placeList) {
		for (PlaceDto place : placeList) {
			StringBuffer url = new StringBuffer("http://www.kopis.or.kr/openApi/restful/prfplc/");

			String mt10id = place.getMt10id();

			url.append(mt10id);
			url.append("?service=" + API_KEY);
			
			try {
				Document xmlDoc = getXMLInf(url.toString()); 
				Element root = xmlDoc.getDocumentElement();
				
				Element dbElement = (Element) root.getElementsByTagName("db").item(0);
				
				String telno = dbElement.getElementsByTagName("telno").item(0).getTextContent();
				String relateurl = dbElement.getElementsByTagName("relateurl").item(0).getTextContent();
				String adres = dbElement.getElementsByTagName("adres").item(0).getTextContent();
				String la = dbElement.getElementsByTagName("la").item(0).getTextContent();
				String lo = dbElement.getElementsByTagName("lo").item(0).getTextContent();
				
				place.setDetail(telno, relateurl, adres, la, lo);
				System.out.println("Insert Start!");
				adminDao.insertPlaceInf(place);
				System.out.println("Insert OK!");
			} catch(Exception e) { }
		}
	}

	// XML File 파싱하는 작업
	private Document getXMLInf(String url) {
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = dbf.newDocumentBuilder();

			return parser.parse(url);
		} catch (Exception e) {

		}
		return null;
	}

}
