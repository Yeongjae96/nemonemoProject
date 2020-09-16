package com.nemo.admin.main.service;

import com.nemo.admin.main.vo.DailyCountVO;

public interface DailyCountService {
	public int getDailyMemberCnt(DailyCountVO vo);
	public int getDailyQnaCnt(DailyCountVO vo);
	
}
