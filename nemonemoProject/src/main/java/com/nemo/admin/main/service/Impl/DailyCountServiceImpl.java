package com.nemo.admin.main.service.Impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.main.repository.Impl.DailyCountMapper;
import com.nemo.admin.main.service.DailyCountService;
import com.nemo.admin.main.vo.DailyCountVO;

@Service
public class DailyCountServiceImpl implements DailyCountService{
	
	@Autowired
	private DailyCountMapper dailyCountMapper;

	Date today = new Date();
	
	@Override
	public int getDailyMemberCnt(DailyCountVO vo) {
		vo.setDate(today);
		return dailyCountMapper.getDailyMemberCnt(vo);
	}

	@Override
	public int getDailyQnaCnt(DailyCountVO vo) {
		vo.setDate(today);		
		return dailyCountMapper.getDailyQnaCnt(vo);
	}

	@Override
	public int getDailyPurchaseCnt(DailyCountVO vo) {
		vo.setDate(today);	
		return dailyCountMapper.getDailyPurchaseCnt(vo);
	}

	@Override
	public int getDailyNewProductCnt(DailyCountVO vo) {
		vo.setDate(today);	
		return dailyCountMapper.getDailyNewProductCnt(vo);
	}
	
	

}
