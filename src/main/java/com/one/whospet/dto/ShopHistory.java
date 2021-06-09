package com.one.whospet.dto;

import java.util.Date;

public class ShopHistory {
	 private int shNo;
	 private int sNo;			
	 private int uNo; 			
	 private int pyNo;
	 private int shAmount; 			
	 private Date shDate;			
	 private String shStatus;
	 private Shop shop;
	 private Payment payment;
	@Override
	public String toString() {
		return "ShopHistory [shNo=" + shNo + ", sNo=" + sNo + ", uNo=" + uNo + ", pyNo=" + pyNo + ", shAmount="
				+ shAmount + ", shDate=" + shDate + ", shStatus=" + shStatus + ", shop=" + shop + ", payment=" + payment
				+ "]";
	}
	public int getShNo() {
		return shNo;
	}
	public void setShNo(int shNo) {
		this.shNo = shNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getPyNo() {
		return pyNo;
	}
	public void setPyNo(int pyNo) {
		this.pyNo = pyNo;
	}
	public int getShAmount() {
		return shAmount;
	}
	public void setShAmount(int shAmount) {
		this.shAmount = shAmount;
	}
	public Date getShDate() {
		return shDate;
	}
	public void setShDate(Date shDate) {
		this.shDate = shDate;
	}
	public String getShStatus() {
		return shStatus;
	}
	public void setShStatus(String shStatus) {
		this.shStatus = shStatus;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	 
	 
	 
}
