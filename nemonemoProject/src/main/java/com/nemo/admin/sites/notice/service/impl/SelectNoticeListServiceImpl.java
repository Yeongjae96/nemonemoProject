package com.nemo.admin.sites.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.INoticeMapper;
import com.nemo.admin.sites.notice.repository.impl.NoticeMapper;
import com.nemo.admin.sites.notice.service.SelectNoticeListService;
import com.nemo.admin.sites.notice.vo.NoticeVO;


@Service
public class SelectNoticeListServiceImpl implements SelectNoticeListService{

	@Autowired
	private NoticeMapper noticeDAO;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}
	
}
