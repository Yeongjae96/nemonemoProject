package com.nemo.admin.sites.coupon.repository;

import java.util.List;

import com.nemo.admin.sites.coupon.vo.CouponVO;
import com.nemo.admin.sites.notice.vo.NoticeVO;

public interface CouponDAO {
	public int insertCoupon(CouponVO vo);
	public int deleteCoupon(String couponCd);
	public int updateCoupon(CouponVO vo);
	public CouponVO getCoupon(String couponCd);
	public List<CouponVO> getCouponList(CouponVO vo);
}
