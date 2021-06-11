package com.one.whospet.dto;

import java.util.Date;

public class Order {

	private int oNo;
	private int uNo;
	private int sNo;
	private int pyNo;
	private String oName;
	private int oQuantity;
	private int oAmount;
	private int oTotalAmount;
	private String oSender;
	private String oRecipient;
	private String oSenderPhone;
	private String oEmail;
	private int oPostNo;
	private String oAddress;
	private String oDetailAddress;
	private Date oDate;
	private String oStatus;
	@Override
	public String toString() {
		return "Order [oNo=" + oNo + ", uNo=" + uNo + ", sNo=" + sNo + ", pyNo=" + pyNo + ", oName=" + oName
				+ ", oQuantity=" + oQuantity + ", oAmount=" + oAmount + ", oTotalAmount=" + oTotalAmount + ", oSender="
				+ oSender + ", oRecipient=" + oRecipient + ", oSenderPhone=" + oSenderPhone + ", oEmail=" + oEmail
				+ ", oPostNo=" + oPostNo + ", oAddress=" + oAddress + ", oDetailAddress=" + oDetailAddress + ", oDate="
				+ oDate + ", oStatus=" + oStatus + "]";
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
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
	public int getPyNo() {
		return pyNo;
	}
	public void setPyNo(int pyNo) {
		this.pyNo = pyNo;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public int getoQuantity() {
		return oQuantity;
	}
	public void setoQuantity(int oQuantity) {
		this.oQuantity = oQuantity;
	}
	public int getoAmount() {
		return oAmount;
	}
	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}
	public int getoTotalAmount() {
		return oTotalAmount;
	}
	public void setoTotalAmount(int oTotalAmount) {
		this.oTotalAmount = oTotalAmount;
	}
	public String getoSender() {
		return oSender;
	}
	public void setoSender(String oSender) {
		this.oSender = oSender;
	}
	public String getoRecipient() {
		return oRecipient;
	}
	public void setoRecipient(String oRecipient) {
		this.oRecipient = oRecipient;
	}
	public String getoSenderPhone() {
		return oSenderPhone;
	}
	public void setoSenderPhone(String oSenderPhone) {
		this.oSenderPhone = oSenderPhone;
	}
	public String getoEmail() {
		return oEmail;
	}
	public void setoEmail(String oEmail) {
		this.oEmail = oEmail;
	}
	public int getoPostNo() {
		return oPostNo;
	}
	public void setoPostNo(int oPostNo) {
		this.oPostNo = oPostNo;
	}
	public String getoAddress() {
		return oAddress;
	}
	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}
	public String getoDetailAddress() {
		return oDetailAddress;
	}
	public void setoDetailAddress(String oDetailAddress) {
		this.oDetailAddress = oDetailAddress;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public String getoStatus() {
		return oStatus;
	}
	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}
	
	
}
