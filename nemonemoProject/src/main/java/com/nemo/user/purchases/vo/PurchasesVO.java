package com.nemo.user.purchases.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class PurchasesVO {
	private int purchaseNo;
	private int orderNo;
	private int productNo;
	private int purchasePrice;
	private Date puchaseDt;
	private int purchaseShFee;
	private String purchaseWay;
	private String productName;
	private String buyerName;
	private String buyerPhone;
	private String buyerEmail;
	private String buyerZipcode;
	private String buyerAddress;
}
