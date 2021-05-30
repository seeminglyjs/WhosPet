package com.one.whospet.dto;

import java.util.Date;

public class Treatment {

   private int trNo;
   private int hNo;
   private String trName;
   private String trDesc;
   private int price;
   private String trType;
      
   @Override
   public String toString() {
      return "Treatment [trNo=" + trNo + ", hNo=" + hNo + ", trName=" + trName + ", trDesc=" + trDesc + ", price="
            + price + ", trType=" + trType + "]";
   }
   public Treatment(int trNo, int hNo, String trName, String trDesc, int price, String trType) {
      super();
      this.trNo = trNo;
      this.hNo = hNo;
      this.trName = trName;
      this.trDesc = trDesc;
      this.price = price;
      this.trType = trType;
   }
   public int getTrNo() {
      return trNo;
   }
   public void setTrNo(int trNo) {
      this.trNo = trNo;
   }
   public int gethNo() {
      return hNo;
   }
   public void sethNo(int hNo) {
      this.hNo = hNo;
   }
   public String getTrName() {
      return trName;
   }
   public void setTrName(String trName) {
      this.trName = trName;
   }
   public String getTrDesc() {
      return trDesc;
   }
   public void setTrDesc(String trDesc) {
      this.trDesc = trDesc;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getTrType() {
      return trType;
   }
   public void setTrType(String trType) {
      this.trType = trType;
   }


   
   
}