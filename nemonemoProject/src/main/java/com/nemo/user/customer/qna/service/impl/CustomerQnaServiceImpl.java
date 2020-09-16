package com.nemo.user.customer.qna.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.qna.vo.UserQnaResVO;
import com.nemo.common.paging.PageVO;
import com.nemo.common.paging.Pagination;
import com.nemo.user.customer.qna.repository.impl.CustomerQnaMapper;
import com.nemo.user.customer.qna.service.CustomerQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

@Service
public class CustomerQnaServiceImpl implements CustomerQnaService {

	@Autowired
	private CustomerQnaMapper customerQnaMapper;

	@Override
	public UserQnaResVO selectQnaList(UserBaseQnaVO vo, PageVO pageVO) {
		
		Pagination page = new Pagination(pageVO);
		int startNo = page.getStartPageNo();
		int endNo = page.getEndPageNo();
		
		Map<String, Object> qnaMapperParamMap = new HashMap<>();
		qnaMapperParamMap.put("startNo", startNo);
		qnaMapperParamMap.put("endNo", endNo);
		qnaMapperParamMap.put("userNo", vo.getQnaRegId());
		System.out.println("서비스 : " + vo);
	
		List<UserBaseQnaVO> arrList = customerQnaMapper.selectQnaList(qnaMapperParamMap); 
		
		PageVO returnPageVO = page.getCalcPageVO(arrList.size());
		UserQnaResVO res = new UserQnaResVO();
		res.setQnaVOList(arrList);
		res.setPageVO(returnPageVO);
		return res;
	}

}
