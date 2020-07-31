package com.nemo.admin.sites.notice.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.NoticeDAO;
import com.nemo.admin.sites.notice.service.InsertNoticeService;
import com.nemo.admin.sites.notice.vo.NoticeVO;

@Service
public class InsertNoticeServiceImpl implements InsertNoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		vo.setNoticeRegistryYmd(new Date(System.currentTimeMillis()));
		return noticeDAO.insertNotice(vo);
	}

}
