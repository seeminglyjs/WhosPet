package com.one.whospet.dto;

import java.util.Date;

public class Payment {
    private int pyNo;                       
    private int uNo;                       
    private int sNo;                      
    private int siNo;                   
    private int poNo;                  
    private Date pyDate;                 
    private String pyAddress;               
    private String pyStatus;              
    private int pyAmount;                   
    private int pyCard;                     
    private String pyApplyNum;               
    private String impUid;                    
    private String merchantUid;     
    private Shop shop;
	@Override
	public String toString() {
		return "Payment [pyNo=" + pyNo + ", uNo=" + uNo + ", sNo=" + sNo + ", siNo=" + siNo + ", poNo=" + poNo
				+ ", pyDate=" + pyDate + ", pyAddress=" + pyAddress + ", pyStatus=" + pyStatus + ", pyAmount="
				+ pyAmount + ", pyCard=" + pyCard + ", pyApplyNum=" + pyApplyNum + ", impUid=" + impUid
				+ ", merchantUid=" + merchantUid + ", shop=" + shop + "]";
	}
	public int getPyNo() {
		return pyNo;
	}
	public void setPyNo(int pyNo) {
		this.pyNo = pyNo;
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
	public int getPoNo() {
		return poNo;
	}
	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	public Date getPyDate() {
		return pyDate;
	}
	public void setPyDate(Date pyDate) {
		this.pyDate = pyDate;
	}
	public String getPyAddress() {
		return pyAddress;
	}
	public void setPyAddress(String pyAddress) {
		this.pyAddress = pyAddress;
	}
	public String getPyStatus() {
		return pyStatus;
	}
	public void setPyStatus(String pyStatus) {
		this.pyStatus = pyStatus;
	}
	public int getPyAmount() {
		return pyAmount;
	}
	public void setPyAmount(int pyAmount) {
		this.pyAmount = pyAmount;
	}
	public int getPyCard() {
		return pyCard;
	}
	public void setPyCard(int pyCard) {
		this.pyCard = pyCard;
	}
	public String getPyApplyNum() {
		return pyApplyNum;
	}
	public void setPyApplyNum(String pyApplyNum) {
		this.pyApplyNum = pyApplyNum;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
    
}
