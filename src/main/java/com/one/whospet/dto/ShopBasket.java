package com.one.whospet.dto;

public class ShopBasket {

	private int sbNo;
	private int uNo;
	private int sNo;
	private int siNo;
	private int sbAmount;
	private int sbQuantity;
	private Shop shop;
	@Override
	public String toString() {
		return "ShopBasket [sbNo=" + sbNo + ", uNo=" + uNo + ", sNo=" + sNo + ", siNo=" + siNo + ", sbAmount="
				+ sbAmount + ", sbQuantity=" + sbQuantity + ", shop=" + shop + "]";
	}
	public int getSbNo() {
		return sbNo;
	}
	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
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
	public int getSiNo() {
		return siNo;
	}
	public void setSiNo(int siNo) {
		this.siNo = siNo;
	}
	public int getSbAmount() {
		return sbAmount;
	}
	public void setSbAmount(int sbAmount) {
		this.sbAmount = sbAmount;
	}
	public int getSbQuantity() {
		return sbQuantity;
	}
	public void setSbQuantity(int sbQuantity) {
		this.sbQuantity = sbQuantity;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}	
	
	
}
