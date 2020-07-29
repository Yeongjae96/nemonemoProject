package com.nemo.admin.sites.notice.service;

import java.util.List;

import com.nemo.admin.sites.notice.vo.NoticeVO;

public interface SelectNoticeListService {
	public List<NoticeVO> getNoticeList(NoticeVO vo);
}
