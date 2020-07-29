package com.nemo.admin.sites.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.NoticeDAO;
import com.nemo.admin.sites.notice.service.UpdateNoticeService;
import com.nemo.admin.sites.notice.vo.NoticeVO;

@Service
public class UpdateNoticeServiceImpl implements UpdateNoticeService{

	@Autowired private NoticeDAO noticeDAO;
	
	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeDAO.updateNotice(vo);
	}

}
