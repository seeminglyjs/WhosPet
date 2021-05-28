package com.one.whospet.dto;

import java.util.Date;

public class Point {
	private int poNo;	
	private int uNo;
	private int sNo;	
	private int poPlus;	
	private int poMinus;	
	private String poPlusY;	
	private String poMinusY;		
	private Date poDate;		
	private int poSum;
	@Override
	public String toString() {
		return "Point [poNo=" + poNo + ", uNo=" + uNo + ", sNo=" + sNo + ", poPlus=" + poPlus + ", poMinus=" + poMinus
				+ ", poPlusY=" + poPlusY + ", poMinusY=" + poMinusY + ", pdDate=" + poDate + ", poSum=" + poSum + "]";
	}
	public int getPoNo() {
		return poNo;
	}
	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getPoPlus() {
		return poPlus;
	}
	public void setPoPlus(int poPlus) {
		this.poPlus = poPlus;
	}
	public int getPoMinus() {
		return poMinus;
	}
	public void setPoMinus(int poMinus) {
		this.poMinus = poMinus;
	}
	public String getPoPlusY() {
		return poPlusY;
	}
	public void setPoPlusY(String poPlusY) {
		this.poPlusY = poPlusY;
	}
	public String getPoMinusY() {
		return poMinusY;
	}
	public void setPoMinusY(String poMinusY) {
		this.poMinusY = poMinusY;
	}
	public Date getPoDate() {
		return poDate;
	}
	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}
	public int getPoSum() {
		return poSum;
	}
	public void setPoSum(int poSum) {
		this.poSum = poSum;
	}
	
	
}
