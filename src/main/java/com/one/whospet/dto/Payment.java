package com.one.whospet.dto;

import java.util.Date;

public class Payment {
    private int pyNo;                       
    private int uNo;                                            
    private int poNo;                  
    private Date pyDate;                 
    private String pyStatus;              
    private int pyAmount;                   
    private String pyMethod;                     
    private String pyApplyNum;               
    private String impUid;                    
    private String merchantUid;     
    private Shop shop;
	@Override
	public String toString() {
		return "Payment [pyNo=" + pyNo + ", uNo=" + uNo + ", poNo=" + poNo + ", pyDate=" + pyDate
				+ ", pyStatus=" + pyStatus + ", pyAmount=" + pyAmount + ", pyMethod=" + pyMethod + ", pyApplyNum="
				+ pyApplyNum + ", impUid=" + impUid + ", merchantUid=" + merchantUid + ", shop=" + shop + "]";
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
	public String getPyMethod() {
		return pyMethod;
	}
	public void setPyMethod(String pyMethod) {
		this.pyMethod = pyMethod;
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
