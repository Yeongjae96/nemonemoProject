package com.nemo.admin.members.member.vo;

import java.sql.Date;
import lombok.Data;


@Data
public class AdminBaseMemberVO {
	
	private int userNo;
	private int storeNo;
	private String userEmail;
	private String userPw;
	private String userGender;
	private String userName;
	private String userAccount;
	private String userPhone;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;
	private String userStatus;
	private Date userWithdrawYmd;
	private String userAuthCheck;
	private Date userRegYmd;
	private int storeImgNo;
	private String storeName;
	private String storeIntro;
	private int storeRating;
	
	
}
