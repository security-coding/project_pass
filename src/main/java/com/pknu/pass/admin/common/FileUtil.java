package com.pknu.pass.admin.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.pknu.pass.play.dto.ImageDto;

@Component
public class FileUtil {

	private String saveDir;

	public ArrayList<ImageDto> upload(String mt20id, List<String> imagesURL, HttpSession session) {
		// Server 내의 Webapp Resources 폴더 경로
		saveDir = session.getServletContext().getRealPath("/resources/upload/");

		String uploadPath = null;
		ArrayList<ImageDto> imageList = null;
		
		try {
			imageList = new ArrayList<>();
			for (String imgUrl : imagesURL) {
				URL url = new URL(imgUrl);
				
				String fileName = imgUrl.substring(imgUrl.lastIndexOf('/') + 1, imgUrl.length());
				String extension = imgUrl.substring(imgUrl.lastIndexOf('.') + 1, imgUrl.length());
				BufferedImage img = ImageIO.read(url);

				if (imgUrl.contains("pfmPoster")) {
					uploadPath = saveDir + "poster";
					ImageIO.write(img, extension, new File(uploadPath + File.separator + fileName));
					imageList.add(new ImageDto(mt20id,fileName,ImageDto.POSTER));
				} else if (imgUrl.contains("pfmIntroImage")) {
					uploadPath = saveDir + "introImage";
					ImageIO.write(img, extension, new File(uploadPath + File.separator + fileName));
					imageList.add(new ImageDto(mt20id,fileName,ImageDto.INTRO_IMAGE));
				}
			}
			return imageList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
