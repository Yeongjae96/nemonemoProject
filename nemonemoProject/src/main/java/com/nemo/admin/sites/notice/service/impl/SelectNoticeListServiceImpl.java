package com.nemo.admin.sites.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.notice.repository.INoticeMapper;
import com.nemo.admin.sites.notice.repository.impl.NoticeMapper;
import com.nemo.admin.sites.notice.service.SelectNoticeListService;
import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;


@Service
public class SelectNoticeListServiceImpl implements SelectNoticeListService{

	@Autowired
	private NoticeMapper noticeDAO;
	
	@Override
	public List<AdminBaseNoticeVO> getNoticeList(AdminBaseNoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}
	
}
