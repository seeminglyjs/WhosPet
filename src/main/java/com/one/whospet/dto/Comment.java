package com.one.whospet.dto;

import java.util.Date;

public class Comment {

	private int cNo;
	private String cContent;
	private Date cWriteDate;
	private int bNo;
	private int uNo;
	
	@Override
	public String toString() {
		return "Comment [bNo=" + bNo + ", cContent=" + cContent + ", cNo=" + cNo + ", cWriteDate=" + cWriteDate
				+ ", uNo=" + uNo + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcWriteDate() {
		return cWriteDate;
	}

	public void setcWriteDate(Date cWriteDate) {
		this.cWriteDate = cWriteDate;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
}
