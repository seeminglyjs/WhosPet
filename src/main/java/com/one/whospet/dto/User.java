package com.one.whospet.dto;

import java.util.Date;

public class User {

	private int uNo;
	private String uGrade;
	private String uId;
	private String uPw;
	private String uName;
	private String uPhone;
	private String uNick;
	private String uEmail;
	private String uAddress;
	private int uPost;
	private String uDetailAddress;
	private String uPet;
	private Date uJoinDate;
	
	@Override
	public String toString() {
		return "User [uNo=" + uNo + ", uGrade=" + uGrade + ", uId=" + uId + ", uPw=" + uPw + ", uName=" + uName
				+ ", uPhone=" + uPhone + ", uNick=" + uNick + ", uEmail=" + uEmail + ", uAddress=" + uAddress
				+ ", uPost=" + uPost + ", uDetailAddress=" + uDetailAddress + ", uPet=" + uPet + ", uJoinDate="
				+ uJoinDate + "]";
	}
	
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getuGrade() {
		return uGrade;
	}
	public void setuGrade(String uGrade) {
		this.uGrade = uGrade;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public int getuPost() {
		return uPost;
	}
	public void setuPost(int uPost) {
		this.uPost = uPost;
	}
	public String getuDetailAddress() {
		return uDetailAddress;
	}
	public void setuDetailAddress(String uDetailAddress) {
		this.uDetailAddress = uDetailAddress;
	}
	public String getuPet() {
		return uPet;
	}
	public void setuPet(String uPet) {
		this.uPet = uPet;
	}
	public Date getuJoinDate() {
		return uJoinDate;
	}
	public void setuJoinDate(Date uJoinDate) {
		this.uJoinDate = uJoinDate;
	}
	
	
	
}
