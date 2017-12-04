package com.pknu.pass.comment.dto;

public class CommentDto {

	private int commentNum; 
	private String id;    
	private String commentContent;  
	private String commentDate ;  
	private String mt20id;

	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	
	
	
	@Override
	public String toString() {
		return "CommentDto [commentNum=" + commentNum + ", id=" + id + ", commentContent=" + commentContent
				+ ", commentDate=" + commentDate + ", mt20id=" + mt20id + "]";
	}

	


	
	
	
	
}
