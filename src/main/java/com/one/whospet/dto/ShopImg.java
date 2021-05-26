package com.one.whospet.dto;

public class ShopImg {
	
	private int siNo;
	private int sNo;
	private String siOriginFilename;
	private String siStoredFilename;
	
	@Override
	public String toString() {
		return "ShopImg [siNo=" + siNo + ", sNo=" + sNo + ", siOriginFilename=" + siOriginFilename
				+ ", siStoredFilename=" + siStoredFilename + "]";
	}

	public int getSiNo() {
		return siNo;
	}

	public void setSiNo(int siNo) {
		this.siNo = siNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getSiOriginFilename() {
		return siOriginFilename;
	}

	public void setSiOriginFilename(String siOriginFilename) {
		this.siOriginFilename = siOriginFilename;
	}

	public String getSiStoredFilename() {
		return siStoredFilename;
	}

	public void setSiStoredFilename(String siStoredFilename) {
		this.siStoredFilename = siStoredFilename;
	}
	
	
	
}
