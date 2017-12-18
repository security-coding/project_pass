package com.pknu.pass.common.util;

import com.pknu.pass.play.dto.ImageDto;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * The type File util.
 */
@Component
public class FileUtil {

    private String webPath;

    /**
     * Upload image file array list.
     *
     * @param mt20id    the mt20id
     * @param imagesURL the images url
     * @param session   the session
     * @return the array list
     */
    public ArrayList<ImageDto> uploadImageFile(String mt20id, List<String> imagesURL, HttpSession session) {
        // Server 내의 Webapp Resources 폴더 경로
        webPath = session.getServletContext().getRealPath("");

        String uploadPath;
        String filePath;
        ArrayList<ImageDto> imageList;

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
                        filePath = File.separator + "resources" + File.separator + "upload" + File.separator + "poster" + File.separator + fileName;
                        uploadPath = webPath + filePath;
                        ImageIO.write(img, extension, new File(uploadPath));
                        imageList.add(new ImageDto(mt20id, filePath, ImageDto.POSTER, uploadDate));
                    } else if (imgUrl.contains("pfmIntroImage")) {
                        filePath = File.separator + "resources" + File.separator + "upload" + File.separator + "introImage" + File.separator + fileName;
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

    /**
     * Delete image file.
     *
     * @param imageList the image list
     * @param session   the session
     */
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


    /**
     * Upload image file list.
     *
     * @param mt20id  the mt 20 id
     * @param request the request
     * @return the list
     */
    public List<ImageDto> uploadImageFile(String mt20id, HttpServletRequest request) {
        int cnt = 0;
        String filePath;
        String fileName;
        String originFileName;
        String extension;
        boolean isPoster = true;

        List<ImageDto> list = new ArrayList<>();

        webPath = request.getServletContext().getRealPath("");
        MultipartRequest mRequest = (MultipartRequest) request;
        MultipartFile multipartFile;

        Iterator<String> iterator = sortedIterator(mRequest.getFileNames());

        Date now = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");
        String uploadDate = simpleDateFormat.format(now);

        while (iterator.hasNext()) {
            multipartFile = mRequest.getFile(iterator.next());
            if (!multipartFile.isEmpty()) {
                originFileName = multipartFile.getOriginalFilename();
                extension = originFileName.substring(originFileName.lastIndexOf('.'));

                fileName = mt20id + "_" + uploadDate + "_" + cnt++;
                if (isPoster) {
                    isPoster = false;

                    filePath = "/resources" + File.separator + "upload" + File.separator + "poster" + File.separator;

                    File file = new File(webPath + filePath + fileName + extension);
                    try {
                        multipartFile.transferTo(file);
                        list.add(new ImageDto(mt20id, filePath + fileName + extension, ImageDto.POSTER, uploadDate));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    filePath = "/resources" + File.separator + "upload" + File.separator + "introImage" + File.separator;

                    File file = new File(webPath + filePath + fileName + extension);
                    try {
                        multipartFile.transferTo(file);
                        list.add(new ImageDto(mt20id, filePath + fileName + extension, ImageDto.INTRO_IMAGE, uploadDate));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return list;
    }

    private Iterator<String> sortedIterator(Iterator<String> iterator) {
        List<String> list = new ArrayList<>();

        while (iterator.hasNext())
            list.add(iterator.next());
        Collections.sort(list);

        return list.iterator();
    }
}
