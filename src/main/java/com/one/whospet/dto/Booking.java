package com.one.whospet.dto;

import java.util.Date;

public class Booking {
	private int bookNo;
	private int uNo;
	private int hNo;
	private String bookStatus;
	private Date bookDate;
	private String bookHour;
	private String bookPetInfo;
	private String bookText;
	private Hospital hospital;
	@Override
	public String toString() {
		return "Booking [bookNo=" + bookNo + ", uNo=" + uNo + ", hNo=" + hNo + ", bookStatus=" + bookStatus
				+ ", bookDate=" + bookDate + ", bookHour=" + bookHour + ", bookPetInfo=" + bookPetInfo + ", bookText="
				+ bookText + ", hospital=" + hospital + "]";
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	public String getBookHour() {
		return bookHour;
	}
	public void setBookHour(String bookHour) {
		this.bookHour = bookHour;
	}
	public String getBookPetInfo() {
		return bookPetInfo;
	}
	public void setBookPetInfo(String bookPetInfo) {
		this.bookPetInfo = bookPetInfo;
	}
	public String getBookText() {
		return bookText;
	}
	public void setBookText(String bookText) {
		this.bookText = bookText;
	}
	public Hospital getHospital() {
		return hospital;
	}
	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}
	
	
	
}
