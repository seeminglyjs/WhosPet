package com.one.whospet.dto;

public class Userpic {
	private int upicNo;
	private int uNo;
	private String upicOriname;
	private String upicStoname;
	@Override
	public String toString() {
		return "Userpic [upicNo=" + upicNo + ", uNo=" + uNo + ", upicOriname=" + upicOriname + ", upicStoname="
				+ upicStoname + "]";
	}
	public int getUpicNo() {
		return upicNo;
	}
	public void setUpicNo(int upicNo) {
		this.upicNo = upicNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getUpicOriname() {
		return upicOriname;
	}
	public void setUpicOriname(String upicOriname) {
		this.upicOriname = upicOriname;
	}
	public String getUpicStoname() {
		return upicStoname;
	}
	public void setUpicStoname(String upicStoname) {
		this.upicStoname = upicStoname;
	}
	
}
