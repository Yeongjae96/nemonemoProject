package com.nemo.user.store.service.impl;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.InsertStoreCommentService;
import com.nemo.user.store.vo.StoreCommentVO;


@Service
public class InsertStoreCommentServiceImpl implements InsertStoreCommentService{

	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public int insertStoreComment(StoreCommentVO vo) {
		vo.setStoreCommentRegDt(new Date(System.currentTimeMillis()));
		return storeDAO.insertStoreComment(vo);
	}

}
