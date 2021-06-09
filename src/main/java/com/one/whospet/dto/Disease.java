package com.one.whospet.dto;

public class Disease {
	
	private int dNo;
	private String dCategory;
	private int dQNo;
	private String dQuestion;
	private String dQSymptom;
	private String dResult;
	private String dRExplain;
	private String dEMain;
	private String dTreatment;
	@Override
	public String toString() {
		return "Disease [dNo=" + dNo + ", dCategory=" + dCategory + ", dQNo=" + dQNo + ", dQuestion=" + dQuestion
				+ ", dQSymptom=" + dQSymptom + ", dResult=" + dResult + ", dRExplain=" + dRExplain + ", dEMain="
				+ dEMain + ", dTreatment=" + dTreatment + "]";
	}
	public int getdNo() {
		return dNo;
	}
	public void setdNo(int dNo) {
		this.dNo = dNo;
	}
	public String getdCategory() {
		return dCategory;
	}
	public void setdCategory(String dCategory) {
		this.dCategory = dCategory;
	}
	public int getdQNo() {
		return dQNo;
	}
	public void setdQNo(int dQNo) {
		this.dQNo = dQNo;
	}
	public String getdQuestion() {
		return dQuestion;
	}
	public void setdQuestion(String dQuestion) {
		this.dQuestion = dQuestion;
	}
	public String getdQSymptom() {
		return dQSymptom;
	}
	public void setdQSymptom(String dQSymptom) {
		this.dQSymptom = dQSymptom;
	}
	public String getdResult() {
		return dResult;
	}
	public void setdResult(String dResult) {
		this.dResult = dResult;
	}
	public String getdRExplain() {
		return dRExplain;
	}
	public void setdRExplain(String dRExplain) {
		this.dRExplain = dRExplain;
	}
	public String getdEMain() {
		return dEMain;
	}
	public void setdEMain(String dEMain) {
		this.dEMain = dEMain;
	}
	public String getdTreatment() {
		return dTreatment;
	}
	public void setdTreatment(String dTreatment) {
		this.dTreatment = dTreatment;
	}
	
	
	
}
