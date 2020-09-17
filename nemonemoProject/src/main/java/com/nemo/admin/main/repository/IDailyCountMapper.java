package com.nemo.admin.main.repository;

import com.nemo.admin.main.vo.DailyCountVO;

public interface IDailyCountMapper {
	
	public int getDailyMemberCnt(DailyCountVO vo);
	public int getDailyQnaCnt(DailyCountVO vo);
	public int getDailyPurchaseCnt(DailyCountVO vo);
	public int getDailyNewProductCnt(DailyCountVO vo);
}
