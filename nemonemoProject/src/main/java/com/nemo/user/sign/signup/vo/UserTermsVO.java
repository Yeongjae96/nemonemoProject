package com.nemo.user.sign.signup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserTermsVO{
	private int termsHistNo;
	private int termNo;
	private int userNo;
	private String termAgreeFl;
	private Date termAgreeYmd;
  
}
