package com.music.entity;

public class Comment {
	private Integer comId;

	private Integer userId;

	private UserWithBLOBs user;

	private Integer likeNum;

	private Integer parentId;

	private String comContent;

	private Comment parent;

	public Integer getComId() {
		return comId;
	}

	public void setComId(Integer comId) {
		this.comId = comId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(Integer likeNum) {
		this.likeNum = likeNum;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public Comment getParent() {
		return parent;
	}

	public void setParent(Comment parent) {
		this.parent = parent;
	}

	public UserWithBLOBs getUser() {
		return user;
	}

	public void setUser(UserWithBLOBs user) {
		this.user = user;
	}
}