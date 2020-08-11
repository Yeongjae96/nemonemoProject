package com.nemo.user.sign.signup.vo;

import java.sql.Date;

/**
 * @제목 : 유저 객체
 * @패키지이름 : com.nemo.user.sign.signup.vo
 * @파일이름 : UserVO.java
 * @작성일 : 2020. 7. 31.
 * @이름 : Yeong
 * @프로그램설명 : 
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public class UserVO {
	private int userNo;
	private String userEmail;
	private String userPw;
	private String userGender;
	private String userName;
	private String userStoreName;
	private String userPhone;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;
	private String userStatus;
	private Date userWithdrawYmd;
	private String userAuthFlag;
	private Date userJoinYmd;
	private Date userLastVisitDate;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserStoreName() {
		return userStoreName;
	}
	public void setUserStoreName(String userStoreName) {
		this.userStoreName = userStoreName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress1() {
		return userAddress1;
	}
	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}
	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public Date getUserWithdrawYmd() {
		return userWithdrawYmd;
	}
	public void setUserWithdrawYmd(Date userWithdrawYmd) {
		this.userWithdrawYmd = userWithdrawYmd;
	}
	public String getUserAuthFlag() {
		return userAuthFlag;
	}
	public void setUserAuthFlag(String userAuthFlag) {
		this.userAuthFlag = userAuthFlag;
	}
	public Date getUserJoinYmd() {
		return userJoinYmd;
	}
	public void setUserJoinYmd(Date userJoinYmd) {
		this.userJoinYmd = userJoinYmd;
	}
	public Date getUserLastVisitDate() {
		return userLastVisitDate;
	}
	public void setUserLastVisitDate(Date userLastVisitDate) {
		this.userLastVisitDate = userLastVisitDate;
	}
	@Override
	public String toString() {
		return "UserVO [userNo=" + userNo + ", userEmail=" + userEmail + ", userPw=" + userPw + ", userGender="
				+ userGender + ", userName=" + userName + ", userStoreName=" + userStoreName + ", userPhone="
				+ userPhone + ", userZipcode=" + userZipcode + ", userAddress1=" + userAddress1 + ", userAddress2="
				+ userAddress2 + ", userStatus=" + userStatus + ", userWithdrawYmd=" + userWithdrawYmd
				+ ", userAuthFlag=" + userAuthFlag + ", userJoinYmd=" + userJoinYmd + ", userLastVisitDate="
				+ userLastVisitDate + "]";
	}
	
	
		
}
