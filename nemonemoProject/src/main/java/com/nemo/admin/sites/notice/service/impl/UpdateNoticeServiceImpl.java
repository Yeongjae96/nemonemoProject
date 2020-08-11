package com.nemo.admin.sites.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.INoticeMapper;
import com.nemo.admin.sites.notice.repository.impl.NoticeMapper;
import com.nemo.admin.sites.notice.service.UpdateNoticeService;
import com.nemo.admin.sites.notice.vo.NoticeVO;

@Service
public class UpdateNoticeServiceImpl implements UpdateNoticeService{

	@Autowired
	private NoticeMapper noticeDAO;
	
	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeDAO.updateNotice(vo);
	}

}
