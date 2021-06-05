package com.one.whospet.dto;

import java.util.Date;

public class Shop {

	private int sNo;
	private int uNo;
	private String sName;
	private String sProductType;
	private int sAmount;
	private int sQuantity;
	private Date sDate;
	private String sContent;
	private String totalAmount;
	private String quantity;
	@Override
	public String toString() {
		return "Shop [sNo=" + sNo + ", uNo=" + uNo + ", sName=" + sName + ", sProductType=" + sProductType
				+ ", sAmount=" + sAmount + ", sQuantity=" + sQuantity + ", sDate=" + sDate + ", sContent=" + sContent
				+ ", totalAmount=" + totalAmount + ", quantity=" + quantity + "]";
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
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsProductType() {
		return sProductType;
	}
	public void setsProductType(String sProductType) {
		this.sProductType = sProductType;
	}
	public int getsAmount() {
		return sAmount;
	}
	public void setsAmount(int sAmount) {
		this.sAmount = sAmount;
	}
	public int getsQuantity() {
		return sQuantity;
	}
	public void setsQuantity(int sQuantity) {
		this.sQuantity = sQuantity;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	
	


}
