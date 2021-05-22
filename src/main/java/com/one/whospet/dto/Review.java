package com.one.whospet.dto;

import java.util.Date;

public class Review {
	private int rNo;
	private int uNo;
	private int hNo;
	private Date rDate;
	private String rContent;
	private String rStar;
	@Override
	public String toString() {
		return "Review [rNo=" + rNo + ", uNo=" + uNo + ", hNo=" + hNo + ", rDate=" + rDate + ", rContent=" + rContent
				+ ", rStar=" + rStar + "]";
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
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
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrStar() {
		return rStar;
	}
	public void setrStar(String rStar) {
		this.rStar = rStar;
	}
	
	
}
