package com.music.entity;

import java.util.List;

public class Album {
	private Integer albumId;

	private Integer singerId;

	private Singer singer;

	private String albumName;

	private Integer issueCompany;

	private RecordCompany company;

	private String issueTime;

	private String albumImg;

	private String albumDetail;

	private List<Song> songs;

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public Integer getSingerId() {
		return singerId;
	}

	public void setSingerId(Integer singerId) {
		this.singerId = singerId;
	}

	public String getAlbumName() {
		return albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	public Integer getIssueCompany() {
		return issueCompany;
	}

	public void setIssueCompany(Integer issueCompany) {
		this.issueCompany = issueCompany;
	}

	public String getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}

	public String getAlbumImg() {
		return albumImg;
	}

	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
	}

	public String getAlbumDetail() {
		return albumDetail;
	}

	public void setAlbumDetail(String albumDetail) {
		this.albumDetail = albumDetail;
	}

	public Singer getSinger() {
		return singer;
	}

	public void setSinger(Singer singer) {
		this.singer = singer;
	}

	public List<Song> getSongs() {
		return songs;
	}

	public void setSongs(List<Song> songs) {
		this.songs = songs;
	}

	public RecordCompany getCompany() {
		return company;
	}

	public void setCompany(RecordCompany company) {
		this.company = company;
	}
}