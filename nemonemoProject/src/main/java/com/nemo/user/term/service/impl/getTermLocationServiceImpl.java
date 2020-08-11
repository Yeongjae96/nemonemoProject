package com.nemo.user.term.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.term.repository.impl.TermMapper;
import com.nemo.user.term.service.getTermLocationService;
import com.nemo.user.term.vo.TermVO;



/**
 * @제목 : Term Service 클래스
 * @패키지이름 : com.nemo.user.term.service.impl
 * @파일이름 : TermServiceImpl.java
 * @작성일 : 2020. 8. 9
 * @이름 : Hyein
 * @프로그램설명 : Term 요청에 대한 서비스
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------		-------------	
 * 20.08.09			이혜인			초기설정
 */
@Service
public class getTermLocationServiceImpl implements getTermLocationService{
	
	@Autowired
	private TermMapper TermDAO;
	
	@Override
	public TermVO getTermLocation(String termTitle) {
		return TermDAO.getTermLocation(termTitle);
	}
}
