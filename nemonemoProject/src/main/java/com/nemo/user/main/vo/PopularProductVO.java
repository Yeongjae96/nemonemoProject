package com.nemo.user.main.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

import lombok.Data;

@Data
public class PopularProductVO {
	private int productNo;
	private int productImgNo;
	private int productSeller;
	private int productCateNo;
	private String productName;
	private String productDealArea;
	private String productUsedSt;
	private String productDispSt;
	private String productExchSt;
	private Date productSoldDt;
	private String productFreeShippingSt;
	private int productPrice;
	private String productInfo;
	private String productTag;
	private int productQty;
	private Timestamp productRegDt;
	private Date productEditDt;
	private int productView;
	private int adminRegId;
	private int adminEditId;
	private String productCateType;
	private String productCateLarge;
	private String productCateMedium;
	private String productCateSmall;
	private String productCateDelFl;
	private int productCateOrder;
	private Date productCateRegYmd;
	private Date productCateEditYmd;
}
