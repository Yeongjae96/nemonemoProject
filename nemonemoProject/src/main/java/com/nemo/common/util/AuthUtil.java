package com.nemo.common.util;

import com.nemo.common.constraints.ResponseResult;
import com.nemo.user.sign.signup.vo.UserBaseVO;

public class AuthUtil {
	
	/**
	 * 
	 * @메소드이름 : getCurrentUserNo
	 * @작성일 : 2020. 9. 7.
	 * @작성자 : Yeong
	 * @Param : 없음
	 * @return : 현재 접속한 유저 값 ( 없으면 -1 )
	 * @Method설명 : 현재 요청한 유저의 세션값을 조사하여 요청한 사용자의 userNo를 알아온다.
	 *
	 */
	public static int getCurrentUserNo() {
		UserBaseVO vo = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		return vo != null ? vo.getUserNo() : -1;
	}
	
	/**
	 * 
	 * @메소드이름 : getResponseStatus
	 * @작성일 : 2020. 9. 7.
	 * @작성자 : Yeong
	 * @Param :
	 * @param result
	 * @Method설명 : 결과값을 나타내는 ENUM을 String으로 변환하여 전송해준다.
	 *
	 */
	public static String getResponseStatus(ResponseResult result) {
		return result.getResult();
	}
	
}
