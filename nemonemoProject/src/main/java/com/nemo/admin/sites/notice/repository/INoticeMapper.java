package com.nemo.admin.sites.notice.repository;

import java.util.List;

import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;

public interface INoticeMapper {
	public int insertNotice(AdminBaseNoticeVO vo);
	public int deleteNotice(int noticeNo);
	public int updateNotice(AdminBaseNoticeVO vo);
	public AdminBaseNoticeVO getNotice(int noticeNo);
	public List<AdminBaseNoticeVO> getNoticeList(AdminBaseNoticeVO vo);
}
