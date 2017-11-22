package com.pknu.pass.play.dto;

public class ImageDto {
	public static final int POSTER = 1;
	public static final int INTRO_IMAGE = 2;
	
	private String mt20id;
	private String imageUrl;
	private int imageType;
	private String uploadDate;
	
	public ImageDto() {}
	
	public ImageDto(String mt20id, String imageUrl, int identify) {
		super();
		this.mt20id = mt20id;
		this.imageUrl = imageUrl;
		this.imageType = identify;
	}
	
	public ImageDto(String mt20id, String imageUrl, int identify, String uploadDate) {
		super();
		this.mt20id = mt20id;
		this.imageUrl = imageUrl;
		this.imageType = identify;
		this.uploadDate = uploadDate;
	}
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}


	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getImageType() {
		return imageType;
	}

	public void setImageType(int imageType) {
		this.imageType = imageType;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "ImageDto [mt20id=" + mt20id + ", imageUrl=" + imageUrl + ", imageType=" + imageType + ", uploadDate="
				+ uploadDate + "]";
	}
		
}
