package com.pknu.pass.play.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

public interface PlayService {

	public void playMain(Model model);
	public ArrayList<String> getChange(String type);
	
}
