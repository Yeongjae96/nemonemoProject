package com.nemo.user.sign.signup.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 유저 객체
 * @패키지이름 : com.nemo.user.sign.signup.vo
 * @파일이름 : UserVO.java
 * @작성일 : 2020. 7. 31.
 * @이름 : Yeong ,Dong
 * @프로그램설명 : 
 * == 수정 정보 ==
 *
 */
@Data
public class UserBaseVO {
   private int userNo;
   private int storeNo;
   private int storeImgNo;
   private int storeRating;
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
   private String userAuthCheck;
   private String storeName;
   private String storeIntro;
   private Date userWithdrawYmd;
   private Date userRegYmd;
   private String userTermsAgreeFl;
}