package com.pknu.pass.admin.service;

import javax.servlet.http.HttpSession;

public interface AdminService {
	void getConertInf(HttpSession session, String stdate, String eddate, String prfstate) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf();
}
