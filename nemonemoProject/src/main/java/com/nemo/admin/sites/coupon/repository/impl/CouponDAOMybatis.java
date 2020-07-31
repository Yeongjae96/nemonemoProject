package com.nemo.admin.sites.coupon.repository.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.admin.sites.coupon.repository.CouponDAO;
import com.nemo.admin.sites.coupon.vo.CouponVO;

@Repository
public class CouponDAOMybatis implements CouponDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertCoupon(CouponVO vo) {
		return session.insert("com.nemo.admin.sites.coupon.repository.impl.CouponDAOMybatis.insertCoupon", vo);
	}
	
	@Override
	public List<CouponVO> getCouponList(CouponVO vo) {
		List<CouponVO> list = session.selectList("com.nemo.admin.sites.coupon.repository.impl.CouponDAOMybatis.getCouponList", vo);
		return list;
	}

	@Override
	public int deleteCoupon(String couponCd) {
		return session.delete("com.nemo.admin.sites.coupon.repository.impl.CouponDAOMybatis.deleteCoupon", couponCd);
	}

	@Override
	public int updateCoupon(CouponVO vo) {
		return session.update("com.nemo.admin.sites.coupon.repository.impl.CouponDAOMybatis.updateCoupon", vo);
	}

	@Override
	public CouponVO getCoupon(String couponCd) {
		return session.selectOne("com.nemo.admin.sites.coupon.repository.impl.CouponDAOMybatis.getCoupon", couponCd);
	}
}
