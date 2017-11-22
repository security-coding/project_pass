package com.pknu.pass.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.pknu.pass.play.dto.ImageDto;

@Component
public class FileUtil {

	private String webPath;

	public ArrayList<ImageDto> uploadImageFile(String mt20id, List<String> imagesURL, HttpSession session) {
		// Server 내의 Webapp Resources 폴더 경로
		webPath = session.getServletContext().getRealPath("");

		String uploadPath = null;
		String filePath = null;
		ArrayList<ImageDto> imageList = null;

		try {
			System.out.println(imagesURL.toString());
			imageList = new ArrayList<>();
			for (String imgUrl : imagesURL) {

				URL url = new URL(imgUrl);

				HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();

				// 접근 불가능한 웹사이트일 경우 웹사이트 자체의 URL 저장!
				if (!imgUrl.contains("kopis")) {
					imageList.add(new ImageDto(mt20id, imgUrl, ImageDto.POSTER));
				} else {
					String fileName = imgUrl.substring(imgUrl.lastIndexOf('/') + 1, imgUrl.length());
					String extension = imgUrl.substring(imgUrl.lastIndexOf('.') + 1, imgUrl.length());

					int dateIdx = imgUrl.indexOf('_', imgUrl.indexOf('_') + 1) + 1; // 날짜 위치 부분 추출을 위한 계산
					String uploadDate = imgUrl.substring(dateIdx, dateIdx + 6); // 'YYMMDD'형식의 날짜

					BufferedImage img = ImageIO.read(url.openStream());

					if (imgUrl.contains("pfmPoster")) {
						filePath = "/resources/upload/poster" + File.separator + fileName;
						uploadPath = webPath + filePath;
						ImageIO.write(img, extension, new File(uploadPath));
						imageList.add(new ImageDto(mt20id, filePath, ImageDto.POSTER, uploadDate));
					} else if (imgUrl.contains("pfmIntroImage")) {
						filePath = "/resources/upload/introImage" + File.separator + fileName;
						uploadPath = webPath + filePath;
						ImageIO.write(img, extension, new File(uploadPath));
						imageList.add(new ImageDto(mt20id, filePath, ImageDto.INTRO_IMAGE, uploadDate));
					}
				}
			}
			System.out.println(imageList.size());
			return imageList;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void deleteImageFile(ArrayList<ImageDto> imageList, HttpSession session) {
		webPath = session.getServletContext().getRealPath("");
		for (ImageDto image : imageList) {
			File file = new File(webPath + image.getImageUrl());

			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				} else {
					System.out.println("파일삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
		}
	}
}
