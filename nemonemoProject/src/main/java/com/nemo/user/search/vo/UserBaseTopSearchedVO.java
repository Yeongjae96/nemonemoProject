package com.nemo.user.search.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserBaseTopSearchedVO {
	private int topSearchedNo;
	private String topSearchedKeyword;
	private Date topSearchedRegYmd;
	private int topSearchedCnt;
}
