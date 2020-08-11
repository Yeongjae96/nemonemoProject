package com.nemo.admin.sites.notice.repository.impl;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.sites.notice.repository.INoticeMapper;
import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;


@Mapper
public interface NoticeMapper extends INoticeMapper {
	public int updateDelFl(AdminBaseNoticeVO vo);
}
