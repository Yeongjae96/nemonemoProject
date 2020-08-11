package com.nemo.admin.sites.notice.repository;

import java.util.List;

import com.nemo.admin.sites.notice.vo.NoticeVO;

public interface INoticeMapper {
	public int insertNotice(NoticeVO vo);
	public int deleteNotice(int noticeNo);
	public int updateNotice(NoticeVO vo);
	public NoticeVO getNotice(int noticeNo);
	public List<NoticeVO> getNoticeList(NoticeVO vo);
}
