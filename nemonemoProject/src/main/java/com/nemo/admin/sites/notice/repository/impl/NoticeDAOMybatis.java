package com.nemo.admin.sites.notice.repository.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.admin.sites.notice.repository.NoticeDAO;
import com.nemo.admin.sites.notice.vo.NoticeVO;


@Repository
public class NoticeDAOMybatis implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		return session.insert("com.nemo.admin.sites.notice.repository.impl.NoticeDAOMybatis.insertNotice", vo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return session.delete("com.nemo.admin.sites.notice.repository.impl.NoticeDAOMybatis.deleteNotice", noticeNo);
	}

	@Override 
	public int updateNotice(NoticeVO vo) {
		return session.update("com.nemo.admin.sites.notice.repository.impl.NoticeDAOMybatis.updateNotice", vo);
	}

	@Override
	public NoticeVO getNotice(int noticeNo) {
		return session.selectOne("com.nemo.admin.sites.notice.repository.impl.NoticeDAOMybatis.getNotice", noticeNo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		List<NoticeVO> list = session.selectList("com.nemo.admin.sites.notice.repository.impl.NoticeDAOMybatis.getNoticeList", vo);
		return list;
	}

}
