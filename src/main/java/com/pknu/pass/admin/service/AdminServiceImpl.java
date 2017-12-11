package com.pknu.pass.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.pknu.pass.admin.dao.AdminDao;
import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.common.util.FileUtil;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;
	@Autowired
	FileUtil fileUtil;
	@Resource
	private String API_KEY;

	@Override
	public void getConertInf(HttpServletRequest request, String stdate, String eddate, String prfstate) throws Exception {

		String _stdate = stdate.replaceAll("-", "");
		String _eddate = eddate.replaceAll("-", "");
		int _cpage = 10;
		int _rows = 100;

		for (int idx = 1; idx <= _cpage; idx++) {
			StringBuffer url = new StringBuffer("http://kopis.or.kr/openApi/restful/pblprfr");

			url.append("?service=" + API_KEY + "&stdate=" + _stdate + "&eddate=" + _eddate + "&cpage=" + idx + "&rows="
					+ _rows + "&prfstate=" + prfstate);

			ArrayList<ConcertDto> concertList = new ArrayList<>();

			Document xmlDoc = getXMLInf(url.toString());
			Element root = xmlDoc.getDocumentElement();

			NodeList nodeList = root.getElementsByTagName("db");//"db"??

			if (nodeList.getLength() == 0)
				return;

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
			insertConcertInf(concertList,request);
		}

	}

	private void insertConcertInf(ArrayList<ConcertDto> concertList,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
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

			// 사진 업로드 부분(!poster.contains("kopis")??
			if (!poster.contains("kopis") || imgUpdateCheck(mt20id, poster, session)) {
				imageList = fileUtil.uploadImageFile(mt20id, imageUrlList, session);

				for (ImageDto image : imageList) {
					adminDao.insertImageInf(image);
				}
			}
		}
	}

	private boolean imgUpdateCheck(String mt20id, String poster, HttpSession session) {
		int dateIdx = poster.indexOf('_', poster.indexOf('_') + 1) + 1;
		String uploadDate = poster.substring(dateIdx, dateIdx + 6);

		ArrayList<ImageDto> imageList = (ArrayList<ImageDto>) adminDao.imgUpdateCheck(mt20id);

		// 존재하는 경우 Insert가 한번이라도 이루어진 정보
		if (imageList.size() > 0) {
			// 최신 정보와 DB 정보가 동일 할 경우 false Return , 동일하지 않을 경우 기존 DB 파일 삭제후 true Return
			if (uploadDate.equals(imageList.get(0).getUploadDate()))
				return false;
			else {
				fileUtil.deleteImageFile(imageList, session);
				adminDao.deleteImageInf(imageList.get(0).getMt20id());

				return true;
			}
		}
		return true;
	}

	@Override
	public void getPlaceInf() {
		ArrayList<PlaceDto> placeList = null;

		StringBuffer url = new StringBuffer("http://kopis.or.kr/openApi/restful/prfplc");
		int cpage = 1;
		int rows = Integer.MAX_VALUE;

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
	
				String mt13cnt = dbElement.getElementsByTagName("mt13cnt").item(0).getTextContent();
				String fcltychartr = dbElement.getElementsByTagName("fcltychartr").item(0).getTextContent();
				String opende = dbElement.getElementsByTagName("opende").item(0).getTextContent();
				String seatscale = dbElement.getElementsByTagName("seatscale").item(0).getTextContent();
				String telno = dbElement.getElementsByTagName("telno").item(0).getTextContent();
				String relateurl = dbElement.getElementsByTagName("relateurl").item(0).getTextContent();
				String adres = dbElement.getElementsByTagName("adres").item(0).getTextContent();
				String la = dbElement.getElementsByTagName("la").item(0).getTextContent();
				String lo = dbElement.getElementsByTagName("lo").item(0).getTextContent();

				place.setDetail(mt13cnt, fcltychartr, opende, seatscale, telno, relateurl, adres, la, lo);
				adminDao.insertPlaceInf(place);
			} catch (Exception e) {
			}
		}
	}
	
	@Override
	@Scheduled(cron="0 00 01 * * *")
	// 오전 1시에 박스오피스 정보 업데이트 되도록 스케쥴러 설정
	public void getBoxofficeInf() {
		// {연극, 뮤지컬, 클래식&오페라, 무용&발레, 국악&복합}
		String[] catecodeArr = { "YK", "MU", "CCO", "MMB", "KKB" };
		String ststype = "week";
//		String ststype = "month";

		try {
			// 주간 오피스 최대 순위 20위 But. 분야에 따라 20위까지 안뜨는 경우가 있음.
			adminDao.deleteBoxofInf();
			for (String catecode : catecodeArr) {
				StringBuffer url = new StringBuffer("http://www.kopis.or.kr/openApi/restful/boxWeekMonthly");
				url.append("?service=" + API_KEY + "&ststype=" + ststype + "&catecode=" + catecode);

				Document xmlDoc = getXMLInf(url.toString());
				Element root = xmlDoc.getDocumentElement();

				NodeList nodeList = root.getElementsByTagName("boxof");

				for (int i = 0; i < nodeList.getLength(); i++) {
					Node boxofNode = nodeList.item(i);
					Element boxofElement = (Element) boxofNode;

					String area = boxofElement.getElementsByTagName("area").item(0).getTextContent();
					String prfdtcnt = boxofElement.getElementsByTagName("prfdtcnt").item(0).getTextContent();
					String nmrs = boxofElement.getElementsByTagName("nmrs").item(0).getTextContent();
					String prfpd = boxofElement.getElementsByTagName("prfpd").item(0).getTextContent();
					String cate = boxofElement.getElementsByTagName("cate").item(0).getTextContent();
					String prfplcnm = boxofElement.getElementsByTagName("prfplcnm").item(0).getTextContent();
					String prfnm = boxofElement.getElementsByTagName("prfnm").item(0).getTextContent();
					int rnum = Integer.parseInt(boxofElement.getElementsByTagName("rnum").item(0).getTextContent());
					String mt20id = boxofElement.getElementsByTagName("mt20id").item(0).getTextContent();

					adminDao.insertBoxofInf(
							new BoxofficeDto(area, prfdtcnt, nmrs, prfpd, cate, prfplcnm, prfnm, rnum, catecode, mt20id));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
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

	
	@Override
	public List<ConcertDto> selectConcert(PagingDto paging) {
		return adminDao.selectConcert(paging);
	}

	@Override
	public int selectTotalConcert(PagingDto paging) {
		return adminDao.selectTotalConcert(paging);
	}

	@Override
	public List<PlaceDto> selectPlace(PagingDto paging) {
		return adminDao.selectPlace(paging);
	}

	@Override
	public int selectTotalPlace(PagingDto paging) {
		return adminDao.selectTotalPlace(paging);
	}

	@Override
	public Map<String, List<BoxofficeDto>> selectBoxoffice() {
		Map<String, List<BoxofficeDto>> map = new HashMap<>();
		String[] catecodeArr = { "YK", "MU", "CCO", "MMB", "KKB" };
		
		for(String catecode : catecodeArr)
			map.put(catecode, adminDao.selectBoxoffice(catecode));
		
		return map;
	}

	@Override
	public List<LoginDto> selectMember(PagingDto paging) {
		return adminDao.selectMember(paging);
	}

	@Override
	public int selectTotalMember(PagingDto paging) {
		return adminDao.selectTotalMember(paging);
	}

	@Override
	public void changeGrade(LoginDto member) {
		adminDao.changeGrade(member);
	}

	@Override
	public List<CommentDto> selectComment(PagingDto paging) {
		return adminDao.selectComment(paging);
	}

	@Override
	public int selectTotalComment(PagingDto paging) {
		return adminDao.selectTotalComment(paging);
	}

	@Override
	public void deleteComment(int commentNum) {
		adminDao.deleteComment(commentNum);
	}
}
