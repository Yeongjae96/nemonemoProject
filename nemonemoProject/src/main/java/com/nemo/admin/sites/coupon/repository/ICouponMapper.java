package com.nemo.admin.sites.coupon.repository;

import java.util.List;

import com.nemo.admin.sites.coupon.vo.CouponVO;
import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;

public interface ICouponMapper {
	public int insertCoupon(CouponVO vo);
	public int deleteCoupon(int couponNo);
	public int updateCoupon(CouponVO vo);
	public CouponVO getCoupon(int couponNo);
	public List<CouponVO> getCouponList(CouponVO vo);
}
