package com.pknu.pass.play.dto;

public class BookmarkDto {
	private String id;
	private String mt20id;
	private int value;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "Bookmark [id=" + id + ", mt20id=" + mt20id + ", value=" + value + "]";
	}
}