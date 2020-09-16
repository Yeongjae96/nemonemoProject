package com.nemo.admin.transaction.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TransactionVo {
	private int purchaseNo;
	private int orderNo;
	private int productNo;
	private int productSeller;
	private String productName;
	private int purchasePrice;
	private Date puchaseDt;
	private int purchaseShFee;
	private String purchaseWay;
	private String purchasePaySt;
	private int buyerNo;
	private String buyerName;
	private String buyerPhone;
	private String buyerEmail;
	private String buyerZipcode;
	private String buyerAddress;
}
