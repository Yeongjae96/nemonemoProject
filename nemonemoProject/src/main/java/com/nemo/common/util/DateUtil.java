package com.nemo.common.util;

import java.util.Calendar;

/**
 * @제목 : 날짜 유틸
 * @패키지이름 : com.nemo.common.util
 * @파일이름 : DateUtil.java
 * @작성일 : 2020. 8. 10.
 * @이름 : Yeong
 * @프로그램설명 : 날짜 유틸
 */
public class DateUtil {
	 /**
	 * @메소드이름 : getDate
	 * @작성일 : 2020. 8. 10.
	 * @작성자 : Yeong
	 * @Param :
	 * @return
	 * @throws Exception :  
	 * @Method설명 : 현재 시간을 얻는다.
	 *
	 */
	public static long getDate() throws Exception{
	        Calendar  today = Calendar.getInstance();
	        long date = today.getTimeInMillis();
	        return date;
	    }


}
