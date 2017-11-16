package com.pknu.pass.admin.service;

import javax.servlet.http.HttpSession;

public interface AdminService {
	void getConertInf(HttpSession session) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf(String ststype, String catecode);
}
