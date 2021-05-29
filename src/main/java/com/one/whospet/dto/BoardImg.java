package com.one.whospet.dto;

public class BoardImg {
	private int biNo;
	private int bNo;
	private String biOriginFilename;
	private String biStoredFilename;
	private long biSize;
	private String biContentType;
	
	@Override
	public String toString() {
		return "BoardImg [biNo=" + biNo + ", bNo=" + bNo + ", biOriginFilename=" + biOriginFilename
				+ ", biStoredFilename=" + biStoredFilename + ", biSize=" + biSize + ", biContentType=" + biContentType
				+ "]";
	}
	public int getBiNo() {
		return biNo;
	}
	public void setBiNo(int biNo) {
		this.biNo = biNo;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getBiOriginFilename() {
		return biOriginFilename;
	}
	public void setBiOriginFilename(String biOriginFilename) {
		this.biOriginFilename = biOriginFilename;
	}
	public String getBiStoredFilename() {
		return biStoredFilename;
	}
	public void setBiStoredFilename(String biStoredFilename) {
		this.biStoredFilename = biStoredFilename;
	}
	public long getBiSize() {
		return biSize;
	}
	public void setBiSize(long biSize) {
		this.biSize = biSize;
	}
	public String getBiContentType() {
		return biContentType;
	}
	public void setBiContentType(String biContentType) {
		this.biContentType = biContentType;
	}

}
