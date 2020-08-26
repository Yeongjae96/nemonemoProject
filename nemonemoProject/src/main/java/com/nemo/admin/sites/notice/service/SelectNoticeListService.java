package com.nemo.admin.sites.notice.service;

import java.util.List;

import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;

public interface SelectNoticeListService {
	public List<AdminBaseNoticeVO> getNoticeList(AdminBaseNoticeVO vo);
}
