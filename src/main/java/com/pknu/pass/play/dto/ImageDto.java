package com.pknu.pass.play.dto;

public class ImageDto {
	public static final int POSTER = 1;
	public static final int INTRO_IMAGE = 2;
	
	private String mt20id;
	private String fileName;
	private int imageType;
	
	public ImageDto() {}
	
	public ImageDto(String mt20id, String fileName, int identify) {
		super();
		this.mt20id = mt20id;
		this.fileName = fileName;
		this.imageType = identify;
	}
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getImageType() {
		return imageType;
	}

	public void setImageType(int imageType) {
		this.imageType = imageType;
	}
	
	
	
}
