package com.nemo.admin.sites.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.NoticeDAO;
import com.nemo.admin.sites.notice.service.DeleteNoticeService;

@Service
public class DeleteNoticeServiceImpl implements DeleteNoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDAO.deleteNotice(noticeNo);
	}

}
