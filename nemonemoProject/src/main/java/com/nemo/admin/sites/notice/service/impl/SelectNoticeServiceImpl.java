package com.nemo.admin.sites.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.INoticeMapper;
import com.nemo.admin.sites.notice.repository.impl.NoticeMapper;
import com.nemo.admin.sites.notice.service.SelectNoticeService;
import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;


@Service
public class SelectNoticeServiceImpl implements SelectNoticeService {

	@Autowired
	private NoticeMapper noticeDAO;
	
	@Override
	public AdminBaseNoticeVO getNotice(int noticeNo) {

		return noticeDAO.getNotice(noticeNo);
	}

}
