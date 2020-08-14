package com.nemo.user.store.vo;


import java.sql.Date;

import lombok.Data;

@Data

public class StoreVO{
	private int userNo;
	private int storeNo;
	private String userEmail;
	private String userPw;
	private String userGender;
	private String userName;
	private String userPhone;
	private String userAccount;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;
	private String userStatus;
	private String userLoginFlag;
	private Date userWithdrawYmd;
	private String userAuthCheck;
	private Date userRegYmd;
	private int storeImgNo;
	private String storeName;
	private String storeIntro;
	private int storeRating;
}
