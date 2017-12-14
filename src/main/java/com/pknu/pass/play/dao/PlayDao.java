package com.pknu.pass.play.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BookmarkDto;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayDao {

    //상영예정
    ArrayList<MainDto> getNextPoster(HashMap<String, String> stNum);

    ArrayList<MainDto> getAllNextPoster(String stNum);

    //상영중
    ArrayList<MainDto> getNowNextPoster(HashMap<String, String> stNum);

    ArrayList<MainDto> getNowAllNextPoster(String stNum);

    //상세페이지
    ArrayList<String> getDetailPoster(String mt20id);


    DetailDto getDetailInf(String mt20id);

    //좋아요
    void getLikes(HashMap<String, String> likes);

    String changeLikes(HashMap<String, String> paramMap);

    void delLikes(HashMap<String, String> likes);

    //좋아요 내 카운트 기능

    int likesCount(HashMap<String, String> likes);

    //검색
    ArrayList<DetailDto> getsearch(String keyword);

    //지도
    ArrayList<PlaceDto> getNearMap(HashMap<String, String> lalo);

    //박스오피스
    ArrayList<MainBoxofficeDto> getBoxOffice();

    ArrayList<MainBoxofficeDto> getBoxChange(String cateCode);

    //북마크
    void insertBookmark(BookmarkDto bookmark);

    void deleteBookmark(BookmarkDto bookmark);

    int getBookmark(HashMap<String, String> paramMap);

}
