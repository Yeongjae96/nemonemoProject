
package com.nemo.admin.main.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DailyCountVO{
	
	private Date date;
	private int dailyMemberCnt;
	private int dailyQnaCnt;
	private int dailySales;
	private int dailyTransaction;

}