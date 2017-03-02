package com.music.entity;

public class UserWithBLOBs extends User {
	private String userImg;

	private String userDetail;

	private Address province;

	private Address city;

	private Address district;

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(String userDetail) {
		this.userDetail = userDetail;
	}

	public Address getProvince() {
		return province;
	}

	public void setProvince(Address province) {
		this.province = province;
	}

	public Address getCity() {
		return city;
	}

	public void setCity(Address city) {
		this.city = city;
	}

	public Address getDistrict() {
		return district;
	}

	public void setDistrict(Address district) {
		this.district = district;
	}

}