package com.one.whospet.dto;

import java.util.Date;

public class Hospital {
	private int hNo;
	private int uNo;
	private String hAdcheck;
	private String hName;
	private String hRoadAddress;
	private String hDetailAddress;
	private String hHour;
	private String hTel;
	private String hInfo;
	private Date hRequestDate;
	private Date hEnrollDate;
	private int hHit;
	
	@Override
	public String toString() {
		return "Hospital [hNo=" + hNo + ", uNo=" + uNo + ", hAdcheck=" + hAdcheck + ", hName=" + hName
				+ ", hRoadAddress=" + hRoadAddress + ", hDetailAddress=" + hDetailAddress + ", hHour=" + hHour
				+ ", hTel=" + hTel + ", hInfo=" + hInfo + ", hRequestDate=" + hRequestDate + ", hEnrollDate="
				+ hEnrollDate + ", hHit=" + hHit + "]";
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String gethAdcheck() {
		return hAdcheck;
	}
	public void sethAdcheck(String hAdcheck) {
		this.hAdcheck = hAdcheck;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethRoadAddress() {
		return hRoadAddress;
	}
	public void sethRoadAddress(String hRoadAddress) {
		this.hRoadAddress = hRoadAddress;
	}
	public String gethDetailAddress() {
		return hDetailAddress;
	}
	public void sethDetailAddress(String hDetailAddress) {
		this.hDetailAddress = hDetailAddress;
	}
	public String gethHour() {
		return hHour;
	}
	public void sethHour(String hHour) {
		this.hHour = hHour;
	}
	public String gethTel() {
		return hTel;
	}
	public void sethTel(String hTel) {
		this.hTel = hTel;
	}
	public String gethInfo() {
		return hInfo;
	}
	public void sethInfo(String hInfo) {
		this.hInfo = hInfo;
	}
	public Date gethRequestDate() {
		return hRequestDate;
	}
	public void sethRequestDate(Date hRequestDate) {
		this.hRequestDate = hRequestDate;
	}
	public Date gethEnrollDate() {
		return hEnrollDate;
	}
	public void sethEnrollDate(Date hEnrollDate) {
		this.hEnrollDate = hEnrollDate;
	}
	public int gethHit() {
		return hHit;
	}
	public void sethHit(int hHit) {
		this.hHit = hHit;
	}
	
	
	
}
