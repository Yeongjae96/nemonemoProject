package com.nemo.user.store.vo;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreProductVO extends StoreVO{
	private int productNo;
	private int productSeller;
	private String productName;
	private String productDealArea;
	private String productDispSt;
	private int productPrice;
	private Date productRegDt;
}
